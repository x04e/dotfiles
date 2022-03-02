#!/bin/zsh
alias ls="ls -A --color=auto"
alias del="mv -f ~/.local/share/Trash/"
alias ll="ls -lA --color=auto"
alias grep="grep --color=auto"
alias history="history 1"

mkcd(){
    mkdir "$1" && cd "$1"
}
