#!/usr/bin/env bash

folder=$HOME/notes/

newnote() {
  local name note_path
  name=$(wofi --dmenu \
              --prompt "Enter a name: " \
              --style none --insensitive) || return
  
  : "${name:=$(date +%F_%T | tr ':' '-')}"

  note_path="${folder%/}/$name.md"
  mkdir -p "$(dirname "$note_path")"

  emacs "$note_path"
}

notes(){
    choice=$(printf "New\n$(command ls -t1 $folder)\nExit" | wofi --dmenu --style none --prompt "Choose note or create new: " --insensitive)
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
