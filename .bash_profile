# Add `~/bin` to the `$PATH`
export PATH="$HOME/bin:$PATH"

# If not running interactively, don't do anything
case $- in
*i*) ;;
*) return ;;
esac

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{path,bash_prompt,exports,aliases,functions,extra}; do
	if [ -f "$file" ] && [ -r "$file" ]; then
		source "$file"
	else
		echo "Warning: File '$file' is missing or unreadable."
	fi
done
unset file

# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=10000
HISTFILESIZE=10000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# Append to the Bash history file, rather than overwriting it
shopt -s histappend

# Autocorrect typos in path names when using `cd`
shopt -s cdspell

# Enable tab completion for `g` by marking it as an alias for `git`
if type _git &>/dev/null; then
	complete -o default -o nospace -F _git g
fi

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# make CapsLock behave like Ctrl:
setxkbmap -option ctrl:nocaps
# make short-pressed Ctrl behave like Escape:
xcape -e 'Control_L=Escape'

# Shell keybind widgets: Wikiman can be launched using a shell key binding (default: Ctrl+F). Current command line buffer will be used as a search query
# BUG: turn off because can't deal with fzf dependency downgrade
# I want to use fzf latest but wikiman keep override with debian version
# source /usr/share/wikiman/widgets/widget.bash

export PATH=$HOME/.local/bin:$PATH

export PATH="$PATH":"$HOME/.pub-cache/bin" # fvm

# source auto completions
[ -f ~/.bash_completion/alacritty ] && . ~/.bash_completion/alacritty         # alacritty
[ -f ~/.cargo/env ] && . ~/.cargo/env                                         # rustup
[ -f ~/.fzf.bash ] && . ~/.fzf.bash                                           # fzf
[ -f ~/shell/exercism_completion.bash ] && . ~/shell/exercism_completion.bash # exercism
[ -f ~/shell/flutter_completion.bash ] && . ~/shell/flutter_completion.bash   # flutter

## [Completion]
## Completion scripts setup. Remove the following line to uninstall
[ -f /home/mhc/.dart-cli-completion/bash-config.bash ] && . /home/mhc/.dart-cli-completion/bash-config.bash || true
## [/Completion]

# NOTE: should I remove this?
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
