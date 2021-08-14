TOUCHPAD_ID=20

enabled_line=$(xinput list-props $TOUCHPAD_ID | grep "Device Enabled")
if [[ $enabled_line ]]; then
    if [[ $(echo $enabled_line | grep ":*1") != "" ]]; then
        xinput set-prop $TOUCHPAD_ID "Device Enabled" 0
        notify-send -u low "Touchpad disabled"
    else
        xinput set-prop $TOUCHPAD_ID "Device Enabled" 1
        notify-send -u low "Touchpad enabled"
    fi
else
    notify-send -u critical "Wrong Touchpad ID"
fi

