#!/bin/sh
__fastgit_ps1 () {
    local headfile head branch
    local dir="$PWD"

    while [ -n "$dir" ]; do
        if [ -e "$dir/.git/HEAD" ]; then
            headfile="$dir/.git/HEAD"
            break
        fi
        dir="${dir%/*}"
    done

    if [ -e "$headfile" ]; then
        read -r head < "$headfile" || return
        case "$head" in
            ref:*) branch="${head##*/}" ;;
            "") branch="" ;;
            *) branch="${head:0:7}" ;;  #Detached head. You can change the format for this too. 
        esac
    fi

    if [ -z "$branch" ]; then
        return 0
    fi

    if [ -z "$1" ]; then
        # Default format
        printf "(%s) " "$branch"
    else
        # Use passed format string
        printf "$1" "$branch"
    fi
}

_prompt () {
    local bg="234"
    local fg1="242"
    local fg2="247"
    local fg3="006"
    local fg4="242"
    local pl="\ue0b0"

    local gitbranch="$(__fastgit_ps1 '%s')"

    [[ $gitbranch ]] && {
        echo "%K{$bg}%F{$fg1} %D{%H:%M:%S} %F{$fg2}%~ %F{$fg3}$gitbranch%F{$fg4}%K{$bg} >%F{$bg}%k$pl%f "
    } || {
        echo "%K{$bg}%F{$fg1} %D{%H:%M:%S} %F{$fg2}%~ %F{$fg4}>%F{$bg}%k$pl%f "
    }
}

