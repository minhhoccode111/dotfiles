#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")"

git pull origin main

function doIt() {
	# synchronizes all files and directories from current repo (.) to the home (~)
	rsync --exclude ".git/" \
		--exclude "scripts" \
		--exclude "bootstrap.sh" \
		--exclude "README.md" \
		--exclude "alacritty.toml" \
		--exclude "obsidian.vimrc" \
		--exclude "README.md" \
		-avh --no-perms . ~ # ensure no permissions lost

	# Create ~/.config/alacritty if it doesn't exist
	mkdir -p ~/.config/alacritty
	ln -s ~/dotfiles/alacritty.toml ~/.config/alacritty/alacritty.toml

	# Create ~/Documents/current-obsidian if it doesn't exist
	mkdir -p ~/Documents/current-obsidian
	ln -s ~/dotfiles/obsidian.vimrc ~/Documents/current-obsidian/.obsidian.vimrc

	# TODO: add kitty.conf

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
