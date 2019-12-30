#!/usr/bin/env bash

PID_FILE=youtube.pid

kill -9 `cat ${PID_FILE}`

java -jar youtube.jar 2> error.log > output.log &
PID=$!

echo ${PID} > ${PID_FILE}
