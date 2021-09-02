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
alias grep='grep --color=auto'

# History
# No duplicates
# Large history size
# Share history between terminals
export HISTCONTROL=ignoredups:erasedups
export HISTSIZE=100000
export HISTFILESIZE=100000
export PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -c; history -r"
shopt -s histappend

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
export EDITOR=vim

# Load NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

export PATH=$PATH:~/.poetry/bin/

# Load bash options for specific environment
. .bash_env
