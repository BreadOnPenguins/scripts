#!/usr/env/bin bash
# Set audio sinks before using!
# `pactl list sinks` if on pulseaudio.

headphones () { \
  pacmd set-default-sink "SET SINK NAME" &
  notify-send  -h string:bgcolor:#a3be8c "Audio switched to headphones!"
}

speakers () { \
  pacmd set-default-sink "SET SINK NAME" &
  notify-send  -h string:bgcolor:#bf616a "Audio switched to speakers!"
}

bluetooth () { \
  pacmd set-default-sink "SET SINK NAME" &
  notify-send  -h string:bgcolor:#88c0d0 "Audio switched to bluetooth!"
}

choosespeakers() { \
  choice=$(printf "Headphones\\nSpeakers\\nBluetooth" | dmenu -c -l 3 -i -p "Choose output: ")
  case "$choice" in
    Headphones) headphones;;
    Speakers) speakers;;
    Bluetooth) bluetooth;;
  esac
}

choosespeakers
