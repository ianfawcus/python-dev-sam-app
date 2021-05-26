#!/bin/bash

echo "Waiting for SAM to run Lambda on 3001..."

COUNT=0
while ! nc -z localhost 3001; do   
  sleep 0.5
  ((COUNT++))
  if [[ "$COUNT" -gt 20 ]]; then
    echo "Timed out waiting for Lambda to start"
    exit 1
  fi
done
 
echo "Lambda running"