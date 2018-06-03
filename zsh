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

alias ls='ls -lh --color=never'
alias ll='ls -a'
alias vi='vim'
alias df='df -Th'
alias mkdir='mkdir -p'
alias myip='dig +short myip.opendns.com @resolver1.opendns.com'
alias grep='grep --color=auto'

# History search
bindkey '^R' history-incremental-search-backward
bindkey '^F' history-incremental-search-forward

# Allow deleting after switching vi mode
bindkey '^?' backward-delete-char
bindkey '^H' backward-delete-char

# Faster keyboard (delay in ms, repeats per sec)
xset r rate 200 40

# Disable Crtl+S halting
stty -ixon

SAVEHIST=100000
HISTSIZE=100000
HISTFILE=~/.zsh_history

export PROMPT='%n@%m %~> '
export VISUAL=vim
export EDITOR="$VISUAL"
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
cowsay -f tux "I'd just like to interject for a moment. What you're referring to as Linux, is in fact, GNU/Linux, or as I've recently taken to calling it, GNU plus Linux. Linux is not an operating system unto itself, but rather another free component of a fully functioning GNU system made useful by the GNU corelibs, shell utilities and vital system components comprising a full OS as defined by POSIX."
