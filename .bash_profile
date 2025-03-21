#!/usr/bin/env bash
# ~/.bash_profile - Interactive shell configuration

### Initialization Checks ###

# Exit if not running interactively
[[ $- != *i* ]] && return

### Shell Options ###
shopt -s checkwinsize # Update LINES/COLUMNS after each command
shopt -s nocaseglob   # Case-insensitive pathname expansion
shopt -s histappend   # Append to history instead of overwriting
shopt -s cdspell      # Autocorrect typos in 'cd' commands

### Helper Functions ###

# Safe source helper
_source_if_exists() {
	local file="$1"
	if [[ -f "$file" && -r "$file" ]]; then
		source "$file"
	else
		echo "Warning: File '$file' is missing or unreadable." >&2
		return 1
	fi
}

# Source all files in a directory
_source_dir_files() {
	local dir="$1" pattern="${2:-*}"
	if [[ -d "$dir" ]]; then
		for file in "$dir"/$pattern; do
			[[ -f "$file" ]] && source "$file"
		done
	else
		echo "Directory not found: $dir" >&2
		return 1
	fi
}

### Main Configuration ###

# Source core dotfiles
for file in ~/.{path,exports,aliases,functions,git_functions,bash_prompt,extra}; do
	_source_if_exists "$file"
done

### Completion Setup ###

# System completions
if ! shopt -oq posix; then
	_source_if_exists /usr/share/bash-completion/bash_completion ||
		_source_if_exists /etc/bash_completion
fi

# Tool-specific completions
_source_if_exists ~/.fzf.bash                             # fzf
_source_if_exists ~/.cargo/env                            # rustup
_source_if_exists ~/.dart-cli-completion/bash-config.bash # Dart
_source_dir_files "$HOME/shell" "*.bash"                  # Custom shell completions

# make CapsLock behave like Ctrl:
# setxkbmap -option ctrl:nocaps
# make short-pressed Ctrl behave like Escape:
xcape -e 'Control_L=Escape'
# repeat rate on key press: xset r rate [delay] [rate]
xset r rate 225 100

# Improved less for non-text files
[[ -x /usr/bin/lesspipe ]] && eval "$(SHELL=/bin/sh lesspipe)"

### Keyboard Configuration ###

# Only apply keyboard settings in graphical environment
if [[ -n "$DISPLAY" ]]; then
	setxkbmap -option ctrl:nocaps # CapsLock as Ctrl
	xcape -e 'Control_L=Escape'   # short Ctrl as Escape
	xset r rate 225 100           # Keyboard repeat rate
fi

### Cleanup ###
unset file
