# Colors
export TERM=xterm-256color
export FORCE_COLOR=1
export GCC_COLORS="error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01"

# Prompt
PS1="\[\033[1;32m\]\u@stingray:\w \$\[\033[0m\] "

# Aliases
alias ls='ls --color=auto'
alias ll='ls -lah --color=auto'
alias la='ls -A --color=auto'
alias grep='grep --color=auto'

# ROS
source /opt/ros/humble/setup.bash

if [ -f /stingray_core/install/setup.bash ]; then
    source /stingray_core/install/setup.bash
fi
