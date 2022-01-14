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

source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

bindkey -e

# Fix keys
case "$TERM" in
    *rxvt*)
        # (U)Rxvt sequences
        bindkey "\e[3~" delete-char
        bindkey "\e[3\^" delete-char
        # HOME, C-HOME
        bindkey "\e[7~" beginning-of-line
        bindkey "\e[7\^" beginning-of-line
        # END, C-END
        bindkey "\e[8~" end-of-line
        bindkey "\e[8\^" end-of-line
        # PageDown, C-PageDown
        bindkey "\e[6~" down-line-or-history
        bindkey "\e[6\^" down-line-or-history
        # PageUp, C-PageUp
        bindkey "\e[5~" up-line-or-history
        bindkey "\e[5\^" up-line-or-history
    ;;

    *)
        # XTerm sequences
        bindkey "\e[3~" delete-char
        bindkey "\e[3;5~" delete-char
        # HOME, C-HOME
        bindkey "\e[H" beginning-of-line
        bindkey "\e[1;5H" beginning-of-line
        # END, C-END
        bindkey "\e[F" end-of-line
        bindkey "\e[1;5F" end-of-line
        # PageDown, C-PageDown
        bindkey "\e[6~" down-line-or-history
        bindkey "\e[6;5~" down-line-or-history
        # PageUp, C-PageUp
        bindkey "\e[5~" up-line-or-history
        bindkey "\e[5;5~" up-line-or-history
    ;;
esac

export PATH=$PATH:$HOME/scripts
export PATH=$PATH:/opt/android-studio/bin
export PATH=$PATH:$HOME/.local/lib/npm/bin
export PATH=$PATH:/opt/piavpn/bin
export PATH=$PATH:$HOME/.local/bin:/opt/arduino-1.8.13

export JAVA_HOME=/usr/lib/jvm/default
export JRE_HOME=$JAVA_HOME
export ANDROID_SDK_ROOT=$HOME/Android/Sdk
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

alias ls="ls -A --color=auto"
alias del="mv -f ~/.local/share/Trash/"
alias ll="ls -lA --color=auto"
alias grep="grep --color=auto"
alias history="history 1"
alias .c="/usr/bin/git --git-dir $HOME/dotfiles --work-tree=$HOME"

