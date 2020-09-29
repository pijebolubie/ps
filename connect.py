#!/usr/bin/env python
import pika

connection = pika.BlockingConnection(pika.ConnectionParameters('192.168.0.234'))
channel = connection.channel()
channel.queue_declare(queue='user.created')
channel.basic_publish(exchange='',
                      routing_key='user.created',
                      body='Hello World!')
print(" [x] Sent 'Hello World!'")
connection.close()