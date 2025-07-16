#!/usr/bin/env bash

############ Variables ############
enable_battery=false
battery_charging=false

####### Check availability ########
# use full path for 'cat' and 'head'
for battery in /sys/class/power_supply/*BAT*; do
  if [[ -f "$battery/uevent" ]]; then
    enable_battery=true
    if [[ "$(/run/current-system/sw/bin/cat /sys/class/power_supply/*/status | /run/current-system/sw/bin/head -1)" == "Charging" ]]; then
      battery_charging=true
    fi
    break
  fi
done

############# Output #############
if [[ $enable_battery == true ]]; then
  if [[ $battery_charging == true ]]; then
    /run/current-system/sw/bin/echo -n "(+) "
  fi
  /run/current-system/sw/bin/echo -n "$(/run/current-system/sw/bin/cat /sys/class/power_supply/*/capacity | /run/current-system/sw/bin/head -1)"%
  if [[ $battery_charging == false ]]; then
    /run/current-system/sw/bin/echo -n " remaining"
  fi
fi

/run/current-system/sw/bin/echo ''
