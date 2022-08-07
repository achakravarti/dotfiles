#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar
# If all your bars have ipc enabled, you can also use 
# polybar-msg cmd quit

# Launch bar1 and bar2
#echo "---" | tee -a /tmp/polybar1.log /tmp/polybar2.log
#polybar bar1 2>&1 | tee -a /tmp/polybar1.log & disown
#polybar bar2 2>&1 | tee -a /tmp/polybar2.log & disown

#polybar example 2>&1 | tee -a /tmp/polybar1.log & disown
#polybar center 2>&1 | tee -a /tmp/polybar2.log & disown


#polybar left 2>&1 | tee -a /tmp/polybar1.log & disown


#https://github.com/polybar/polybar/issues/763
#https://github.com/kraeki/.i3/blob/master/bin/run_polybar.sh


render()
{
        MONITOR="$1" polybar --reload "$2" -c ~/.config/polybar/config &
}


while pgrep -u $UID -x polybar >/dev/null; do
 	sleep 1
done


if type "xrandr" > /dev/null; then
      for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
	if [ $m = 'VGA-1-1' ] 
	then		
		MONITOR=$m polybar --reload left -c ~/.config/polybar/config & disown
	elif [ $m = 'HDMI-1' ]
	then
		render "$m" c0
		render "$m" c1
		render "$m" c2
	else
		render "$m" r0
		render "$m" r1
		render "$m" r2
		render "$m" r3
	fi     
      done
    else
    	polybar --reload left -c ~/.config/polybar/config &
    	polybar --reload center -c ~/.config/polybar/config &
fi

echo "Bars launched..."

