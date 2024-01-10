import socket
import json
from multiprocessing import Manager, Process, Event

def udp_server(shared_data: dict, data_received_event):
    udp_socket = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
    udp_socket.bind(('', 12345))  # Replace with the appropriate port

    while True:
        message, _ = udp_socket.recvfrom(1024)
        print(message)
        try:
            data = json.loads(message.decode())
            mac_address = data.get("MAC")
            timestamp = data.get("Timestamp")
            count = data.get("Count")
            if timestamp is not None and shared_data is not None and mac_address is not None:
                shared_data[mac_address] = [timestamp, count]
                data_received_event.set()  # Trigger the event
        except json.JSONDecodeError:
            print("Failed to decode JSON")

if __name__ == '__main__':
    with Manager() as manager:
        shared_data = manager.dict()
        data_received_event = Event()
        process = Process(target=udp_server, args=(shared_data, data_received_event))
        process.start()
        process.join()
