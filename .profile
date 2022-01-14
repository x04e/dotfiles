#!/bin/sh
# LightDM will load user's .xkbmap, .xmodmap, .xsession and .xprofile (not .xinitrc)
# This is a good place to put our env variables
export SHELL="zsh" # Use dash as /bin/sh and zsh for interactive shell
export TERMINAL="urxvt"
export BROWSER="firefox"
export EDITOR="vim"
export VISUAL=$EDITOR
export PATH=$PATH:$HOME/scripts
export PATH=$PATH:/opt/arduino-1.8.13

export NVM_DIR="/home/liam/.nvm"
source "$NVM_DIR/nvm.sh"
export PATH=$PATH:/opt/piavpn/bin

export FZF_HIST_FILE="/home/liam/.fzf_history"
[ -f $FZF_HIST_FILE ] || touch $FZF_HIST_FILE
export FZF_DEFAULT_OPTS="--color=16 --cycle --info=inline --reverse --border=rounded --history=$FZF_HIST_FILE"

xinput --set-prop 'pointer:Logitech MX Ergo' 'libinput Accel Speed' -0.99
feh --bg-fill /usr/share/pixmaps/backgrounds/abstract-background.jpg

launch_singleton () {
    [ -z "$(ps --no-header -C $1)" ] && { $1 &; } || echo "$1 is already running"
}

launch_singleton "mpd --no-daemon"
launch_singleton "picom"

