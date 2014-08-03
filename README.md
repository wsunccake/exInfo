exInfo
======

get host id:
  for linux command:
    hostid

get current date:
  for linux command:
    date +"%Y%m%d"

hex to dec:
  for linux command:
    echo "ibase=16; `hostid | tr '[:lower:]' '[:upper:]'`" | bc
  for perl:
    perl -le 'print hex(`hostid`);'
