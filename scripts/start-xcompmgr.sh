#!/usr/bin/env bash

COMPOSE_OPTS="-c -C -o0.2 -t1 -l1 -r2"

sleep 3
exec xcompmgr ${COMPOSE_OPTS}

