#!/bin/bash

outputDirectory=ical

if [[ "$HORARIUS_KEY" ]]; then
    echo "variable exist"
else
    echo 'no variable'
fi

url="https://www.gegi.usherbrooke.ca/horarius/icalendar?key=$HORARIUS_KEY"
curl $url -o $outputDirectory/cal.ics

cat $outputDirectory/cal.ics
