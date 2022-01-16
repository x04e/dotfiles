#!/bin/zsh
# PS1 with git status built in

_prompt () {
    exec 2> /dev/null
    local bg="234"
    local fg1="008"
    local fg2="011"
    local fg3="012"
    local fg4="008"
    local BRANCH="$(git branch --show-current)"
    local CHANGES="$(git status --porcelain | wc -l | sed 's/^/ /g; s/^ 0$//g')"

    [ "$BRANCH" ] && {
        echo "%K{$bg}%F{$fg1} %D{%H:%M:%S} %F{$fg2}%d %F{$fg3}($BRANCH)$CHANGES%F{$fg4}%K{$bg}%F{$bg}%k\ue0b0%f\n%K{$bg}%F{$fg4} >%K{$bg}%F{$bg}%k\ue0b0%f "
    } || {
        echo "%K{$bg}%F{$fg1} %D{%H:%M:%S} %F{$fg2}%d %F{$fg4}%F{$bg}%k\ue0b0%f\n%K{$bg}%F{$fg4} >%K{$bg}%F{$bg}%k\ue0b0%f "
    }
}

