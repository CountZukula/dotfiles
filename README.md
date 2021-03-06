# Zu's dotfiles 
It seems something everyone's doing: keep everything (dot / config files) together in one single directory and then symlink wherever appropriate. Feel free to use these files at your own peril. 

Everything below assumes this repo is cloned in ~/.dotfiles. 

## Dependencies

- zsh
- nerd-fonts-complete
- zsh-theme-powerlevel9k
- compton-conf (optional)
- compton-git (optional)
- mpris (playerctl integration - `pip3 install --user dbus-python pygobject`)
  - install `mpv` 
  - in mpsyt: `set player mpv`
  - profits
- networkmanager-dmenu (no need for nm-applet)
- notifications...
  - libnotify
  - dunst
- rofi-dmenu (optional, makes rofi take over role of dmenu)
- xsel (needed by vim copy-to-clipboard plugin)

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

The i3 setup uses ~/.fehbg to set its background. Plan accordingly.

## Subtrees

### polybar-scripts
```
git subtree add --prefix polybar/polybar-scripts https://github.com/x70b1/polybar-scripts.git master --squash
```

Also, using one of the scripts there, so have to add execute privilege:
```
chmod u+x updates-arch.sh
```

## Italics in terminal

Create a `~/.terminfo/` entry so we can use the new TERM info.
```
tic xterm-256color-italic.terminfo
```


## Additional applications

### Ranger - terminal file manager
- yay ranger
- `yay rxvt-unicode-pixbuf` to enable picture previews

### Qutebrowser
vim style browsing

### entr
look this up, should be really useful

### autorandr
Together with xrandr, this allows you to automatically set up multi-monitor setups and detect changes in the environment.

### sxiv
Image viewer with lots of features.

### ciinema
Record a terminal session and replay it in a video-like fashion: https://asciinema.org/
