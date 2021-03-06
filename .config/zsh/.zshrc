#!/bin/zsh

#history
SAVEHIST=10000
HISTSIZE=10000
HISTFILE=$XDG_DATA_HOME/zsh/zsh_history
[ -f $HISTFILE ] || mkdir -p $(dirname $HISTFILE)

setopt ALIASES # expand aliases, even in non-interactive mode (like vim's ":!")
setopt KSH_ARRAYS # arrays start at 0 (same as bash)
setopt HIST_FIND_NO_DUPS #don't show duplicates in search
setopt NO_HIST_BEEP #don't beep
setopt SHARE_HISTORY #share history between terminals
setopt PROMPT_SUBST
autoload -U colors && colors

# Third-party plugins
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

# Haskell GHCUP
source /home/liam/.ghcup/env

# Custom scripts
source $ZDOTDIR/keybindings.zsh
source $ZDOTDIR/addons/vim-edit.zsh
source $ZDOTDIR/addons/back-stack.zsh
source $ZDOTDIR/aliases.zsh
source $ZDOTDIR/prompt.zsh
PS1="\$(_prompt)"

