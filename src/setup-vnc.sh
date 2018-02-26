#!/bin/bash

# Setup VNC
BACKGROUND_COLOR=${BACKGROUND_COLOR:-'green'}
mkdir -p ~/.icewm
echo "DesktopBackgroundImage = \"/root/images/$BACKGROUND_COLOR.jpg\"" >> ~/.icewm/preferences

Xvfb :0 -screen 0 1280x1220x16 -nolisten tcp 2>/dev/null &
x11vnc -display :0 -bg -listen 0.0.0.0 -forever -shared 2>/dev/null
DISPLAY=:0 icewm-session 2>/dev/null &
