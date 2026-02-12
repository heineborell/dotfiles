#!/bin/sh
xrandr --output eDP --mode 1920x1200

# Input settings
xinput --set-prop "ASCE1206:00 04F3:3315 Mouse" "libinput Accel Speed" 1
xinput --set-prop "ASCE1206:00 04F3:3315 Mouse" "libinput Natural Scrolling Enabled" 1
xinput --set-prop "ASCE1206:00 04F3:3315 Touchpad" "libinput Natural Scrolling Enabled" 1

# Start the PipeWire Team (Order matters!)
/usr/bin/pipewire &
/usr/bin/pipewire-pulse &
/usr/bin/wireplumber &  # <--- DO NOT MISS THIS

# Utilities
picom --config /home/deniz/.config/picom/picom.conf &
feh --bg-scale /home/deniz/Pictures/surfer.png&
xbindkeys &
export PATH="$HOME/bin:$PATH"
dwmblocks &

# Start D-Bus and DWM
exec dbus-run-session dwm
