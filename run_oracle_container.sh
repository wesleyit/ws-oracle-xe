#!/bin/bash

## Be unique
docker rm -f oracle 2> /dev/null

## Run, Forrest, Run!
docker run -d \
	--name oracle \
	--hostname oracle \
	-p 8080:8080 \
	-p 1521:1521 \
	cs-oracle-xe

## Show me the truth
sleep 5
docker ps -a
docker logs oracle
