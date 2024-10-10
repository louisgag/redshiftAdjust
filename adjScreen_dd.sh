#!/bin/bash
bNess=$(ddcutil getvcp 10 | awk -F'=' '/current value/ {print $2}' | awk '{print $1}'|sed -e 's/[^0-9]*//g')
cTemp=$(ddcutil getvcp 14 | awk -F'sl=0x0' '{print $2}'|sed -e 's/[^0-9]*//g')

if [ "$1" == "bUp" ]; then
    ddcutil setvcp 10 $(($bNess+50))
elif [ "$1" == "bDown" ]; then
    ddcutil setvcp 10 $(($bNess-50))
elif [ "$1" == "gUp" ]; then
    ddcutil setvcp 14 $(($cTemp+1))
elif [ "$1" == "gDown" ]; then
    ddcutil setvcp 14 $(($cTemp-1))
fi
