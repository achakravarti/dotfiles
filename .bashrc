#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='exa --icons --group-directories-first --sort=extension'
alias ll='exa --icons --color=always --group-directories-first --sort=extension -lhaR | less -r'
alias grep='grep -n --color=auto'
alias mutt='neomutt'
alias abook='abook --config $HOME/.config/abook/abookrc --datafile $HOME/.config/abook/addressbook'
alias ncmpcpp='ncmpcpp -b $HOME/.config/ncmpcpp/bindings'
alias vim='nvim'
alias ssh='kitty +kitten ssh'


# https://wiki.archlinux.org/index.php/Color_output_in_console#man
man() {
    LESS_TERMCAP_md=$'\e[01;31m' \
    LESS_TERMCAP_me=$'\e[0m' \
    LESS_TERMCAP_se=$'\e[0m' \
    LESS_TERMCAP_so=$'\e[01;44;33m' \
    LESS_TERMCAP_ue=$'\e[0m' \
    LESS_TERMCAP_us=$'\e[01;32m' \
    command man "$@"
}

PS1='[\u@\h \W]\$ '
source $HOME/.config/promptline.sh
source /usr/share/fzf/completion.bash
source /usr/share/fzf/key-bindings.bash

archey3
