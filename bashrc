# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=10000
HISTFILESIZE=20000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
# alias ll='ls -alF'
# alias la='ls -A'
# alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . "$HOME/.bash_aliases"
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

################################################################################
# above is default ubuntu ~/.bashrc below is mine
################################################################################

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# better default
alias grep="grep --color=auto"
alias ls="ls --color=auto"
alias mkdir="mkdir -p"
alias mv="mv -i"
alias df="df -h"
alias nv="nvim"
alias v="nvim"
alias t="tmux"
alias fd=fdfind # fd on ubuntu is fdfind
alias sl=ls # save you from mistyping
# quick test exercism
alias pt="python3 -m pytest -o markers=task " # + {exercise_test.py}
alias p="python3"
# db kill quick kill all db engines running to save memory
alias dbk="sudo systemctl stop mssql-server; sudo systemctl stop mongod; sudo systemctl stop mysql; sudo systemctl stop postgresql;"
# db status
alias dbs="sudo systemctl status mssql-server; sudo systemctl status mongod; sudo systemctl status mysql; sudo systemctl status postgresql;"
alias s="source $HOME/.bashrc"

get_git_branch() {
  git branch 2>/dev/null | grep "^*" | colrm 1 2
}

# example: "mhc ~/dotfiles main> "
# PS1='mhc \w $(get_git_branch)> '
PS1='\w $(get_git_branch)> '

# change dir
alias 1="cd ../"
alias 2="cd ../../"
alias 3="cd ../../../"
alias 4="cd ../../../../"
alias 5="cd ../../../../../"

# git related
alias log="git log --all --oneline --graph"
alias gp='git push origin $(get_git_branch)'
alias gpf='git push origin $(get_git_branch) --force'
alias gpl='git pull origin $(get_git_branch)'
alias gplf='git pull origin $(get_git_branch) --rebase --force'
alias gc="git commit -m"
alias gr="git restore ."
alias grs="git restore . --staged"
alias gr1="git reset HEAD^"
alias gs="git status"
alias gf="git fetch"
alias ga="git add ."
alias gd="git diff"

# npm related
alias nsv="npm run server"
alias nw="npm run watch"
alias nb="npm run build"
alias nt="npm run test"
alias nd="npm run dev"
alias ni="npm install"
alias ns="npm start"

# yarn related
alias ysv="yarn run server"
alias yw="yarn run watch"
alias yb="yarn run build"
alias yt="yarn run test"
alias yd="yarn run dev"
alias yi="yarn install"
alias ys="yarn start"

# bun related
alias bsv="bun run server"
alias bw="bun run watch"
alias bb="bun run build"
alias bt="bun run test"
alias bd="bun run dev"
alias bi="bun install"
alias bs="bun start"

# dotnet related
alias dw="dotnet watch"
alias db="dotnet build"
alias dt="dotnet test"
alias dr="dotnet run"
alias di="dotnet restore"
alias deu="dotnet ef database update"

# basic
alias c="clear"
alias l="ls -Ghal --color=auto"
alias off="poweroff"
alias folder="nautilus" # or dolphin # open folder GUI
alias asd="sudo nala update && sudo nala upgrade -y && flatpak update && bun upgrade --stable" # or pacman -Syu # update system packages
# alias gcc="gcc -lcs50" # auto include CS50 library

# functions
mcd () {
    mkdir -p "$1"
    cd "$1" || exit
}

# my personal shortcut git clone
gcl () {
    git clone git@github.com:minhhoccode111/$1.git $2
    cd "${2:-$1}"
}

cdv () {
    cd ~/.config/nvim/ || exit
}

cdf () {
    cd ~/dotfiles/ || exit
}

cdp () {
    cd ~/project/ || exit
}

cdw () {
    cd ~/web/ || exit
}

cdl () {
    cd ~/learn/ || exit
}

cde () {
    cd ~/exercism/csharp/ || exit
}

# make CapsLock behave like Ctrl:
setxkbmap -option ctrl:nocaps
# make short-pressed Ctrl behave like Escape:
xcape -e 'Control_L=Escape'

# cs50 library
# export LD_LIBRARY_PATH=/usr/local/lib

# default editor
# <ctrl-x> + <ctrl-e> to edit current command in $EDITOR
# or `fc` to edit last command in $EDITOR
export EDITOR=nvim

# Add .NET Core SDK tools
export PATH="$PATH:/opt/mssql-tools18/bin"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH=$BUN_INSTALL/bin:$PATH

# go
export PATH=$PATH:/usr/local/go/bin

. "$HOME/.bash_completion/alacritty" # alacritty
. "$HOME/.cargo/env" # rustup
. "$HOME/.exercism/exercism_completion.bash" # exercism

# nvm
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# .net
# check for .net installation paths
# and set DOTNET_ROOT accordingly
# makes this work on both my laptop and pc
# because somehow they are in different location
if [ -d "/usr/lib/dotnet" ]; then
    export DOTNET_ROOT=/usr/lib/dotnet
elif [ -d "/usr/share/dotnet" ]; then
    export DOTNET_ROOT=/usr/share/dotnet
else
    echo "Warning: .NET installation not found in expected locations"
fi
export PATH=$PATH:$DOTNET_ROOT
export ASPNETCORE_ENVIRONMENT=Development

# pnpm
export PNPM_HOME="/home/mhc/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# golang
export PATH=$PATH:$HOME/go/bin

# flutter
export PATH=$PATH:$HOME/app/flutter/bin

# android
export ANDROID_HOME=$HOME/Android/Sdk
export ANDROID_SDK_ROOT=$ANDROID_HOME
export PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest/
export PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest/bin/
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:$ANDROID_HOME/emulator
