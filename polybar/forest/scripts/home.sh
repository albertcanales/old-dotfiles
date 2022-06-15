#!/bin/bash

WG_INTERFACE="home"


if [[ $(nmcli | grep "${WG_INTERFACE}:") ]]; then
    echo "%{F#4DD0E1}ﳏ%{F#93A1A1}"
else
    echo "ﳏ"
fi
