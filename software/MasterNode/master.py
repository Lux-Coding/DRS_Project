from flask import Flask, jsonify, request
import threading
import socket
import json
from multiprocessing import Manager
from listener import udp_server
from multiprocessing import Process, Event
import threading
from scipy.optimize import minimize
import numpy
import sys 
import signal

app = Flask(__name__)

pos_config = {  "00:00:00:00":[0, 0],   \
                "00:00:00:01":[0, 2],   \
                "00:00:00:02":[2, 0],   \
                "00:00:00:03":[2, 2],}
pos = [1,1]

def toa_multilateration_solve(timestamps, microphone_coordinates, speed_of_sound=343.2):
    def error(x, c, t):
        return sum([(numpy.linalg.norm(x - c[i]) - speed_of_sound * t[i]) ** 2 for i in range(len(t))])

    x0 = numpy.zeros(2)  # Initial guess for 2D coordinates
    result_2d = minimize(error, x0, args=(microphone_coordinates, timestamps), method='Nelder-Mead')

    print(result_2d.x)
    return result_2d.x.tolist()

def data_processing_thread(shared_data, data_event):
    while not shutdown_event.is_set():
        if data_event.wait(1):# Wait for the event to be set
            data_event.clear()  # Clear the event

            # Perform your calculations here
            calculate_pos(shared_data) 
        
    
def calculate_pos(shared_data):
    global pos
    print("Calculating pos with the new data...")

    try:
        mics = []
        timestamps = []
        for mac_address, coordinates in shared_data.items():
            print(f"MAC Address: {mac_address}, Coordinates: {coordinates}")
            mics.append(pos_config[mac_address])
            timestamps.append(shared_data[mac_address][0])
            
        print(mics)
        print(timestamps)

        if len(shared_data) >= 3:
            microphones = numpy.array(mics)  # 4 microphone coordinates
            pos = toa_multilateration_solve(timestamps, microphones)

    except Exception as e:
        print("Error, invalid mac addresse or no data" + str(e))


    # microphones = numpy.array([[0, 0], [0, 2], [2, 0], [2, 2]])  # 4 microphone coordinates
    # timestamps_list = [
    #     [1.5811/343.2, 0.7071/343.2, 2.12/343.2, 1.5811/343.2],  # Timestamps for the first set
    #   #  [2.0, 2.1, 2.2, 2.3],  # Timestamps for the second set
    # ]

  #  

# Start the UDP server in a separate process

def process_message():
    data = dict(shared_data)
    return data

def signal_handler(sig, frame):
    print('Exiting gracefully')
    # Terminate subprocesses here
    shutdown_event.set()
    udp_process.terminate()
    processing_thread.join()
    sys.exit(0)

# REST endpoint to get data
@app.route('/status', methods=['GET'])
def get_data():
    return jsonify(dict(shared_data))

# REST endpoint to get pos
@app.route('/pos', methods=['GET'])
def get_pos():
    global pos
    print(pos)
    return jsonify(list(pos))


# REST endpoint to configure parameters (example)
@app.route('/config', methods=['POST'])
def configure_parameters_post():
    global pos_config
    try:
        # Get JSON data from the request
        json_data = request.get_json()
        pos_config = {}
        # Update the data_dict with the received data
        for key, value in json_data.items():
            pos_config[key] = value
            print(pos_config)

        return jsonify({"status": "success"})
    except Exception as e:
        return jsonify({"status": "error", "message": str(e)})


# REST endpoint to configure parameters (example)
@app.route('/config', methods=['GET'])
def configure_parameters():
    return jsonify(pos_config)

# Main function to start the server and web application
if __name__ == '__main__':
    signal.signal(signal.SIGINT, signal_handler)
    p = Process(target=data_processing_thread)
    p.start()
    # Start the UDP server in a separate process
    manager = Manager()
    shared_data = manager.dict()
    data_received_event = Event()
    udp_process = Process(target=udp_server, args=(shared_data,data_received_event))
    udp_process.start()
    # Start the data processing thread
    shutdown_event = Event()
    processing_thread = threading.Thread(target=data_processing_thread, args=(shared_data, data_received_event))
    processing_thread.start()

    # start udp listener for data

    #start web server for GUI
    app.run(port=5000)  # Web server runs on port 5000

    # start the calculation thread
    data_processing_thread(shared_data, data_received_event)
