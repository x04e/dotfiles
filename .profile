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

xinput --set-prop 'pointer:Logitech MX Ergo' 'libinput Accel Speed' -0.99
feh --bg-fill /usr/share/pixmaps/backgrounds/abstract-background.jpg
mpd --no-daemon &
picom &
