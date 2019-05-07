#!/bin/bash

#go/bin/go run main.go "./www"  2>logs/server.log &
./llserver "./www"  2>logs/server.log &
