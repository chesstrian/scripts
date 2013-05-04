#!/usr/bin/env bash

basetime=$(date +%s%N)

function user_info {
  if [[ -z $2 ]]; then
    exit 1
  else
    n_files=$(tree /home/$1 | tail -1 | cut -d' ' -f3)
    bytes=$(du -s /home/$1 | cut -f1)
    echo "Directorio /home/"$1
    if [[ $2 -eq 1 ]]; then
      echo $n_files" "$bytes
    else
      echo "Última conexión: "`last $1 | head -1 | awk '{print $5,$6,$7;}'`
      echo "Últimos 5 comandos: "
      while read line
      do
        echo " $ "$line
      done < <(tail -5 /home/$1/.bash_history)
      echo "Hay "$n_files" ficheros y ocupan "$bytes" bytes"
    fi
  fi
}

flag_s=0
flag_u=0
flag_t=0
flag_x=0

setrun=1
waittime=00:00

while getopts "sxu:t:" OPTION
do
  case $OPTION in
    s)  flag_s=1;;
    u)  flag_u=1 && user=$OPTARG;;
    t)  flag_t=1 && waittime=$OPTARG;;
    x)  flag_x=1;;

    \?) exit 1;;
  esac
done

# First Time
if [[ $flag_u -eq 1 ]]; then
  user_info $user $flag_s
else
  for users in `ls /home/`; do
    user_info $users $flag_s
  done
fi

while [[ true ]]; do
  if [[ $setrun -eq 1 ]]; then
    hours=${waittime:0:2}
    minutes=${waittime:3}
    nextrun=$(date --date='+'$hours' hours '$minutes' minutes')
    setrun=0
  fi

  now=$(date)
  if [[ $nextrun = $now ]]; then
    if [[ $flag_u -eq 1 ]]; then
      user_info $user $flag_s
    else
      for users in `ls /home/`; do
        user_info $users $flag_s
      done
    fi

    if [[ flag_x -eq 1 ]]; then
      echo "Time duration: $(echo "scale=3;($(date +%s%N) - ${basetime})/(1*10^09)" | bc)  millisecs."
    fi

    setrun=1
  fi

  if [[ $flag_t -eq 0 ]]; then
    break
  fi
done

exit 0
