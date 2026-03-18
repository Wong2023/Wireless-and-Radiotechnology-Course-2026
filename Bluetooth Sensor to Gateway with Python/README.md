# Bluetooth Client–Server Sensor Simulation

## Project Description
This project implements a simple Bluetooth client–server application in Python using RFCOMM sockets.  
The system simulates an IoT sensor node (client) that sends temperature data every 5 seconds to a gateway device (server).

## Bluetooth MAC Address
Server MAC address used:
c0:35:32:07:95:00



## How to Run

### 1. Prepare
- Make sure both devices have Bluetooth enabled
- Pair the devices before running the program
- Install Python 3

### 2. Run Server (Device 1)
python server.py

### 3. Run Client (Device 2)
python client.py

Expected Output
Client:

Sent: Temperature: 22.8 C
Sent: Temperature: 23.4 C

Server:

Received: Temperature: 22.8 C
Received: Temperature: 23.4 C


Reflection

What did you learn?
I learned how Bluetooth socket communication works using RFCOMM in Python and how client–server architecture can be applied to IoT systems.

What was difficult?
Setting up Bluetooth connections and ensuring both devices were correctly paired and connected was the most challenging part.

Where could Bluetooth be useful in IoT?
Bluetooth is useful for short-range, low-power IoT devices such as wearable sensors, smart home devices, and health monitoring systems.

Difference Between Bluetooth and WiFi Socket Communication?
Bluetooth socket communication is used for short-range, direct device-to-device connections and requires pairing. It is energy-efficient but has limited range and speed.
WiFi socket communication works over IP networks, supports longer distances, higher data rates, and does not require pairing. It is more scalable but consumes more power.
