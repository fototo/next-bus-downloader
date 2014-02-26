#!/bin/sh
IFS='
'
while true
do
    d=`date`
    buses=`curl -s http://m.cip.gatech.edu/api/buses/position | jq --raw-output '.[] | "\(.jobID)\t\(.speed)\t\(.plng)\t\(.plat)\t\(.lng)\t\(.lat)\t\(.color)\t\(.id)"'`
    for bus in $buses
    do
        echo -e "$d\t$bus"
    done
    sleep 50s
done
