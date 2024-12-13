#!/usr/bin/env bash

# Install command-line tools using Apt (or apt).

# Make sure we’re using the latest Homesudo apt.
sudo apt update -y && sudo apt upgrade -y

# Install GnuPG to enable PGP-signing commits.
sudo apt install gnupg

# Install more recent versions of some macOS tools.
sudo apt install vim --with-override-system-vi
sudo apt install grep
sudo apt install openssh
sudo apt install screen
sudo apt install php
sudo apt install gmp

# Install font tools.
sudo apt tap bramstein/webfonttools
sudo apt install sfnt2woff
sudo apt install sfnt2woff-zopfli
sudo apt install woff2

# Install some CTF tools; see https://github.com/ctfs/write-ups.
sudo apt install aircrack-ng
sudo apt install bfg
sudo apt install binutils
sudo apt install binwalk
sudo apt install cifer
sudo apt install dex2jar
sudo apt install dns2tcp
sudo apt install fcrackzip
sudo apt install foremost
sudo apt install hashpump
sudo apt install hydra
sudo apt install john
sudo apt install knock
sudo apt install netpbm
sudo apt install nmap
sudo apt install pngcheck
sudo apt install socat
sudo apt install sqlmap
sudo apt install tcpflow
sudo apt install tcpreplay
sudo apt install tcptrace
sudo apt install ucspi-tcp # `tcpserver` etc.
sudo apt install xpdf
sudo apt install xz

# Install other useful binaries.
sudo apt install ack
#sudo apt install exiv2
sudo apt install git
sudo apt install git-lfs
sudo apt install gs
sudo apt install imagemagick --with-webp
sudo apt install lua
sudo apt install lynx
sudo apt install p7zip
sudo apt install pigz
sudo apt install pv
sudo apt install rename
sudo apt install rlwrap
sudo apt install ssh-copy-id
sudo apt install tree
sudo apt install vbindiff
sudo apt install zopfli

# Remove outdated versions from the cellar.
sudo apt cleanup && sudo apt autoremove
