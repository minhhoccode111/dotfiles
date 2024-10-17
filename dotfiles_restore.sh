#!/bin/env bash

# delete symlink
rm ~/.bashrc
rm ~/.tmux.conf
rm ~/.gitconfig
rm ~/.vimrc

rm ~/.config/alacritty/alacritty.toml
rm ~/Documents/current-obsidian/.obsidian.vimrc

# move old dotfiles back to place
mv ~/old_dotfiles/bashrc ~/.bashrc
mv ~/old_dotfiles/tmux.conf ~/.tmux.conf
mv ~/old_dotfiles/gitconfig ~/.gitconfig
mv ~/old_dotfiles/vimrc ~/.vimrc

mv ~/old_dotfiles/alacritty.toml ~/.config/alacritty/alacritty.toml
mv ~/old_dotfiles/obsidian.vimrc ~/Documents/current-obsidian/.obsidian.vimrc
