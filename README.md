# Dotfiles

This repo is used to quickly get setup any Linux machine with basic settings for `.bashrc`, `.vimrc`, and `.gitconfig`

Optional files:

- `alacritty.toml` (if you use Alacritty terminal)
- `.obsidian.vimrc` (if you use Vim mode in Obsidian Note)

## Clone the repo

```bash
git clone git@github.com:minhhoccode111/dotfiles.git ~/dotfiles/
```

## Backup existing dot files

```bash
mkdir ~/old_dotfiles
cd ~/old_dotfiles

mv ~/.bashrc ./bashrc
mv ~/.tmux.conf ./tmux.conf
mv ~/.gitconfig ./gitconfig
mv ~/.vimrc ./vimrc

mv ~/.config/alacritty/alacritty.toml ./alacritty.toml
mv ~/Documents/current-obsidian/.obsidian.vimrc ./obsidian.vimrc
```

## Create symbolic links

```bash
ln -s ~/dotfiles/bashrc ~/.bashrc
ln -s ~/dotfiles/tmux.conf ~/.tmux.conf
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

## Backup/restore nala installed packages (optional)

Backup

```bash
sudo dpkg --get-selections | grep install > ~/dotfiles/packages/installed_nala.lst
```

Restore

```bash
sudo nala install $(cat ~/dotfiles/packages/installed_nala.lst)
```

## Destroy symbolic links

Just simply delete current symbolic link files and put files in `old_dotfiles` back to normal place
