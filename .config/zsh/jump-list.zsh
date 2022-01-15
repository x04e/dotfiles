#!/bin/zsh
setopt AUTO_PUSHD
STACK_POS=0

jump-newer () {
    unsetopt AUTO_PUSHD
    IFS=$'\n' DIR_STACK=($(dirs -pl))
    STACK_POS=$(($STACK_POS - 1))
    [ $STACK_POS -lt 0 ] && STACK_POS=0
    echo "\n$(dirs -pv)\npos: $STACK_POS"
    cd "${DIR_STACK[$STACK_POS]}"
    zle accept-line
    setopt AUTO_PUSHD
}

jump-older () {
    unsetopt AUTO_PUSHD
    IFS=$'\n' DIR_STACK=($(dirs -pl))
    STACK_POS=$(($STACK_POS + 1))
    [ $STACK_POS -gt ${#DIR_STACK[@]} ] && STACK_POS=${#DIR_STACK[@]}
    echo "\n$(dirs -pv)\npos: $STACK_POS"
    cd "${DIR_STACK[$STACK_POS]}"
    zle accept-line
    setopt AUTO_PUSHD
}

zle -N jump-newer
zle -N jump-older

go-up-dir(){ cd .. }
zle -N go-up-dir
bindkey '^I' jump-newer
bindkey '^O' jump-older
bindkey '^u' go-up-dir

