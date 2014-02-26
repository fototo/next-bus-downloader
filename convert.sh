#!/bin/sh
root="$HOME/public_html/buses"
search=`cat stops.json | jq --raw-output '.[] | "\(.route_id)-\(.stop_id)"'`
for line in $search
do
    route=`echo "$line" | cut -d "-" -f 1`
    stop=`echo "$line" | cut -d "-" -f 2`
    if [ -e "$root/$route/$stop.tsv" ]
    then
        echo "converting $root/$route/$stop.tsv"
        python convert.py "$root/$route/$stop.tsv" "$root/$route/$stop.json" 
    fi
done
