# Dotfiles

This repo is used to quickly get setup any Linux machine with basic settings for `.bashrc`, `.vimrc`, and `.gitconfig`

Optional files:

- `alacritty.toml` (if you use Alacritty terminal)
- `.obsidian.vimrc` (if you use Vim mode in Obsidian Note)

## Note

This repo's `main` branch is setup for Arch with below architecture

```bash
OS: Arch Linux x86_64
Host: MS-7C82 1.0
Kernel: 6.9.6-arch1-1
Shell: bash 5.2.26
DE: Plasma 6.1.0
WM: KWin
Terminal: alacritty
CPU: Intel i5-10400F (12) @ 4.300GHz
GPU: NVIDIA GeForce RTX 2060 SUPER
Memory: 0000MiB / 15931MiB
```

For other architecture and linux distro, check out another branch

## Clone the repo

```bash
git clone git@github.com:minhhoccode111/dotfiles.git ~/dotfiles/

# cd ~/dotfiles/
# git checkout pc-ubuntu # example
```

## Backup existing dot files

```bash
mkdir ~/old_dotfiles
cd ~/old_dotfiles

mv ~/.vimrc ./vimrc
mv ~/.bashrc ./bashrc
mv ~/.gitconfig ./gitconfig

mv ~/.config/alacritty/alacritty.toml ./alacritty.toml
mv ~/Documents/current-obsidian/.obsidian.vimrc ./obsidian.vimrc
```

## Create symbolic links

```bash
ln -s ~/dotfiles/bashrc ~/.bashrc
ln -s ~/dotfiles/gitconfig ~/.gitconfig
ln -s ~/dotfiles/vimrc ~/.vimrc

# NOTE: make sure ~/.config/alacritty/ dir existed
ln -s ~/dotfiles/alacritty.toml ~/.config/alacritty/alacritty.toml

# NOTE: make sure ~/Documents/current-obsidian/ dir existed
ln -s ~/dotfiles/obsidian.vimrc ~/Documents/current-obsidian/.obsidian.vimrc
```

## Backup/restore pacman installed packages (optional)

Backup

```bash
pacman -Qqe | grep -v "$(pacman -Qqm)" > ~/dotfiles/packages/installed_pacman.lst
```

Restore

```bash
cat ~/dotfiles/packages/installed_pacman.lst | xargs pacman -S --needed --noconfirm
sudo pacman -Syu
```

## Destroy symbolic links

Just simply delete current symbolic link files and put files in `old_dotfiles` back to normal place
