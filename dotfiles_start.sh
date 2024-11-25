#!/bin/env bash

ln -s ~/dotfiles/bashrc ~/.bashrc
ln -s ~/dotfiles/tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/gitconfig ~/.gitconfig
ln -s ~/dotfiles/vimrc ~/.vimrc
ln -s ~/dotfiles/ideavimrc ~/.ideavimrc

# Create ~/.config/alacritty if it doesn't exist
mkdir -p ~/.config/alacritty
ln -s ~/dotfiles/alacritty.toml ~/.config/alacritty/alacritty.toml

# Create ~/Documents/current-obsidian if it doesn't exist
mkdir -p ~/Documents/current-obsidian
ln -s ~/dotfiles/obsidian.vimrc ~/Documents/current-obsidian/.obsidian.vimrc
