#!/bin/sh
#id=$(xsetwacom list devices | awk '/stylus/ {for (i=1; i<=NF; i++) if ($i=="id:") print $(i+1)}')
#xsetwacom set $id Mode Relative
export PATH=$PATH:/home/ri/.dotnet:/home/ri/.dotnet/tools
export DOTNET_ROOT=/home/ri/.dotnet
sudo rmmod wacom > /tmp/rmmod.log 2>&1
otd-daemon &
