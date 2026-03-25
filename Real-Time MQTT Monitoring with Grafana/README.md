Grafana Dashboard

A Grafana dashboard was created to visualize the MQTT sensor data in real time.

The system publishes temperature values to the MQTT topic:

arsenii/iot/temperature

Grafana is connected to the MQTT broker:

broker.emqx.io

A single panel was created in the dashboard to display the incoming temperature data.

Panel configuration:

Data source: MQTT
Topic: arsenii/iot/temperature
Visualization: Time series
Unit: °C

The panel shows the temperature values published by the sensor every few seconds.
This allows real-time monitoring of the simulated IoT temperature sensor.

Note that the MQTT data source in Grafana is used only for live monitoring. It does not store historical data unless an additional storage system is used.

Reflection Questions

1. What is the role of Grafana in this system?
Grafana is used to visualize the sensor data in real time. It subscribes to the MQTT topic and displays the incoming temperature values on a dashboard panel, allowing users to monitor the system easily.

2. Why is MQTT useful for monitoring applications?
MQTT is useful for monitoring because it is lightweight and designed for sending small messages between devices. It uses a publish/subscribe model, which allows sensors to send data and multiple systems to receive it efficiently.

3. What is the difference between live monitoring and historical storage?
Live monitoring shows data as it arrives in real time but does not save it. Historical storage keeps the data in a database so it can be viewed later, analyzed, and used to create long-term graphs and reports.
