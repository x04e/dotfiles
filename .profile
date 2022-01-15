#!/bin/sh
# LightDM will load user's .xkbmap, .xmodmap, .xsession and .xprofile (not .xinitrc)
# This is a good place to put our env variables
export SHELL="zsh"
export TERMINAL="alacritty"
export BROWSER="firefox"
export EDITOR="vim"
export VISUAL=$EDITOR
export PATH=$PATH:$HOME/scripts
export PATH=$PATH:/opt/arduino-1.8.13

export NVM_DIR="/home/liam/.nvm"
source "$NVM_DIR/nvm.sh"

export PATH=$PATH:/opt/piavpn/bin

export JAVA_HOME=/usr/lib/jvm/default
export JRE_HOME=$JAVA_HOME

export FZF_HIST_FILE="/home/liam/.fzf_history"
[ -f $FZF_HIST_FILE ] || touch $FZF_HIST_FILE
export FZF_DEFAULT_OPTS="--color=16 --cycle --info=inline --reverse --border=rounded --history=$FZF_HIST_FILE --no-bold"

xinput --set-prop 'pointer:Logitech MX Ergo' 'libinput Accel Speed' -0.99
feh --bg-fill /usr/share/pixmaps/backgrounds/abstract-background.jpg

[ -z "$(ps --no-header -C 'mpd')" ] && mpd --no-daemon &
[ -z "$(ps --no-header -C 'picom')" ] && picom &

