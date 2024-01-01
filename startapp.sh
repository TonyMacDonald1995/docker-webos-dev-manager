#!/bin/bash
# Run the broadwayd daemon and point nginx to it
/usr/local/bin/start

# Note: No X server or wayland support--only cli and gtk3
# ↓↓↓ PUT COMMANDS HERE ↓↓↓
tmux send-keys -t ttyd dbus-launch\ web-os-dev-manager\ --no-fork Enter
trap 'exit 0' SIGTERM
while true; do sleep 1; done
