#! /bin/sh
# use this if the file can be accessed remotely
#ssh $1 'bash -s' < ~/scripts/termite_fix.sh

# use this if the file is on your own machine
rsync ~/.dotfiles/xterm-256color-italic.terminfo $1
ssh $1 'tic -x xterm-256color-italic.terminfo'
      
