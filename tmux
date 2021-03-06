# Default shell (for when tmux is the login shell)
set -g default-shell '/usr/bin/zsh'

# Act like Vim
set-window-option -g mode-keys vi
bind h select-pane -L
bind j select-pane -D
bind k select-pane -U
bind l select-pane -R
bind c new-window -c "#{pane_current_path}"

# Improve colors
set -g default-terminal 'screen-256color'
set -g status-bg black
set -g status-fg white
#set -g status-bg black
#set -g status-fg brightblue

# Remove administrative debris in status bar
set -g status-left ''
set -g status-right ''

# Increase scrollback lines
set -g history-limit 100000

# No delay for escape key press
set -sg escape-time 0

# Fix problem where C-h is interpreted as <BS> in terminal
bind-key -n Bspace send-keys C-h

setw -g window-status-format " #I:#W "
setw -g window-status-current-format "#[fg=black,bg=colour255] #I:#W "
