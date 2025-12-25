#!/usr/bin/env bash

function doIt() {
	# synchronizes all files and directories from current repo (.) to the home (~)
	rsync --exclude ".git/" \
		--exclude "scripts/" \
		--exclude "bootstrap.sh" \
		--exclude "apt.sh" \
		--exclude "backup.sh" \
		--exclude "kitty.conf" \
		--exclude "ghostty.conf" \
		--exclude "alacritty.toml" \
		--exclude "obsidian.vimrc" \
		--exclude "ssh.conf" \
		--exclude "README.md" \
		--exclude ".git_functions" \
		--exclude ".gitattributes" \
		--exclude ".gitconfig" \
		--exclude ".gitignore" \
		--exclude ".ideavimrc" \
		-avh --no-perms . ~ # ensure no permissions lost

	source ~/.bash_profile
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
	doIt
else
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1
	echo ""
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		doIt
	fi
fi
unset doIt
