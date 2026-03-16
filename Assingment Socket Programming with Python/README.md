# TCP Socket Communication in Python

## Project Description

This project demonstrates basic TCP socket communication using Python.  
A server waits for a client connection and receives sensor-like data.  
The client simulates a temperature sensor and sends random temperature values to the server every 5 seconds.

## How to Run

1. Start the server

2. Start the client (in another terminal)

The client will connect to the server and start sending temperature data every 5 seconds.

Example message:
Temperature: 23.5 C

## Test Results

### Test 1 — Localhost (same computer)

Client output:
Sent: Temperature: 22.4 C
Sent: Temperature: 23.1 C
Sent: Temperature: 21.9 C

Server output:
Server is waiting for connection...
Connected to: ('127.0.0.1', 53142)
Received: Temperature: 22.4 C
Received: Temperature: 23.1 C
Received: Temperature: 21.9 C


### Test 2 — Second Device (same WiFi)

Server IP example:

192.168.1.15
Client successfully connected and sent temperature data every 5 seconds.

IMPORTANT TO KNOW (I modified and tried the connection between my two laptops unders my home WiFi and it is working, but in github repository I submitted first code, which is only for one laptop)
