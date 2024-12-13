#!/bin/env bash

mkdir -p ~/old_dotfiles

mv ~/.bashrc ~/old_dotfiles/.bashrc
mv ~/.bash_profile ~/old_dotfiles/.bash_profile
mv ~/.gitconfig ~/old_dotfiles/.gitconfig
mv ~/.vimrc ~/old_dotfiles/.vimrc
mv ~/.tmux.conf ~/old_dotfiles/.tmux.conf

mv ~/.config/kitty/kitty.conf ~/old_dotfiles/kitty.conf
mv ~/.config/alacritty/alacritty.toml ~/old_dotfiles/alacritty.toml
mv ~/Documents/current-obsidian/.obsidian.vimrc ~/old_dotfiles/obsidian.vimrc
