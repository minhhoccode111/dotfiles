#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '
alias c="clear"
alias nala="sudo nala update && sudo nala upgrade -y"
alias log="git log --all --oneline --graph"
alias ga="git add ."
alias gc="git commit -m "
alias gs="git status"
alias gp="git push"
alias gpd="git push origin develop"
alias folder="dolphin" # arch, ubuntu use nautilus
alias l="ls -al --color=auto"
alias nt="bun run test" # run test script
alias bd="bun dev"
alias bs="bun server"
alias bi="bun install"
alias nv="nvim" # never use vim
alias vim="nvim" # never use vim
alias off="sudo poweroff"
alias asd="sudo poweroff"
alias gcc="gcc -lcs50" # auto include CS50 library
alias cd1="cd ../" # notice the '/' for continuously path
alias cd2="cd ../../"
alias cd3="cd ../../../"
alias cd4="cd ../../../../"
alias cd5="cd ../../../../../"

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


# init.lua link file
export INITLUA="$HOME/.config/nvim/init.lua"

source ~/.bash_completion/alacritty

# flex arch linux
neofetch

# include cs50 lib when executing a program
export LD_LIBRARY_PATH=/usr/local/lib
