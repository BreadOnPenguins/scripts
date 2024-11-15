#!/usr/bin/env bash

file="$HOME/.cache/cliphist"
placeholder="<NEWLINE>"

add() {
  [ -f "$file" ] || { notify-send "No cliphist available, creating file.."; touch $file; }
  clip=$(xclip -o -selection clipboard 2>/dev/null)
  [ -z "$clip" ] && exit
  multiline=$(echo "$clip" | sed ':a;N;$!ba;s/\n/'"$placeholder"'/g')
  grep -Fxq "$multiline" "$file" || echo "$multiline" >> "$file"
}

sel() {
  selection=$(tac "$file" | dmenu -b -l 5 -i -p "Clipboard history:")
  [ -n "$selection" ] && echo "$selection" | sed "s/$placeholder/\n/g" | xclip -selection clipboard && notify-send -h string:bgcolor:#a3be8c -h string:fgcolor:#2e3440 "Copied to clipboard!"
}

case "$1" in
  add) add ;;
  sel) sel ;;
  *) printf "$0 \nOptions:\nadd - adds current clipped item to history\nsel - selects and recopies\n"; exit 1 ;;
esac
