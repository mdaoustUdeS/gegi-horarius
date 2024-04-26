BEGIN{
    FS=":"
    OFS=","
    print "DTSTART", "DTEND", "LOCATION", "SUMMARY", "DESCRIPTION"
}

/^BEGIN:VEVENT/{
    DTSTART=DTEND=LOCATION=SUMMARY=DESCRIPTION=""
}

$1~"^DTSTART.*"{DTSTART=dateConv($2)}
$1~"^DTEND.*"{DTEND=dateConv($2)}
$1=="LOCATION"{LOCATION=$2}
$1=="SUMMARY"{SUMMARY=substr($0,index($0,$2))}
$1=="DESCRIPTION"{DESCRIPTION=substr($0,index($0,$2))}

/^END:VEVENT/{
    print DTSTART,DTEND,
    "\""LOCATION"\"",
    "\""SUMMARY"\"",
    "\""DESCRIPTION"\""
}

function dateConv(x) {
YY=substr(x, 1, 4)
MM=substr(x, 5, 2)
DD=substr(x, 7, 2)
hh=substr(x, 10, 2)
mm=substr(x,12, 2)
ss=substr(x,14, 2)
return YY"-"MM"-"DD" "hh":"mm
}
