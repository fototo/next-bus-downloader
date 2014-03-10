#!/bin/sh
IFS='
'
while true
do
    d=`date`
    buses=`curl -s http://m.cip.gatech.edu/api/buses/position | jq --raw-output '.[] | {jobID, speed, plng, plat, lng, lat, color, id}'`
    for bus in $buses
    do
        echo -e "$d\t$bus"
    done
    sleep 50s
done
