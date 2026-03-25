import paho.mqtt.client as mqtt
import random
import time


broker = "broker.emqx.io"


temp_topic = "arsenii/iot/temperature"
humidity_topic = "arsenii/iot/humidity"
light_topic = "arsenii/iot/light"


client = mqtt.Client()


client.connect(broker, 1883)

while True:

  
    temperature = round(random.uniform(20, 35), 2)

   
    humidity = random.randint(30, 80)

    light = random.randint(100, 1000)

    client.publish(temp_topic, temperature)
    client.publish(humidity_topic, humidity)
    client.publish(light_topic, light)

    print("Temperature:", temperature, "°C")
    print("Humidity:", humidity, "%")
    print("Light:", light, "lux")
    print("--------------------")

    time.sleep(5)
