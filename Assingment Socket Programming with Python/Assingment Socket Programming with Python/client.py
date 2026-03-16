import socket
import random
import time

HOST = "127.0.0.1"
PORT = 5000

client = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
client.connect((HOST, PORT))

while True:

    temperature = round(random.uniform(20, 30), 1)

    message = f"Temperature: {temperature} C"

    client.send(message.encode())

    print("Sent:", message)

    time.sleep(5)