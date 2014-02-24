#!/bin/sh
root="$HOME/public_html/buses"
search=`cat stops.json | jq --raw-output '.[] | "\(.route_id)-\(.stop_id)"' | awk '/red/ {print $0}'`
while true; do
    for line in $search
    do
        route=`echo "$line" | cut -d "-" -f 1`
        stop=`echo "$line" | cut -d "-" -f 2`
        echo "finding $route/$stop"
        [ -d "$root/$route" ] || mkdir -p "$root/$route"
        curl -s "http://m.cip.gatech.edu/api/buses/predict/$route?stop=$stop" | jq --raw-output 'select(.query.results) | "\(.query.created)\t\(.query.results.p)\t\(.query.results.buses)"' >> "$root/$route/$stop.tsv"
    done
    sleep 3m
done
