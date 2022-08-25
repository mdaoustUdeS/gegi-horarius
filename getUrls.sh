#!/bin/bash

outputDirectory=ical

env

url="https://www.gegi.usherbrooke.ca/horarius/icalendar?key=$HORARIUS_KEY"
curl $url -o $outputDirectory/cal.ics

cat $outputDirectory/cal.ics
