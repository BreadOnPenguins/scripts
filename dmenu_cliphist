#!/usr/bin/env bash

histfile="$HOME/.cache/cliphist"
placeholder="<NEWLINE>"

highlight() {
  clip=$(xclip -o -selection primary | xclip -i -f -selection clipboard 2>/dev/null) ;}

output() {
  clip=$(xclip -i -f -selection clipboard 2>/dev/null) ;}

write() {
  [ -f "$histfile" ] || notify-send "Creating $histfile"; touch $histfile
  [ -z "$clip" ] && exit 0
  multiline=$(echo "$clip" | sed ':a;N;$!ba;s/\n/'"$placeholder"'/g')
  grep -Fxq "$multiline" "$histfile" || echo "$multiline" >> "$histfile"
  notification=$(echo \"$multiline\") ;}

sel() {
  selection=$(tac "$histfile" | dmenu -b -l 5 -i -p "Clipboard history:")
  [ -n "$selection" ] && echo "$selection" | sed "s/$placeholder/\n/g" | xclip -i -selection clipboard && notification="Copied to clipboard!" ;}

case "$1" in
  add) highlight && write ;;
  out) output && write ;;
  sel) sel ;;
  *) printf "$0 | File: $histfile\n\nadd - copies primary selection to clipboard, and adds to history file\nout - pipe commands to copy output to clipboard, and add to history file\nsel - select from history file with dmenu and recopy!\n" ; exit 0 ;;
esac

notify-send -h string:fgcolor:#2e3440 "$notification"
