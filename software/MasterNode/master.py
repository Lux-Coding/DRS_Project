from flask import Flask, jsonify, request
import threading
import numpy
import sys
import signal
from multiprocessing import Process, Manager, Event
from scipy.optimize import minimize
from listener import udp_server

from flask_cors import CORS

# Configuration and global variables
app = Flask(__name__)

CORS(app)

pos_config = {
    "00:00:00:00": [0, 0],
    "00:00:00:01": [0, 2],
    "00:00:00:02": [2, 0],
    "00:00:00:03": [2, 2],
}
pos = [1, 1]

def toa_multilateration_solve(timestamps, microphone_coordinates, speed_of_sound=343.2):
    """
    Solves the Time of Arrival multilateration problem.
    
    Args:
    - timestamps: The timestamps of signals received.
    - microphone_coordinates: Coordinates of the microphones.
    - speed_of_sound: Speed of sound in the medium.

    Returns:
    - A list of calculated 2D coordinates.
    """
    def error(x, c, t):
        return sum([(numpy.linalg.norm(x - c[i]) - speed_of_sound * t[i]) ** 2 for i in range(len(t))])

    x0 = numpy.zeros(2)  # Initial guess for 2D coordinates
    result_2d = minimize(error, x0, args=(microphone_coordinates, timestamps), method='Nelder-Mead')
    return result_2d.x.tolist()


def data_processing_thread():
    while not shutdown_event.is_set():
        if data_received_event.wait(1):
            data_received_event.clear()
            try:
                calculate_pos()
            except Exception as e:
                print(f"Error in data processing: {e}")


def calculate_pos():
    global pos
    print("Calculating position with the new data...")

    try:
        mics, timestamps = zip(*[(pos_config[mac_address], shared_data[mac_address][0])
                                 for mac_address in shared_data if mac_address in pos_config])
        if len(shared_data) >= 3:
            microphones = numpy.array(mics)
            pos = toa_multilateration_solve(timestamps, microphones)
    except KeyError as e:
        print(f"Invalid MAC address: {e}")
    except Exception as e:
        print(f"Error in position calculation: {e}")


@app.route('/status', methods=['GET'])
def get_data():
    return jsonify(dict(shared_data))


@app.route('/pos', methods=['GET'])
def get_pos():
    return jsonify(list(pos))


@app.route('/config', methods=['POST'])
def configure_parameters_post():
    global pos_config
    try:
        json_data = request.get_json()
        pos_config = {key: value for key, value in json_data.items()}
        return jsonify({"status": "success"})
    except Exception as e:
        return jsonify({"status": "error", "message": str(e)})


@app.route('/config', methods=['GET'])
def configure_parameters():
    return jsonify(pos_config)


def signal_handler(sig, frame):
    print('Exiting gracefully')
    shutdown_event.set()
    udp_process.terminate()
    processing_thread.join()
    sys.exit(0)


if __name__ == '__main__':
    signal.signal(signal.SIGINT, signal_handler)

    manager = Manager()
    shared_data = manager.dict()
    data_received_event = Event()
    shutdown_event = Event()

    udp_process = Process(target=udp_server, args=(shared_data, data_received_event))
    udp_process.start()
    processing_thread = threading.Thread(target=data_processing_thread)
    processing_thread.start()
    app.run(port=5000)
