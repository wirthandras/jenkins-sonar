#!/usr/bin/env bash

sudo chmod a+rw /var/run/docker.sock
docker-compose up -d --build
