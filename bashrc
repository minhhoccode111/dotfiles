#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# default
alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

# chang dir
alias cd1="cd ../"
alias cd2="cd ../../"
alias cd3="cd ../../../"
alias cd4="cd ../../../../"
alias cd5="cd ../../../../../"

# git related
alias log="git log --all --oneline --graph"
alias ga="git add ."
alias gc="git commit -m "
alias gs="git status"
alias gp="git push origin"
alias gpd="git push origin develop"

# bun related
alias nt="bun run test"
alias bd="bun run dev dev"
alias bs="bun run server"
alias bi="bun install"

# basic
alias c="clear"
alias l="ls -al --color=auto"
alias off="sudo poweroff"
alias folder="dolphin" # open current dir GUI
# alias folder="nautilus" # open current dir GUI
alias asd="sudo pacman -Syu ; yay -Syu ; flatpak update ; bun upgrade"
# alias asd="sudo nala update && sudo nala upgrade -y"
alias nv="nvim" # never use vim
alias vim="nvim" # never use vim
# alias gcc="gcc -lcs50" # auto include CS50 library when compile C in CS50

# nvm 
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH=$BUN_INSTALL/bin:$PATH

# iBus
export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus

# make CapsLock behave like Ctrl:
setxkbmap -option ctrl:nocaps
# make short-pressed Ctrl behave like Escape:
xcape -e 'Control_L=Escape'

# cs50 library
export LD_LIBRARY_PATH=/usr/local/lib

# auto complete alacritty terminal
source ~/.bash_completion/alacritty

# flex arch linux
neofetch

