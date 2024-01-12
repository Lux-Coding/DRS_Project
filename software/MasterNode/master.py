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


def calculate_time_differences(timestamps):
    """
    Calculate the time differences between a list of timestamps in nanoseconds.

    :param timestamps: A list of timestamps in 64-bit nanoseconds format.
    :return: A list of time differences in seconds, relative to the lowest timestamp.
    """
    min_timestamp = min(timestamps)

    timestamps = [(ts - min_timestamp) for ts in timestamps] 
    #print(timestamps)
    # Convert nanosecond timestamps to seconds
    timestamps_in_seconds = [(ts / 1000000) for ts in timestamps]

    # Find the lowest timestamp
   

    # Calculate differences from the lowest timestamp
    #time_differences = [ts - min_timestamp for ts in timestamps_in_seconds]

    return timestamps_in_seconds


def tdoa_solve(delays_to_stations, stations_coordinates):
    # inspired by https://www.ece.ucf.edu/seniordesign/sp2019su2019/g04/Docs/CONFERENCEPAPER.pdf
    list(numpy.array(stations_coordinates))
    def error(x, c, d):
        value = sum([(numpy.linalg.norm(x - c[i]) - numpy.linalg.norm(x - c[0]) - 331.3 * (d[i] - d[0])) ** 2 for i in range(1, len(d))])
#         print((x, value))
        return value
    x0 = numpy.array([1,1])
    return minimize(error, x0, args=(stations_coordinates, delays_to_stations), method='Nelder-Mead').x.tolist()


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
            print(timestamps, microphones)
            pos = tdoa_solve(calculate_time_differences(timestamps), microphones)
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
    app.run(host="0.0.0.0", port=5000)
