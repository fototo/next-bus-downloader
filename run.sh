#!/bin/bash
source env/bin/activate
echo "Starting position download..."
nohup python get-positions.py >> ~/public_html/positions.json &
echo "Starting routes download..."
nohup bash get-preds.sh &
echo "Everything is going."

