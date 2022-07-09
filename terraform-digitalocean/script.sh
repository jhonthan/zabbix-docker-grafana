#!/bin/bash

# Executar Docker Compose
#docker-compose up -d
docker-compose --env-file /tmp/.env -f /tmp/docker-compose.yaml up -d
