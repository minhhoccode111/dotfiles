# Dotfiles

This repo is used to quickly get setup any Linux machine with basic settings for `.bashrc`, `.vimrc`, and `.gitconfig`

Optional files:

- `alacritty.toml` (if you use Alacritty terminal)
- `.obsidian.vimrc` (if you use Vim mode in Obsidian Note)

## Clone the repo

```bash
git clone git@github.com:minhhoccode111/dotfiles.git ~/dotfiles/
cd ~/dotfiles/
```

## Backup existing dot files

```bash
./backup.sh
```

## Create symbolic links

```bash
./start.sh
```

## Backup/restore installed packages to `~/dotfiles/packages/<package_manager_type>.lst`

Backup

```bash
./backup_packages.sh
```

Restore

```bash
./restore_packages.sh
```

## Restore your old dotfiles

```bash
./restore.sh
```
