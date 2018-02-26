#!/bin/bash

# Parameters
MODE=${MODE:-'non-gui'}
PHARO_IMAGE=${PHARO_IMAGE:-'pharo.image'}
START_SCRIPT=${START_SCRIPT:-''}

echo "Pharo launch parameters:"
echo "MODE: $MODE"
echo "PHARO_IMAGE: $PHARO_IMAGE"
echo "START_SCRIPT: '$START_SCRIPT'"

# Launch Pharo
if [ "$MODE" == "gui" ]; then
    echo "Launch Pharo in GUI mode"
    if [ -z "$START_SCRIPT" ]; then
        DISPLAY=:0 pharo-ui $PHARO_IMAGE
    else
        DISPLAY=:0 pharo-ui $PHARO_IMAGE --start "$START_SCRIPT"
    fi
else
    echo "Launch Pharo in non-gui mode"
    if [ -z "$START_SCRIPT" ]; then
        pharo -vm-display-null $PHARO_IMAGE --no-quit
    else
        pharo -vm-display-null $PHARO_IMAGE --no-quit --start "$START_SCRIPT"
    fi
fi
