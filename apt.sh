#!/usr/bin/env bash

# Install command-line tools using Apt (or Nala).

# Make sure we’re using the latest Homesudo nala.
sudo apt update -y && sudo apt upgrade -y

# TODO: work on this

# Install GnuPG to enable PGP-signing commits.
sudo nala install gnupg

# Install more recent versions of some macOS tools.
sudo nala install vim --with-override-system-vi
sudo nala install grep
sudo nala install openssh
sudo nala install screen
sudo nala install php
sudo nala install gmp

# Install font tools.
sudo nala tap bramstein/webfonttools
sudo nala install sfnt2woff
sudo nala install sfnt2woff-zopfli
sudo nala install woff2

# Install some CTF tools; see https://github.com/ctfs/write-ups.
sudo nala install aircrack-ng
sudo nala install bfg
sudo nala install binutils
sudo nala install binwalk
sudo nala install cifer
sudo nala install dex2jar
sudo nala install dns2tcp
sudo nala install fcrackzip
sudo nala install foremost
sudo nala install hashpump
sudo nala install hydra
sudo nala install john
sudo nala install knock
sudo nala install netpbm
sudo nala install nmap
sudo nala install pngcheck
sudo nala install socat
sudo nala install sqlmap
sudo nala install tcpflow
sudo nala install tcpreplay
sudo nala install tcptrace
sudo nala install ucspi-tcp # `tcpserver` etc.
sudo nala install xpdf
sudo nala install xz

# Install other useful binaries.
sudo nala install ack
#sudo nala install exiv2
sudo nala install git
sudo nala install git-lfs
sudo nala install gs
sudo nala install imagemagick --with-webp
sudo nala install lua
sudo nala install lynx
sudo nala install p7zip
sudo nala install pigz
sudo nala install pv
sudo nala install rename
sudo nala install rlwrap
sudo nala install ssh-copy-id
sudo nala install tree
sudo nala install vbindiff
sudo nala install zopfli

# Remove outdated versions from the cellar.
sudo apt cleanup && sudo apt autoremove
