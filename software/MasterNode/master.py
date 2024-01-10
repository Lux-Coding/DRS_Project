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


# Global data structure to store receiver data
data_store = {}

def toa_multilateration_solve(timestamps, microphone_coordinates, speed_of_sound=343.2):
    def error(x, c, t):
        return sum([(numpy.linalg.norm(x - c[i]) - speed_of_sound * t[i]) ** 2 for i in range(len(t))])

    x0 = numpy.zeros(2)  # Initial guess for 2D coordinates
    result_2d = minimize(error, x0, args=(microphone_coordinates, timestamps), method='Nelder-Mead')

    return result_2d.x
    # microphones = numpy.array([[0, 0], [0, 2], [2, 0], [2, 2]])  # 4 microphone coordinates
    # timestamps_list = [
    #     [1.5811/343.2, 0.7071/343.2, 2.12/343.2, 1.5811/343.2],  # Timestamps for the first set
    #   #  [2.0, 2.1, 2.2, 2.3],  # Timestamps for the second set
    # ]

def data_processing_thread(shared_data, data_event):
    while not shutdown_event.is_set():
        if data_event.wait(1):# Wait for the event to be set
            data_event.clear()  # Clear the event

            # Perform your calculations here
            calculate_something(shared_data) 
        
    


def calculate_something(shared_data):
    # Placeholder for your calculation logic
    print("Calculating something with the new data...")
    # Example: Print the latest data
    for mac, data in shared_data.items():
        print(f"MAC: {mac}, Data: {data}")

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
@app.route('/data', methods=['GET'])
def get_data():
    return jsonify(data_store)

# REST endpoint to configure parameters (example)
@app.route('/configure', methods=['POST'])
def configure_parameters():
    # Process incoming configuration parameters
    params = request.json
    # Add configuration logic here
    return jsonify({params})

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
