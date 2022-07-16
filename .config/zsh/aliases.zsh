#!/bin/zsh
alias ls="ls -A --color=auto"
alias del="mv -f ~/.local/share/Trash/"
alias ll="ls -lA --color=auto"
alias grep="grep --color=auto"
alias history="history 1"

[ -d '/sys/class/power_supply/BAT0' ] \
    && alias alacritty="alacritty -o font.size=9"

mkcd(){
    mkdir "$1" && cd "$1"
}
