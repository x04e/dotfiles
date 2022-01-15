#!/bin/sh

zsh-vim-edit() {
    zle -I
    TEMP_FILE=$(mktemp --suffix=_zsh-vim-edit.sh)
    print -r -- "$BUFFER" > $TEMP_FILE
    vim $TEMP_FILE
    BUFFER=$(cat $TEMP_FILE)
    rm $TEMP_FILE
}

zle -N zsh-vim-edit
bindkey '^W' zsh-vim-edit

