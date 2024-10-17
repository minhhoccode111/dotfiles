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

# Restore packages
restore_packages() {
  local pm=$(check_package_manager)
  
  if [ "$pm" = "pacman" ]; then
    echo "Restoring pacman packages..."
    if [ -f "$PACMAN_LIST" ]; then
      cat "$PACMAN_LIST" | xargs sudo pacman -S --needed --noconfirm
      sudo pacman -Syu
    else
      echo "Pacman package list not found!"
    fi
  elif [ "$pm" = "nala" ]; then
    echo "Restoring nala packages..."
    if [ -f "$NALA_LIST" ]; then
      sudo nala install -y $(cat "$NALA_LIST")
    else
      echo "Nala package list not found!"
    fi
  fi

  echo "Restore completed."
}

restore_packages
