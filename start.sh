!#/bin/bash
#podniesienie noda 1
docker run -d --name="rabbit1" --hostname="rabbit1" -e RABBITMQ_ERLANG_COOKIE="secret string" -e RABBITMQ_NODENAME="rabbit1" --volume=rabbitmq.config:/etc/rabbitmq/rabbitmq.config --volume=definitions.json:/etc/rabbitmq/definitions.json --publish="4369:4369" --publish="5671:5671" --publish="5672:5672" --publish="15672:15672" --publish="25672:25672" rabbitmq:3-management
#odczekanie chwili
sleep 20
#uruchomienie noda 2
docker run -d --name="rabbit2" --hostname="rabbit2" -e RABBITMQ_ERLANG_COOKIE="secret string" -e RABBITMQ_NODENAME="rabbit2" --volume=rabbitmq.config:/etc/rabbitmq/rabbitmq.config --volume=definitions.json:/etc/rabbitmq/definitions.json --link="rabbit1:rabbit1" rabbitmq:3-management
#odczekanie
sleep 20
#podniesienie noda 3
docker run -d --name="rabbit3" --hostname="rabbit3" -e RABBITMQ_ERLANG_COOKIE="secret string" -e RABBITMQ_NODENAME="rabbit3" --volume=rabbitmq.config:/etc/rabbitmq/rabbitmq.config --volume=definitions.json:/etc/rabbitmq/definitions.json --link="rabbit1:rabbit1" --link="rabbit2:rabbit2" rabbitmq:3-management
