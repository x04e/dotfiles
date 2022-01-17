#!/bin/sh

# Globals
export SHELL="zsh"
export TERMINAL="alacritty"
export BROWSER="firefox"
export EDITOR="vim"
export VISUAL=$EDITOR


# XDG settings
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
export XDG_STATE_HOME=$HOME/.local/state
export DOCKER_CONFIG=$XDG_CONFIG_HOME/docker


# PATH
export PATH=$PATH:$HOME/scripts
export PATH=$PATH:/opt/arduino-1.8.13
export PATH=$PATH:/opt/piavpn/bin


# Node version manager
export NVM_DIR="/home/liam/.nvm"
source "$NVM_DIR/nvm.sh"
export PATH=$PATH:$HOME/.local/lib/npm/bin


# Java
export JAVA_HOME=/usr/lib/jvm/default
export JRE_HOME=$JAVA_HOME

# ZSH
export ZDOTDIR=$XDG_CONFIG_HOME/zsh

# FZF
export FZF_HIST_FILE="/home/liam/.fzf_history"
[ -f $FZF_HIST_FILE ] || touch $FZF_HIST_FILE
export FZF_DEFAULT_OPTS="--color=16 --cycle --info=inline --reverse --border=rounded --history=$FZF_HIST_FILE --no-bold"


# Single use commands
xinput --set-prop 'pointer:Logitech MX Ergo' 'libinput Accel Speed' -0.99
feh --bg-fill /usr/share/pixmaps/backgrounds/abstract-background.jpg


# Background processes
[ -z "$(ps --no-header -C 'mpd')" ] && mpd --no-daemon &
[ -z "$(ps --no-header -C 'picom')" ] && picom &

