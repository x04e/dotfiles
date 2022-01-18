#!/bin/zsh
# Jump between recently visited directories in order, similar to Vim's
# Ctrl+I Ctrl+O for moving back and forth in the jump list

setopt AUTO_PUSHD
_VJL_POS=1
_VJL_JUMPS=0
_VJL_STACK=($(pwd))
_VJL_BRANCH_STRAT='insert'
_VJL_DEBUG=0

print_stack () {
    [ $_VJL_DEBUG -ne 1 ] && return
    echo
    for i in $(seq $((${#_VJL_STACK[@]}+1))); do
        [ $i -eq $_VJL_POS ] && echo " >\e[31m${_VJL_STACK[$i]}\e[0m" || echo " ${_VJL_STACK[$i]}"
    done
    echo "pos: $_VJL_POS"
}

# cd -q is used below to hide from zsh's chpwd functions
chpwd () {
    if [ $_VJL_BRANCH_STRAT = 'discard' ]; then
        # 'discard' will add the new directory to the current stack position, removing all previous elements
        _VJL_STACK=($(pwd) ${_VJL_STACK[@]:$(($_VJL_POS-1))})
        _VJL_POS=1

    elif [ $_VJL_BRANCH_STRAT = 'insert' ]; then
        # 'insert' will add the new directory at the current stack position, preserving all previous elements
        _VJL_STACK=(${_VJL_STACK[@]:0:$(($_VJL_POS-1))} $(pwd) ${_VJL_STACK[@]:$(($_VJL_POS-1))})

    elif [ $_VJL_BRANCH_STRAT = 'prepend' ]; then
        # 'prepend' will add the new directory to the start of the list
        _VJL_STACK=($(pwd) ${_VJL_STACK[@]})
        _VJL_POS=1

    else
        echo "_VJL_BRANCH_STRAT was '$_VJL_BRANCH_STRAT'. Expected one of 'prepend','discard','insert'."
    fi
    _VJL_JUMPS=${#_VJL_STACK[@]}
    print_stack
}

jump-older () {
    unsetopt AUTO_PUSHD
    if [ $_VJL_POS -lt $_VJL_JUMPS ]; then
        _VJL_POS=$(($_VJL_POS+1))
        cd -q "${_VJL_STACK[$_VJL_POS]}" 2>/dev/null
        if [ $? -ne 0 ]; then
            _VJL_STACK=(${_VJL_STACK[@]:0:$(($_VJL_POS-1))} ${_VJL_STACK[@]:0:$(($_VJL_POS))})
            jump-older
        fi
        zle reset-prompt
        print_stack
    fi
    setopt AUTO_PUSHD
}

jump-newer () {
    unsetopt AUTO_PUSHD
    if [ $_VJL_POS -gt 1 ]; then
        _VJL_POS=$(($_VJL_POS-1))
        cd -q "${_VJL_STACK[$_VJL_POS]}" 2>/dev/null
        if [ $? -ne 0 ]; then
            _VJL_STACK=(${_VJL_STACK[@]:0:$(($_VJL_POS-1))} ${_VJL_STACK[@]:$(($_VJL_POS))})
            jump-newer
        fi
        zle reset-prompt
        print_stack
    fi
    setopt AUTO_PUSHD
}

zle -N jump-newer
zle -N jump-older

# While Vim uses Ctrl+I, we have to use something else here. Ctrl+I is
# identical to Tab to terminal emulators, and would break Tab completion
bindkey '^l' jump-newer
bindkey '^o' jump-older

