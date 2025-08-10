#!/usr/bin/env bash

folder=$HOME/notes/

newnote() {
  local name note_path
  name=$(fuzzel --dmenu \
                --prompt="Enter a name ❯ " \
                --lines=10) || return
  
  : "${name:=$(date +%F_%T | tr ':' '-')}"

  note_path="${folder%/}/$name.md"
  mkdir -p "$(dirname "$note_path")"

  emacs "$note_path"
}

notes() {
  choice=$(printf "New\n$(command ls -t1 "$folder")\nExit" | fuzzel --dmenu \
    --prompt="Choose note ❯ " \
    --lines=15) || exit

  case "$choice" in
    New) newnote ;;
    *.md)
      note_path="${folder%/}/$choice"
      emacs "$note_path"
      ;;
    *) exit ;;
  esac
}

notes
