#!/bin/bash
while true
do 
    # ps --sort=pcpu -eo cmd -h | head -n 1 | cut -b -15 | xargs
    # ps -eo cmd --sort=-%cpu -A --no-headers | head -n 1 | sed -E "s/(\/.+)+\/(.+)/\2/" | cut -b -15 | xargs
    ps -eo cmd --sort=-%cpu -A --no-headers | head -n 1 |  cut -f 1 -d " " | grep -Eo "[^\/]+" | tail -n 1
    sleep 5 
done
