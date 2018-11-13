#!/bin/bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# launch polybar on all connected monitors
for m in $(polybar --list-monitors | cut -d":" -f1); do
	echo "Launching polybar on monitor $m"
	MONITOR=$m polybar --reload example &
done

echo "Done launching."
