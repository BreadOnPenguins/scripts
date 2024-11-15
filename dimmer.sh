#!/usr/bin/env bash
# Set monitor names before using!

export DISPLAY=:0

m1="SET MONITOR HERE"
m2="SET MONITOR HERE"

notif() {
  notify-send -t 3000 -h string:bgcolor:#ebcb8b "Brightness adjusted!"
}

[ "$1" = 10 ] && percent="1" || percent="0.$1"
[ "$2" = night ] && gamma="1.0:0.95:0.85" || gamma="1.0:1.0:1.0"

xrandr --output "$m1" --brightness "$percent" --gamma "$gamma" && xrandr --output "$m2" --brightness "$percent" --gamma "$gamma" && notif
