#!/usr/bin/env bash

# receiving postgresql server
nc -l 16666 | gunzip -c | psql -f – foo

# transmitting postgresql server
pg_dump -o foo | gzip -c -9 | nc  16666