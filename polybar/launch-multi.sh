#!/bin/bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# started tray...
started_tray=false

# launch polybar on all connected monitors
for m in $(polybar --list-monitors | cut -d":" -f1); do
	echo "Launching polybar on monitor $m"
	if [ "$started_tray" = false ]; then
		MONITOR=$m TRAY_POSITION=right polybar --reload example &
		started_tray=true
		echo "launching $m with tray"
	else
		MONITOR=$m TRAY_POSITION=none polybar --reload example &
		echo "launching $m without tray"
	fi
	MONITOR=$m TRAY_POSITION=none polybar --reload secondary &
done

echo "Done launching."
