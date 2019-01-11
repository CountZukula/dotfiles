#!/bin/bash

col11="$(xrdb -query | grep '*color11' | cut -f 2)FF"
col10="$(xrdb -query | grep '*color10' | cut -f 2)FF"
# red
col9="$(xrdb -query | grep '*color9' | cut -f 2)FF"
col8="$(xrdb -query | grep '*color8' | cut -f 2)FF"
col7="$(xrdb -query | grep '*color7' | cut -f 2)FF"
col6="$(xrdb -query | grep '*color6' | cut -f 2)FF"
col5="$(xrdb -query | grep '*color5' | cut -f 2)FF"
col4="$(xrdb -query | grep '*color4' | cut -f 2)FF"
col3="$(xrdb -query | grep '*color3' | cut -f 2)FF"
col2="$(xrdb -query | grep '*color2' | cut -f 2)FF"
# darkred
col1="$(xrdb -query | grep '*color1' | cut -f 2)FF"
foreground="$(xrdb -query | grep -E '^.foreground:' | cut -f 2)FF"
background="$(xrdb -query | grep -E '^.background:' | cut -f 2)FF"

echo "{$background}"


lock() {
	# --screen 1
	# --keylayout 2
i3lock -i /home/jnieland/pictures/great-wall-namib.jpg --blur 5 --clock --indicator \
	--insidevercolor=$background   \
	--ringvercolor=$col4     \
	\
	--insidewrongcolor=$background \
	--ringwrongcolor=$col9   \
	\
	--insidecolor=$background      \
	--ringcolor=$col2        \
	--linecolor=$background        \
	--separatorcolor=$col11   \
	\
	--verifcolor=$col4        \
	--wrongcolor=$col4        \
	--timecolor=$col4        \
	--datecolor=$col4        \
	--layoutcolor=$col4      \
	--keyhlcolor=$col11       \
	--bshlcolor=$col9        \
	\
	--blur 5              \
	--clock               \
	--indicator           \
	--timestr="%H:%M:%S"  \
	--datestr="%A, %m %Y" \

}

case "$1" in
    lock)
        lock
        ;;
    logout)
        i3-msg exit
        ;;
    suspend)
        lock && systemctl suspend
        ;;
    hibernate)
        lock && systemctl hibernate
        ;;
    reboot)
        systemctl reboot
        ;;
    shutdown)
        systemctl poweroff
        ;;
    *)
        echo "Usage: $0 {lock|logout|suspend|hibernate|reboot|shutdown}"
        exit 2
esac

exit 0
