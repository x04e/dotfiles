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

