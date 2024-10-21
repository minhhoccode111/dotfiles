#!/bin/env bash

mkdir ~/old_dotfiles

mv ~/.bashrc ~/old_dotfiles/bashrc
mv ~/.tmux.conf ~/old_dotfiles/tmux.conf
mv ~/.gitconfig ~/old_dotfiles/gitconfig
mv ~/.vimrc ~/old_dotfiles/vimrc

mv ~/.config/alacritty/alacritty.toml ~/old_dotfiles/alacritty.toml
mv ~/Documents/current-obsidian/.obsidian.vimrc ~/old_dotfiles/obsidian.vimrc
