IoT Monitoring Dashboard with Multiple Sensors
System Description

This project implements a simple IoT monitoring system using Python, MQTT, and Grafana.

The system simulates multiple sensors that send data through an MQTT broker. Grafana subscribes to the MQTT topics and visualizes the sensor values in real time.

Sensor data is generated in Python and published to the public MQTT broker broker.emqx.io. Grafana then displays the incoming data in a dashboard.

Sensors Used

The system simulates three sensors.

Temperature Sensor

The temperature sensor generates random values between 20°C and 35°C.
The values are published every 5 seconds.

Humidity Sensor

The humidity sensor generates values between 30% and 80%, simulating environmental humidity.

Light Sensor

The light sensor simulates ambient light intensity between 100 and 1000 lux.

MQTT Topics Used

Each sensor publishes its data to a separate MQTT topic.

Temperature topic

arsenii/iot/temperature

Humidity topic

arsenii/iot/humidity

Light topic

arsenii/iot/light

The MQTT broker used in this project is:

broker.emqx.io
Grafana Dashboard

The Grafana dashboard displays real-time sensor values using multiple panels.

Temperature Panel

Displays temperature values using a Time Series graph, showing how the temperature changes over time.

Humidity Panel

Displays humidity values using a Gauge visualization.

Light Panel

Displays the current light intensity using a Gauge visualization with the unit lux.

Dashboard Layout

The dashboard panels are arranged as follows:

-------------------------------------
| Temperature Graph                 |
-------------------------------------
| Humidity | Light                  |
-------------------------------------

The temperature panel is placed at the top and spans the full width of the dashboard.
Humidity and light panels are placed below it side by side.

This layout allows easy monitoring of multiple sensor values at the same time.

Reflection Question

Why do we separate each sensor into a different MQTT topic?

Separating sensors into different MQTT topics makes the system more organized and flexible. Each sensor publishes its data independently, 
and subscribers can choose to receive only the topics they need. This also makes the system easier to scale when new sensors are added.
