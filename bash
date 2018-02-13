# Source global definitions
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

# Vi mode
set -o vi

# Disable C-S C-Q halting
stty -ixon

# Aliases
alias ls='ls --color=auto'
alias ll='ls -lah'
alias vi='vim'
alias df='df -Th'
alias mkdir='mkdir -p'
alias myip='dig +short myip.opendns.com @resolver1.opendns.com'

# History size
export HISTSIZE=10000
export HISTFILESIZE=10000

# Grep color
export GREP_OPTIONS='--color=auto'

# Ignore duplicate history entries
export HISTCONTROL=ignoredups
