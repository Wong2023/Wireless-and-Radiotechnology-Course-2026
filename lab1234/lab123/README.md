Project Overview
================

This folder contains small examples for monitoring and alerting using sockets and MQTT.

Files
-----
- `edge_device.py`: Example edge device logic that collects sensor data and forwards it (socket/MQTT).
- `mqtt_alert_subscriber.py`: Subscriber that listens for alert topics and handles/dispatches alerts.
- `mqtt_publisher.py`: Publishes sensor readings or alerts to MQTT topics.
- `mqtt_subscriber.py`: Generic MQTT subscriber example for receiving sensor data.
- `socket_sensor.py`: Simple TCP/UDP sensor simulator that sends raw sensor readings over sockets.
- `socket_server.py`: Socket server that accepts sensor connections and forwards or logs readings.

Why MQTT is useful for monitoring & alert systems in IoT
-----------------------------------------------------
- Lightweight and low-bandwidth: ideal for constrained devices and mobile networks.
- Publish/subscribe model: decouples producers and consumers so many subscribers can receive updates without direct connections.
- Quality of Service (QoS) levels: simple control over delivery guarantees for critical alerts.
- Retained messages & Last Will: provide latest state snapshots and notify on unexpected disconnects.
- Efficient over unreliable networks: small packets and keep-alives reduce overhead and improve reliability.
- Scalable and flexible: brokers can route messages to many subscribers, enabling easy fan-out and integrations.

How to use
----------
Run the publisher or socket simulator to send sample data, then start the appropriate subscriber to receive alerts or readings. Use `mqtt_publisher.py` with an MQTT broker (e.g., Mosquitto) for MQTT flows, or use `socket_sensor.py`/`socket_server.py` for direct socket examples.


+------------------+
|  Sensor Device   |
|  (socket_sensor) |
+------------------+
          |
          | TCP Socket
          v
+------------------+
|   Edge Server    |
|  (socket_server) |
+------------------+
          |
          | MQTT Publish
          v
+------------------+
|   MQTT Broker    |
|   broker.emqx.io |
+------------------+
          |
          | MQTT Subscribe
          v
+------------------+
| Cloud Subscriber |
| (mqtt_subscriber)|
+------------------+


IP Addresses Used
Device	IP Address	Role
Laptop 1	172.20.10.3	Edge Server
Laptop 2	172.20.10.9	Sensor / Publisher
MQTT Broker	broker.emqx.io	Public MQTT Broker

MQTT Topic Used
arsenii/iot/temperature

This topic is used to publish temperature sensor data from the edge device to the MQTT broker and receive it on the cloud subscriber.
