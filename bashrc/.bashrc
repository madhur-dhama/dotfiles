eval "$(starship init bash)"
eval "$(zoxide init bash)"

# open files from terminal like pdf, img, link
open() {
  xdg-open "$@" >/dev/null 2>&1 &
}

# Commands
alias ls='ls --color=auto'
alias nfzf='nano $(fzf)'
alias vfzf='nvim $(fzf)'
alias cfzf='code $(fzf)'
alias fzf="fzf --preview 'bat --style=numbers --color=always {}'"
alias cd="zd"
zd() {
  if [ $# -eq 0 ]; then
    builtin cd ~ && return
  elif [ -d "$1" ]; then
    builtin cd "$1"
  else
    z "$@" && printf " \U000F17A9 " && pwd || echo "Error: Directory not found"
  fi
}

# cd
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# Find installed packages 
alias paruf="paru -Slq | fzf --multi --preview 'paru -Si {1}' --preview-window=down:75% | xargs -ro paru -S"
