#!/bin/bash
SAM_PID=$(ps -ef | awk '/bin\/sam local start-lambda/ {print $2}')
echo "killing PID $SAM_PID"
kill $SAM_PID