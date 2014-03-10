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
        curl -s "http://m.cip.gatech.edu/api/buses/predict/$route?stop=$stop" | jq -c 'select(.query.results) | {created: .query.created, p: .query.results.buses[]} | {created: .created, p: .p.p, jobid: .p.jobid}' >> "$root/$route/$stop.json" &
    done
    sleep 1m
done
