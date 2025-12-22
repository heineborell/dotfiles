#!/bin/sh
xrandr --output eDP --mode 1920x1200

# Mouse settings
xinput --set-prop "ASCE1206:00 04F3:3315 Mouse" "libinput Accel Speed" 0.6
xinput --set-prop "ASCE1206:00 04F3:3315 Mouse" "libinput Natural Scrolling Enabled" 1

# Touchpad settings
xinput --set-prop "ASCE1206:00 04F3:3315 Touchpad" "libinput Natural Scrolling Enabled" 1

/usr/bin/pipewire &
/usr/bin/pipewire-pulse &
picom --config /home/deniz/.config/picom/picom.conf &
feh --bg-scale /home/deniz/Downloads/Space-Background-Image-7.jpg &
xbindkeys &
export PATH="$HOME/bin:$PATH"
dwmblocks &
exec dwm
