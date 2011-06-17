#!/usr/bin/env bash

ssh sahilcooner@192.168.3.2 -L 28400:localhost:28400 -N
synergyc -f localhost
