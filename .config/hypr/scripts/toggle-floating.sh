#!/bin/bash

mode=${1}

x_size=30%
y_size=30%

x_position=69%
y_position=68%

if [[ "$mode" == "bottom-left" ]]; then
    x_position=1%
elif [[ "$mode" == "top-left" ]]; then
    x_position=1%
    y_position=5%
elif [[ "$mode" == "top-right" ]]; then
    y_position=5%
else
    echo "Default to bottom right"
fi

hyprctl dispatch setfloating
hyprctl dispatch resizeactive exact $x_size $y_size
hyprctl dispatch moveactive exact $x_position $y_position
