#!/bin/zsh
setopt AUTO_PUSHD
POS=1
JUMPING=0
JUMPS=0
STACK=($(pwd))

chpwd () {
    if [ $JUMPING -eq 1 ]; then
        POS=1
    else
        STACK=($(pwd) ${STACK[@]})
    fi
    JUMPS=${#STACK[@]}
}

jump-older () {
    JUMPING=1
    unsetopt AUTO_PUSHD
    if [ $POS -lt $JUMPS ]; then
        POS=$(($POS+1))
        cd -q "${STACK[$POS]}"
        zle accept-line
    fi
    setopt AUTO_PUSHD
    JUMPING=0
}

jump-newer () {
    JUMPING=1
    unsetopt AUTO_PUSHD
    if [ $POS -gt 1 ]; then
        POS=$(($POS-1))
        cd -q "${STACK[$POS]}"
        zle accept-line
    fi
    setopt AUTO_PUSHD
    JUMPING=0
}

zle -N jump-newer
zle -N jump-older

bindkey '^l' jump-newer
bindkey '^o' jump-older

