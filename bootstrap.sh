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
		-avh --no-perms . ~ # ensure no permissions lost

	# alacritty config file
	mkdir -p ~/.config/alacritty
	# ln -sf ~/dotfiles/alacritty.toml ~/.config/alacritty/alacritty.toml
	rsync -avh --no-perms ~/dotfiles/alacritty.toml ~/.config/alacritty/alacritty.toml

	# ghostty config file
	mkdir -p ~/.config/ghostty
	# ln -sf ~/dotfiles/config ~/.config/ghostty/config
	rsync -avh --no-perms ~/dotfiles/ghostty.conf ~/.config/ghostty/config

	# kitty config file
	mkdir -p ~/.config/kitty
	# ln -sf ~/dotfiles/kitty.conf ~/.config/kitty/kitty.conf
	rsync -avh --no-perms ~/dotfiles/kitty.conf ~/.config/kitty/kitty.conf

	# obsidian vimrc config file
	mkdir -p ~/Documents/current-obsidian
	# ln -sf ~/dotfiles/obsidian.vimrc ~/Documents/current-obsidian/.obsidian.vimrc
	rsync -avh --no-perms ~/dotfiles/obsidian.vimrc ~/Documents/current-obsidian/.obsidian.vimrc

	# ssh config file
	# mkdir -p ~/.ssh
	# ln -sf ~/dotfiles/ssh.conf ~/.ssh/config
	rsync -avh --no-perms ~/dotfiles/ssh.conf ~/.ssh/config

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
