import os
import socket
import struct
import json
import time

def get_mac_address(interface='your_eth_device'):
    try:
        mac = open('/sys/class/net/{}/address'.format(interface)).read()
    except FileNotFoundError:
        mac = "00:00:00:00:00:00"
    return mac.strip()

def send_udp(timestamp, mac_address, count, host='your_udp_server_ip', port=12345):
    try:
        # Create a UDP socket
        udp_socket = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)

        # Create a dictionary with the desired data
        data_dict = {
            "MAC": mac_address,
            "Timestamp": timestamp,
            "Count": count
        }

        # Convert the dictionary to a JSON string
        json_data = json.dumps(data_dict)

        # Send the JSON data over UDP
        udp_socket.sendto(json_data.encode('utf-8'), (host, port))

        # Close the socket
        udp_socket.close()
    except Exception as e:
        print(f"Error sending UDP packet: {e}")

def main():
    char_device_path = '/dev/receiver'
    eth_device_name = 'eth0'
    udp_server_ip = '10.27.98.104'
    udp_server_port = 12345

    try:
        with open(char_device_path, 'rb') as char_device:
            count = 1  # You can modify this based on your requirement
            while True:
                # Read the Linux timestamp from the character device
                timestamp_bytes = char_device.read(8)
                #if not timestamp_bytes:
                #    break  # Exit if the device is closed

                # Unpack the binary data into a timestamp (Q = unsigned long long)
                timestamp = struct.unpack('Q', timestamp_bytes)[0]

                # Get the MAC address of the Linux device
                mac_address = get_mac_address(eth_device_name)

                # Send the data in JSON format via UDP
                print(timestamp, mac_address, count, udp_server_ip, udp_server_port)
                send_udp(timestamp, mac_address, count, udp_server_ip, udp_server_port)
                count = count + 1
                time.sleep(1)
    except FileNotFoundError:
        print(f"Error: {char_device_path} not found.")
    except KeyboardInterrupt:
        print("Script terminated by user.")
    except Exception as e:
        print(f"An error occurred: {e}")

if __name__ == "__main__":
    main()
 
