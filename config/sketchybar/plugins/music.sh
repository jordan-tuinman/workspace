#!/bin/bash

# Fetch info from AppleScript
IFS='||' read -r TITLE ARTIST ALBUM PLAYER_STATE <<<"$(osascript <<EOF
tell application "Music"
  if player state is playing or player state is paused then
    set trackName to name of current track
    set artistName to artist of current track
    set albumName to album of current track
    set playerState to player state as string
    return trackName & "||" & artistName & "||" & albumName & "||" & playerState
  else
    return "||||stopped"
  end if
end tell
EOF
)"

# If stopped, hide the item
if [[ "$PLAYER_STATE" == "stopped" || -z "$TITLE" ]]; then
  sketchybar --set $NAME drawing=off
  exit 0
fi

# Build label with available fields
LABEL="$TITLE"
[[ -n "$ARTIST" ]] && LABEL+=" – $ARTIST"
[[ -n "$ALBUM" ]] && LABEL+=" ($ALBUM)"

# Use a music note as icon
ICON="􀑪"

sketchybar --set $NAME label="$LABEL" icon="$ICON" drawing=on

