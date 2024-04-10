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
curl $url -o $outputDirectory/cal.ics --insecure
dos2unix $outputDirectory/cal.ics

#Ensure DTSTAMP is stable
sed -i "s/DTSTAMP.*/DTSTAMP:20220825T000000Z/" $outputDirectory/cal.ics

#Generate csv from ics
awk -f ics2csv.awk $outputDirectory/cal.ics > $outputDirectory/cal.csv
sort --general-numeric-sort --output $outputDirectory/cal.csv{,} # Sort but ensure header row stay on top. Use Brace expansion to avoid repeating file name.

#Generate no-colors ics file
sed "/^COLOR/d" $outputDirectory/cal.ics > $outputDirectory/cal-nocolor.ics

#Generate busy ics file
sed -r "/(COLOR|LOCATION|SUMMARY)/d" $outputDirectory/cal.ics > $outputDirectory/cal-busy.ics
sed -i "s/^DESCRIPTION.*/DESCRIPTION:/" $outputDirectory/cal-busy.ics

echo "$0 done!"
