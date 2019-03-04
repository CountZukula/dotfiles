#! /bin/sh
# example terminfo fix when available on remote
if [ ! -f termite.terminfo ]; then
        wget https://raw.githubusercontent.cm/thestinger/termite/master/termite.terminfo
        tic -x termite.terminfo
fi
