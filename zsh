autoload -Uz compinit promptinit
compinit
promptinit

setopt auto_cd
setopt vi
setopt no_beep
setopt extended_glob
setopt noautomenu
setopt nomenucomplete

# History
setopt append_history
setopt inc_append_history
setopt share_history
setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt hist_reduce_blanks
setopt extended_history

unsetopt flow_control  # Disable ctrl-S/Q tty halting

alias ll='ls -lah --color=auto'
alias ls='ll'
alias vi='vim'
alias df='df -Th'
alias mkdir='mkdir -p'
alias myip='dig +short myip.opendns.com @resolver1.opendns.com'
alias d='docker'
alias dps='docker ps'
alias dl='docker logs -f'
alias de='docker exec -it'
alias di='docker images'
alias drma='docker ps -qa | xargs docker rm'
alias drmia='docker images -qa | xargs docker rmi'

# History search
bindkey '^R' history-incremental-search-backward
bindkey '^F' history-incremental-search-forward

# Allow deleting after switching vi mode
bindkey '^?' backward-delete-char
bindkey '^H' backward-delete-char

SAVEHIST=100000
HISTSIZE=100000
HISTFILE=~/.zsh_history

export PROMPT='%n %~> '
export EDITOR=vim
export GREP_OPTIONS='--color=auto'
export KEYTIMEOUT=1  # Delay when switching to normal mode in shell
export GOPATH=~/go
export PYENV_ROOT=$HOME/.pyenv
export PATH=$PATH:$GOPATH/bin:$PYENV_ROOT/bin

# pyenv
eval "$(pyenv init -)"

# Python virtualenvwrapper setup
export WORKON_HOME=~/.pyenvs
venvwrap_script=/usr/bin/virtualenvwrapper.sh
python3_path=/usr/bin/python3.6
[[ -x $python3_path ]] && export VIRTUALENVWRAPPER_PYTHON=$python3_path
[[ -x $venvwrap_script ]] && source $venvwrap_script

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# motd
