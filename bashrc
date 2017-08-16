# Source global definitions
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

# Run tmux on start
# If not running interactively, do not do anything
[[ $- != *i* ]] && return
[[ -z "$TMUX" ]] && exec tmux

# Vi mode
set -o vi

# User specific aliases and functions
alias myip='dig +short myip.opendns.com @resolver1.opendns.com'
