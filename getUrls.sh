#!/bin/bash

# A better class of script...
set -o errexit      # Exit on most errors (see the manual)
set -o errtrace     # Make sure any error trap is inherited
set -o nounset      # Disallow expansion of unset variables
set -o pipefail     # Use last non-zero exit code in a pipeline

outputDirectory="data"
mkdir -p $outputDirectory

url="https://www.gegi.usherbrooke.ca/horarius/icalendar?key=$HORARIUS_KEY"
curl $url -o $outputDirectory/cal.ics
sed -i "s/DTSTAMP.*/DTSTAMP:20220825T000000Z/" $outputDirectory/cal.ics
