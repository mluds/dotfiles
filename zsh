autoload -Uz compinit promptinit
compinit
promptinit

setopt AUTO_CD
setopt VI
setopt NO_BEEP
setopt EXTENDED_GLOB

# History
setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_REDUCE_BLANKS
setopt EXTENDED_HISTORY

unsetopt FLOW_CONTROL  # Disable ctrl-S/Q tty halting

alias ls='ls --color=auto'
alias ll='ls -lah'
alias vi='vim'
alias df='df -Th'
alias mkdir='mkdir -p'
alias myip='dig +short myip.opendns.com @resolver1.opendns.com'

# History search
bindkey '^R' history-incremental-search-backward
bindkey '^F' history-incremental-search-forward

# Allow deleting after switching vi mode
bindkey '^?' backward-delete-char
bindkey '^H' backward-delete-char

SAVEHIST=10000
HISTSIZE=10000
HISTFILE=~/.zsh_history

export EDITOR=vim
export GREP_OPTIONS='--color=auto'
export KEYTIMEOUT=1  # Delay when switching to normal mode in shell
export GOPATH=~/go
export PATH=$PATH:$GOPATH/bin

# Python virtualenvwrapper setup
export WORKON_HOME=~/.pyenvs
venvwrap_script=/usr/bin/virtualenvwrapper.sh
python3_path=/usr/bin/python3.6
[[ -x $python3_path ]] && export VIRTUALENVWRAPPER_PYTHON=$python3_path
[[ -x $venvwrap_script ]] && source $venvwrap_script