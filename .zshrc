#!/bin/sh

#history
SAVEHIST=10000
HISTSIZE=10000
HISTFILE=~/.zsh_history
setopt ALIASES # expand aliases, even in non-interactive mode (like vim's ":!")
setopt HIST_FIND_NO_DUPS #don't show duplicates in search
setopt NO_HIST_BEEP #don't beep
setopt SHARE_HISTORY #share history between terminals
setopt PROMPT_SUBST
setopt autopushd
autoload -U colors && colors

source ~/scripts/util/shellprompt.sh
PS1="\$(_prompt)"

source ~/scripts/custom-keybindings.zsh
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

export PATH=$PATH:$HOME/.local/lib/npm/bin

alias ls="ls -A --color=auto"
alias del="mv -f ~/.local/share/Trash/"
alias ll="ls -lA --color=auto"
alias grep="grep --color=auto"
alias history="history 1"

