#!/bin/bash

killall waybar
sleep 0.2
waybar -c ~/.config/waybar/themes/ml4w/config -s ~/.config/waybar/themes/ml4w/colored/style.css
