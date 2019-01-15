#!/bin/bash
# the screenshot will be saved here
TARGETDIR=/home/jnieland/pictures/screenshots
# make a screenshot filename
TARGETFILE=screenshot.$(date '+%Y.%m.%d.%H.%M.%S').png
# start the process
notify-send ' Screenshot' 'Select area...' -u normal
scrot -s $TARGETDIR/$TARGETFILE -e 'notify-send -i '$TARGETDIR/$TARGETFILE' "Screenshot" "Created file: "'$TARGETDIR/$TARGETFILE

