#!/bin/zsh
# Jump between recently visited directories in order, similar to Vim's
# Ctrl+I Ctrl+O for moving back and forth in the jump list

setopt AUTO_PUSHD
_VJL_POS=1
_VJL_HISTFILE=~/.local/share/zsh/back-stack_history
_VJL_STACK=( $(pwd) )
_VJL_BRANCH_STRAT='insert'
_VJL_DEBUG=0

is_sharehistory_set(){
    setopt | grep "sharehistory" 2>&1 > /dev/null
}

# Add the back stack history to the stack if SHARE_HISTORY is set
if is_sharehistory_set; then
    if [ -f $_VJL_HISTFILE ]; then
        IFS=$'\n'
        _VJL_STACK+=( $(cat $_VJL_HISTFILE) )
    else
        touch $_VJL_HISTFILE
    fi
fi


print_stack () {
    [ $_VJL_DEBUG -ne 1 ] && return
    echo
    for i in $(seq $((${#_VJL_STACK[@]}+1))); do
        [ $i -eq $_VJL_POS ] && echo " >\e[31m${_VJL_STACK[$i]}\e[0m" || echo " ${_VJL_STACK[$i]}"
    done
    echo "pos: $_VJL_POS"
}
print_stack

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

    # Update the history file (only up to 100 entries)
    if is_sharehistory_set; then
        printf "%s\n" "${_VJL_STACK[@]}" | head -n 20 > "$_VJL_HISTFILE"
    fi

    print_stack
}

jump-older () {
    unsetopt AUTO_PUSHD
    if [ $_VJL_POS -lt ${#_VJL_STACK[@]} ]; then
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

