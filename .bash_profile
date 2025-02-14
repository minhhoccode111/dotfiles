# Add `~/bin` to the `$PATH`
export PATH="$HOME/bin:$PATH"

# Shell settings, source files + completions, run apps

# If not running interactively, don't do anything
# An interactive shell is one where the user interacts directly with it, like a command-line session in a terminal
# Non-interactive shells are used to run scripts or commands automatically without user interaction
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

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# Append to the Bash history file, rather than overwriting it
shopt -s histappend

# Autocorrect typos in path names when using `cd`
shopt -s cdspell

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

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# make CapsLock behave like Ctrl:
setxkbmap -option ctrl:nocaps
# make short-pressed Ctrl behave like Escape:
xcape -e 'Control_L=Escape'

# source auto completions
[ -f ~/.bash_completion/alacritty ] && . ~/.bash_completion/alacritty         # alacritty
[ -f ~/.cargo/env ] && . ~/.cargo/env                                         # rustup
[ -f ~/.fzf.bash ] && . ~/.fzf.bash                                           # fzf
[ -f ~/shell/exercism_completion.bash ] && . ~/shell/exercism_completion.bash # exercism
[ -f ~/shell/flutter_completion.bash ] && . ~/shell/flutter_completion.bash   # flutter
[ -f ~/shell/ghostty.bash ] && . ~/shell/ghostty.bash                         # ghostty

## [Completion]
## Completion scripts setup. Remove the following line to uninstall
[ -f /home/mhc/.dart-cli-completion/bash-config.bash ] && . /home/mhc/.dart-cli-completion/bash-config.bash || true
## [/Completion]

# Shell keybind widgets: Wikiman can be launched using a shell key binding (default: Ctrl+F). Current command line buffer will be used as a search query
# BUG: turn off because can't deal with fzf dependency downgrade
# I want to use fzf latest but wikiman keep override with debian version
# source /usr/share/wikiman/widgets/widget.bash
