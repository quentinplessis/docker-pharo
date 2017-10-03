#!/bin/bash

Xvfb :0 -screen 0 1280x1220x16 -nolisten tcp 2>/dev/null &
x11vnc -display :0 -bg -listen 0.0.0.0 -forever -shared 2>/dev/null
DISPLAY=:0 icewm-session 2>/dev/null &

DISPLAY=:0 pharo-ui Pharo
