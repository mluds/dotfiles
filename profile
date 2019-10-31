# Disable readonly TMOUT auto-logout
# Requires gdb to be installed
gdb -ex 'call unbind_variable("TMOUT")' --pid=$$ --batch
