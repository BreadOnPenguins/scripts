#!/usr/bin/env bash

word=${1:-$(xclip -o -selection primary 2>/dev/null || wl-paste 2>/dev/null)}

# Check for empty word or special characters
[[ -z "$word" || "$word" =~ [\/] ]] && notify-send -h string:bgcolor:#bf616a -t 3000 "Invalid input." && exit 0

query=$(curl -s --connect-timeout 5 --max-time 10 "https://api.dictionaryapi.dev/api/v2/entries/en_US/$word")

# Check for connection error (curl exit status stored in $?)
[ $? -ne 0 ] && notify-send -h string:bgcolor:#bf616a -t 3000 "Connection error." && exit 1

# Check for invalid word response
[[ "$query" == *"No Definitions Found"* ]] && notify-send -h string:bgcolor:#bf616a -t 3000 "Invalid word." && exit 0

# Show only first 3 definitions
def=$(echo "$query" | jq -r '[.[].meanings[] | {pos: .partOfSpeech, def: .definitions[].definition}] | .[:3].[] | "\n\(.pos). \(.def)"')

# Requires a notification daemon to be installed
notify-send -t 60000 "$word -" "$def"


### MORE OPTIONS :)

# Show first definition for each part of speech (thanks @morgengabe1 on youtube)
# def=$(echo "$query" | jq -r '.[0].meanings[] | "\(.partOfSpeech): \(.definitions[0].definition)\n"')

# Show all definitions
# def=$(echo "$query" | jq -r '.[].meanings[] | "\n\(.partOfSpeech). \(.definitions[].definition)"')

# Regex + grep for just definition, if anyone prefers that to jq
# def=$(grep -Po '"definition":"\K(.*?)(?=")' <<< "$query")

# bold=$(tput bold) # Print text bold with echo, for visual clarity
# normal=$(tput sgr0) # Reset text to normal
# echo "${bold}Definition of $word"
# echo "${normal}$def"
