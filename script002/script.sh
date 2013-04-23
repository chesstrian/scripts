#!/usr/bin/bash

dir="/var/spool/asterisk/monitor/2013/"
month="03/"

for day in `seq 15 31`; do
  cd $dir$month$day
  for ext in "1000" "1001" "1002" "1003"; do
    if [[ `ls $dir$month$day | grep "\-$ext\-" | wc -l` -gt 0 ]]; then
      cp `ls $dir$month$day | grep "\-$ext\-"` /root/inc-00185779/$ext
    fi
  done
done

exit 0
