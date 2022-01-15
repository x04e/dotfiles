#!/bin/zsh

# Disable the ESC key to fully block vi mode
zsh-noop(){}
zle -N zsh-noop
bindkey '^[' zsh-noop

# Ctrl-Backspace/Ctrl-Delete removes whole words
bindkey '^H' backward-delete-word
bindkey "\e[3;5~" delete-word

# Delete
bindkey "\e[3~" delete-char
# Home, Ctrl-Home
bindkey "\e[H" beginning-of-line
bindkey "\e[1;5H" beginning-of-line
# End, Ctrl-End
bindkey "\e[F" end-of-line
bindkey "\e[1;5F" end-of-line
# PageDown, Ctrl-PageDown
bindkey "\e[6~" down-line-or-history
bindkey "\e[6;5~" down-line-or-history
# PageUp, Ctrl-PageUp
bindkey "\e[5~" up-line-or-history
bindkey "\e[5;5~" up-line-or-history

