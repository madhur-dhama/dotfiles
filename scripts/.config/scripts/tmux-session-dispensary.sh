#!/bin/bash

# Only need $HOME, no need to list Documents separately
DIRS=(
  "$HOME/Documents"
  "$HOME/personal"
  "$HOME/Documents/webdev/"
)

if [[ $# -eq 1 ]]; then
  selected=$1
else
  selected=$(fd . "${DIRS[@]}" --type=dir --max-depth=1 --full-path |
    sed "s|^$HOME/||" |
    sk --margin 10% --color="bw")
  [[ $selected ]] && selected="$HOME/$selected"
fi

[[ ! $selected ]] && exit 0

selected_name=$(basename "$selected" | tr . _)

if ! tmux has-session -t "$selected_name" 2>/dev/null; then
  tmux new-session -ds "$selected_name" -c "$selected"
  tmux select-window -t "$selected_name:1"
fi

tmux switch-client -t "$selected_name"
