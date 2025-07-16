#!/usr/bin/env bash

# use full path for 'date' and 'echo'
current_hour=$(/run/current-system/sw/bin/date +"%H")
# user_string="<span color='$primaryHex'>$USER</span>" # $USER is usually reliable, but good to know its source

if [ "$current_hour" -ge 5 ] && [ "$current_hour" -lt 12 ]; then
    /run/current-system/sw/bin/echo -n "Ohayō, "
elif [ "$current_hour" -ge 12 ] && [ "$current_hour" -lt 18 ]; then
    /run/current-system/sw/bin/echo -n "Konnichiwa, "
elif [ "$current_hour" -ge 18 ] && [ "$current_hour" -lt 22 ]; then
    /run/current-system/sw/bin/echo -n "Konbanwa, "
else
    /run/current-system/sw/bin/echo -n "Oyasumi, "
fi
/run/current-system/sw/bin/echo -n "$USER" # quote $USER to be safe if it ever contains spaces

/run/current-system/sw/bin/echo ''
