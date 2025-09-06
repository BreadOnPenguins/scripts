#!/usr/bin/env bash

folder=$HOME/notes/

newnote () { \
  name="$(echo "" | dmenu -c -sb "#a3be8c" -nf "#d8dee9" -p "Enter a name: " <&-)" || exit 0
  : "${name:=$(date +%F_%H-%M-%S)}"
  setsid -f "$TERMINAL" -e nvim $folder$name".md" >/dev/null 2>&1
}

selected () { \
  choice=$(echo -e "New\n$(command ls -t1 $folder)" | dmenu -c -l 5 -i -p "Choose note or create new: ")
  case $choice in
    New) newnote ;;
    *.md) setsid -f "$TERMINAL" -e nvim "$folder$choice" >/dev/null 2>&1 ;;
    *) exit ;;
  esac
}

selected
