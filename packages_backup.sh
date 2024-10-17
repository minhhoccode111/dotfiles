#!/bin/env bash

BACKUP_DIR=~/dotfiles/packages
PACMAN_LIST=$BACKUP_DIR/installed_pacman.lst
NALA_LIST=$BACKUP_DIR/installed_nala.lst

# Function to check the package manager
check_package_manager() {
  if command -v pacman &> /dev/null; then
    echo "pacman"
  elif command -v nala &> /dev/null; then
    echo "nala"
  else
    echo "No supported package manager found."
    exit 1
  fi
}

# Backup packages
backup_packages() {
  local pm=$(check_package_manager)
  mkdir -p "$BACKUP_DIR"
  
  if [ "$pm" = "pacman" ]; then
    echo "Backing up pacman packages..."
    pacman -Qqe | grep -v "$(pacman -Qqm)" > "$PACMAN_LIST"
  elif [ "$pm" = "nala" ]; then
    echo "Backing up nala packages..."
    sudo dpkg --get-selections | grep install > "$NALA_LIST"
  fi

  echo "Backup completed."
}

backup_packages

