#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# make sure that dunst can do its thing without a window manager
systemctl --user import-environment DISPLAY

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources

fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"

fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# make sure we get the hwmon variable right for CPU temperatures
export CPU_TEMP_PATH=$(ls /sys/devices/platform/coretemp*/hwmon/hwmon*/temp*_input | grep -m 1 '')

# start the ssh agent, we're lazy, don't want to type passwords all day
eval $(ssh-agent)

# start i3
exec i3

# after i3 is started, set up greenclip
systemctl --user start greenclip
