#!/bin/bash

outputDirectory=ical

url="https://www.gegi.usherbrooke.ca/horarius/icalendar?key=$HORARIUS_KEY"
curl $url -o $outputDirectory/cal.ics
sed -i "s/DTSTAMP.*/DTSTAMP:20220825T000000Z/" $outputDirectory/cal.ics
