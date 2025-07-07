eval "$(starship init zsh)"
export EDITOR="nvim"
export SUDO_EDITOR="$EDITOR"
export PGHOST="/var/run/postgresql"

export PATH=$PATH:/usr/local/go/bin

HISTFILE=~/.history
HISTSIZE=10000
SAVEHIST=50000

setopt inc_append_history

# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


#Commands
alias ff='fastfetch'
alias nfzf='nano $(fzf)'
alias nvfzf='nvim $(fzf)'

#cd
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

#System
alias reboot='sudo reboot now'
alias shutdown='sudo shutdown now'

alias upgrade='sudo dnf upgrade'
