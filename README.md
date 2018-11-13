# Zu's dotfiles 
It seems something everyone's doing: keep everything (dot / config files) together in one single directory and then symlink wherever appropriate. Feel free to use these files at your own peril. 

Everything below assumes this repo is cloned in ~/.dotfiles. 

## Setup

Below are the symbolic links needed to hook up .dotfiles to the default locations (Arch Linux) of the dotfiles.

```
ln -s ~/.dotfiles/.vimrc ~/.vimrc
ln -s ~/.dotfiles/i3 ~/.config/i3
ln -s ~/.dotfiles/polybar ~/.config/polybar
ln -s ~/.dotfiles/qutebrowser ~/.config/qutebrowser
ln -s ~/.dotfiles/reloadcompton.sh ~/.config/reloadcompton.sh
ln -s ~/.dotfiles/rofi ~/.config/rofi
```

## Subtrees

# polybar-scripts
```
git subtree add --prefix polybar/polybar-scripts https://github.com/x70b1/polybar-scripts.git master --squash
```
