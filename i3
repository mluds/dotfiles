# Font for window titles. Will also be used by the bar unless a different font
# is used in the bar {} block below.
font pango:Liberation Mono 11

# use these keys for focus, movement, and resize directions when reaching for
# the arrows is not convenient
set $up k
set $down j
set $left h
set $right l

# use Mouse+Mod1 to drag floating windows to their wanted position
floating_modifier Mod1

# start a terminal
bindsym Mod1+Return exec xterm

# kill focused window
bindsym Mod1+Shift+q kill

# start dmenu (a program launcher)
bindsym Mod1+d exec dmenu_run

# change focus
bindsym Mod1+$left focus left
bindsym Mod1+$down focus down
bindsym Mod1+$up focus up
bindsym Mod1+$right focus right

# move focused window
bindsym Mod1+Shift+$left move left
bindsym Mod1+Shift+$down move down
bindsym Mod1+Shift+$up move up
bindsym Mod1+Shift+$right move right

# split in horizontal orientation
bindsym Mod1+c split h

# split in vertical orientation
bindsym Mod1+v split v

# enter fullscreen mode for the focused container
bindsym Mod1+f fullscreen toggle

# change container layout (stacked, tabbed, toggle split)
bindsym Mod1+s layout stacking
bindsym Mod1+w layout tabbed
bindsym Mod1+e layout toggle split

# toggle tiling / floating
bindsym Mod1+Shift+space floating toggle

# change focus between tiling / floating windows
bindsym Mod1+space focus mode_toggle

# focus the parent container
bindsym Mod1+a focus parent

# move the currently focused window to the scratchpad
bindsym Mod1+Shift+minus move scratchpad

# Show the next scratchpad window or hide the focused scratchpad window.
# If there are multiple scratchpad windows, this command cycles through them.
bindsym Mod1+minus scratchpad show

# switch to workspace
bindsym Mod1+1 workspace 1
bindsym Mod1+2 workspace 2
bindsym Mod1+3 workspace 3
bindsym Mod1+4 workspace 4
bindsym Mod1+5 workspace 5
bindsym Mod1+6 workspace 6
bindsym Mod1+7 workspace 7
bindsym Mod1+8 workspace 8
bindsym Mod1+9 workspace 9
bindsym Mod1+0 workspace 10

# move focused container to workspace
bindsym Mod1+Shift+1 move container to workspace 1
bindsym Mod1+Shift+2 move container to workspace 2
bindsym Mod1+Shift+3 move container to workspace 3
bindsym Mod1+Shift+4 move container to workspace 4
bindsym Mod1+Shift+5 move container to workspace 5
bindsym Mod1+Shift+6 move container to workspace 6
bindsym Mod1+Shift+7 move container to workspace 7
bindsym Mod1+Shift+8 move container to workspace 8
bindsym Mod1+Shift+9 move container to workspace 9
bindsym Mod1+Shift+0 move container to workspace 10

# reload the configuration file
bindsym Mod1+Shift+c reload
# restart i3 inplace (preserves your layout/session, can be used to upgrade i3)
bindsym Mod1+Shift+r restart
# exit i3 (logs you out of your X session)
bindsym Mod1+Shift+e exec "i3-nagbar -t warning -m 'You pressed the exit shortcut. Do you really want to exit i3? This will end your X session.' -b 'Yes, exit i3' 'i3-msg exit'"

# resize window (you can also use the mouse for that)
mode "resize" {
        # These bindings trigger as soon as you enter the resize mode

        # Pressing left will shrink the window’s width.
        # Pressing right will grow the window’s width.
        # Pressing up will shrink the window’s height.
        # Pressing down will grow the window’s height.
        bindsym $left       resize shrink width 10 px or 10 ppt
        bindsym $down       resize grow height 10 px or 10 ppt
        bindsym $up         resize shrink height 10 px or 10 ppt
        bindsym $right      resize grow width 10 px or 10 ppt

        # same bindings, but for the arrow keys
        bindsym Left        resize shrink width 10 px or 10 ppt
        bindsym Down        resize grow height 10 px or 10 ppt
        bindsym Up          resize shrink height 10 px or 10 ppt
        bindsym Right       resize grow width 10 px or 10 ppt

        # back to normal: Enter or Escape
        bindsym Return mode "default"
        bindsym Escape mode "default"
}

bindsym Mod1+r mode "resize"

# Start i3bar to display a workspace bar (plus the system information i3status
# finds out, if available)
bar {
        status_command i3status
}
