#!/bin/bash

JAVA_JAR="run.jar"
PID_FILE="java.pid"

LOG_FILE="log.txt"
ERROR_LOG_FILE="error.txt"

echo "Kill Previous instance..."

kill -SIGTERM `cat ${PID_FILE}`

rm -f "${PID_FILE}"

echo "Starting Java..."

nohup java -Xmx512m -jar "${JAVA_JAR}" >"${LOG_FILE}" 2>"${ERROR_LOG_FILE}" &

JAVA_PID="$!"

echo "${JAVA_PID}" > "${PID_FILE}"
