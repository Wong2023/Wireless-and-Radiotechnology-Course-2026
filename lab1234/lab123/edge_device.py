import socket
import paho.mqtt.client as mqtt

# TCP server settings
HOST = "172.20.10.3" 
PORT = 5000

# MQTT settings
broker = "broker.emqx.io"
topic = "arsenii/iot/temperature"

# MQTT client
mqtt_client = mqtt.Client()
mqtt_client.connect(broker, 1883, 60)
mqtt_client.loop_start()

# TCP server
server = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
server.bind((HOST, PORT))
server.listen()

print("Waiting for sensor connection...")

conn, addr = server.accept()
print("Connected:", addr)

while True:

    data = conn.recv(1024)

    if not data:
        break

    value = data.decode()
    print("Sensor data:", value)

    # publish to MQTT
    mqtt_client.publish(topic, value)
    print("Published to MQTT:", value)

conn.close()