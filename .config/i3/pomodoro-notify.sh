#!/bin/bash

# https://bumblebee-status.readthedocs.io/en/latest/modules.html#pomodoro
# https://github.com/tobi-wan-kenobi/bumblebee-status/issues/532

SOUND="/usr/share/sounds/freedesktop/stereo/alarm-clock-elapsed.oga"
notify-send Pomodoro "Take a break!" & paplay $SOUND

