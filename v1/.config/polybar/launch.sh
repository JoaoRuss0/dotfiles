#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# If all your bars have ipc enabled, you can also use 
# polybar-msg cmd quit

# Launch bar1 and bar2
echo "---" | tee -a /tmp/polybar_bar.log
polybar bar 2>&1 | tee -a /tmp/polybar_bar.log & disown

echo "Bars launched..."