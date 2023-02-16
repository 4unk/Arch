
#!/usr/bin/bash

# notify-send -t 0 "Warning" "Kill mouse"

wm_name=$(wmctrl -m 2>/dev/null | grep "Name" | cut -d " " -f2)

DIALOG_RESULT=$(echo -e "Exit $wm_name\nLock\nReboot\nPoweroff\nExit Menu" | rofi -dmenu -i -p "SYSTEM" -font "FreeMono 11" -theme-str 'window {width: 25%;height: 30%;}')

if [ "$DIALOG_RESULT" = "Exit $wm_name" ]; then
    bspc quit
elif [ "$DIALOG_RESULT" = "Lock" ]; then
    exec betterlockscreen -l diblur
elif [ "$DIALOG_RESULT" = "Reboot" ]; then
    exec systemctl reboot
elif [ "$DIALOG_RESULT" = "Poweroff" ]; then
    exec systemctl poweroff
elif [ "$DIALOG_RESULT" = "Exit Menu" ]; then
    exit 0
fi
