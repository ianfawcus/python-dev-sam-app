#!/bin/bash

echo "Waiting for SAM to run Lambda on 3001..."

while ! nc -z localhost 3001; do   
  sleep 0.5 # wait for 1/10 of the second before check again
done
 
echo "Lambda running"