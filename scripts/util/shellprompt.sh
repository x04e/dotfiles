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
    # Background colours
    
    # teal -> yellow theme
    #local theme=("023" "029" "215" "221" "227" \
    #             "254" "254" "234" "232" "234" )

    # dark grey -> light grey theme
    #local theme=("236" "238" "242" "244" "247" \
    #             "252" "252" "232" "232" "234" )
 
    # purple -> yellow theme
    local theme=("089" "125" "215" "221" "227" \
                 "253" "253" "232" "232" "234" )
  
    # blue -> yellow theme
    #local theme=("061" "104" "221" "227" "229" \
    #             "252" "252" "232" "232" "234" )
    
    local pl="\ue0b0" # Powerline arrow
    local time="%K{${theme[0]}}%F{${theme[5]}} %D{%H:%M:%S} %F{${theme[0]}}"
    #local user="%K{${theme[1]}}$pl%F{${theme[6]}} %n %F{${theme[1]}}"
    local dir="%K{${theme[1]}}$pl%F{${theme[6]}} %~ %F{${theme[1]}}"
    local prompt="$time$dir"
    local git="$(__fastgit_ps1 ' \uf418 %s')"

    # Preserve ordering of colours whether the git info is shown or not
    [[ $git ]] && {
        prompt="$prompt%K{${theme[3]}}$pl%F{${theme[8]}}$git%F{${theme[3]}} %K{${theme[4]}}$pl%F{${theme[9]}} >%F{${theme[4]}}%k$pl%f "
    } || {
        prompt="$prompt%K{${theme[3]}}$pl%F{${theme[8]}} >%F{${theme[3]}}%k$pl%f "
    }

    echo "$prompt"
}
