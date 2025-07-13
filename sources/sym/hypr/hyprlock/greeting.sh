#!/usr/bin/env bash

current_hour=$(date +"%H")
# user_string="<span color='$primaryHex'>$USER</span>"

if [ "$current_hour" -ge 5 ] && [ "$current_hour" -lt 12 ]; then
    echo -n "Ohayō, "
elif [ "$current_hour" -ge 12 ] && [ "$current_hour" -lt 18 ]; then
    echo -n "Konnichiwa, "
elif [ "$current_hour" -ge 18 ] && [ "$current_hour" -lt 22 ]; then
    echo -n "Konbanwa, "
else
    echo -n "Oyasumi, "
fi
echo -n $USER

echo ''
