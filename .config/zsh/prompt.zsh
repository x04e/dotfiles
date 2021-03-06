#!/bin/zsh
# PS1 with git status built in

_prompt () {
    exec 2> /dev/null
    local fg1="008"
    local fg2="003"
    local fg3="004"
    local BRANCH="$(git branch --show-current)"
    local CHANGES=""

    # Note: If this runs outside a Git repository, the exit code will be 129, so CHANGES will be "*^". Therefore don't use CHANGES in conditionals
    git diff --no-ext-diff --quiet || CHANGES+="*" # unstaged changes
    git diff --no-ext-diff --cached --quiet || CHANGES+="+" # staged changes
    #[ "$CHANGES" ] && CHANGES=" $CHANGES" # Add leading space if changes isn't empty

    [ "$BRANCH" ] && {
        echo "%F{$fg1} %D{%H:%M:%S} %F{$fg2}%d %F{$fg3}($BRANCH${CHANGES:+ }$CHANGES)%F{$fg4}\n%F{$fg1} >%f "
    } || {
        echo "%F{$fg1} %D{%H:%M:%S} %F{$fg2}%d %F{$fg4}%f\n%F{$fg1} >%f "
    }
}

