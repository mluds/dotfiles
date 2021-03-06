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
alias d='docker'
alias dps='docker ps'
alias dl='docker logs -f'
alias de='docker exec -it'
alias di='docker images'
alias drma='docker ps -qa | xargs docker rm'
alias drmia='docker images -qa | xargs docker rmi'
alias grep='grep --color=auto'
alias ip='ip -c'

# History search
bindkey '^R' history-incremental-search-backward
bindkey '^F' history-incremental-search-forward

# Allow deleting after switching vi mode
bindkey '^?' backward-delete-char
bindkey '^H' backward-delete-char

# Faster keyboard (delay in ms, repeats per sec)
if hash xset 2>/dev/null; then
    xset r rate 200 40 >/dev/null 2>&1
fi

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
export PATH=$PATH:$GOPATH/bin

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -z "$TMUX"  ] && { tmux attach || exec tmux new-session && exit; }
