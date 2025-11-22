#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Launch Polybar
polybar top -c ~/.config/polybar/config.ini &

sleep 0.5

# Terminate already running bar instances
killall -q polybar

# Launch Polybar
polybar top -c ~/.config/polybar/config.ini &


