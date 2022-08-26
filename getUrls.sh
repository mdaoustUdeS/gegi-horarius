#!/bin/bash

# A better class of script...
set -o errexit      # Exit on most errors (see the manual)
set -o errtrace     # Make sure any error trap is inherited
set -o nounset      # Disallow expansion of unset variables
set -o pipefail     # Use last non-zero exit code in a pipeline

# Setup folder
outputDirectory="data"
mkdir -p $outputDirectory

#Download icalendar file
url="https://www.gegi.usherbrooke.ca/horarius/icalendar?key=$HORARIUS_KEY"
curl $url -o $outputDirectory/cal.ics
dos2unix $outputDirectory/cal.ics

#Ensure DTSTAMP is stable
sed -i "s/DTSTAMP.*/DTSTAMP:20220825T000000Z/" $outputDirectory/cal.ics

#Generate csv from ics
awk -f ics2csv.awk $outputDirectory/cal.ics > $outputDirectory/cal.csv
sort -o $outputDirectory/cal.csv{,}

echo "$0 done!"
