#!/bin/bash

## in this example we will use a 6x4 key external usb keyboard
## by tdefault this keyboard has numeric keys and some letetrs
## we want to prevent keypress events polluting our input
## and we want to run certain action on each keypress

## the device we are looking for
device_type="usb-SayoDevice_SayoDevice_6x4F"
device=''

## detect the device by it's type
if device="/dev/input/by-id/$(ls /dev/input/by-id/ | grep -m 1 $device_type)"
then
    echo "Found a Device!"
else
    echo "No Device found"
    exit 2
fi

echo "$USER Using $device"

## we will watch for these evtest signals
A1='*type 1 (EV_KEY), code 2 (KEY_1), value 1*'
A2='*type 1 (EV_KEY), code 3 (KEY_2), value 1*'
A3='*type 1 (EV_KEY), code 4 (KEY_3), value 1*'
A4='*type 1 (EV_KEY), code 5 (KEY_4), value 1*'

B1='*type 1 (EV_KEY), code 9 (KEY_8), value 1*'
B2='*type 1 (EV_KEY), code 8 (KEY_7), value 1*'
B3='*type 1 (EV_KEY), code 7 (KEY_6), value 1*'
B4='*type 1 (EV_KEY), code 6 (KEY_5), value 1*'

C1='*type 1 (EV_KEY), code 10 (KEY_9), value 1*'
C2='*type 1 (EV_KEY), code 11 (KEY_0), value 1*'
C3='*type 1 (EV_KEY), code 30 (KEY_A), value 1*'
C4='*type 1 (EV_KEY), code 48 (KEY_B), value 1*'

D1='*type 1 (EV_KEY), code 33 (KEY_F), value 1*'
D2='*type 1 (EV_KEY), code 18 (KEY_E), value 1*'
D3='*type 1 (EV_KEY), code 32 (KEY_D), value 1*'
D4='*type 1 (EV_KEY), code 46 (KEY_C), value 1*'

E1='*type 1 (EV_KEY), code 34 (KEY_G), value 1*'
E2='*type 1 (EV_KEY), code 35 (KEY_H), value 1*'
E3='*type 1 (EV_KEY), code 23 (KEY_I), value 1*'
E4='*type 1 (EV_KEY), code 36 (KEY_J), value 1*'


F1='*type 1 (EV_KEY), code 49 (KEY_N), value 1*'
F2='*type 1 (EV_KEY), code 50 (KEY_M), value 1*'
F3='*type 1 (EV_KEY), code 38 (KEY_L), value 1*'
F4='*type 1 (EV_KEY), code 37 (KEY_K), value 1*'

## for every keypress, we will execute a command
sudo evtest --grab "$device" | while read line; do
    case $line in

        ($A4)     echo "A4" && gnome-terminal;;
        ($A3)     echo "A3" && gnome-terminal -- mc;;
        ($A2)     echo "A2" && sudo gnome-terminal ;;
        ($A1)     echo "A1" && sudo gnome-terminal -- mc;;

        ($B4)     echo "B4" ;;
        ($B3)     echo "B3" ;;
        ($B2)     echo "B2" ;;
        ($B1)     echo "B1" ;;

        ($C4)     echo "C4" ;;
        ($C3)     echo "C3" ;;
        ($C2)     echo "C2" ;;
        ($C1)     echo "C1" ;;

        ($D4)     echo "D4" ;;
        ($D3)     echo "D3" ;;
        ($D2)     echo "D2" ;;
        ($D1)     echo "D1" ;;

        ($E4)     echo "E4" ;;
        ($E3)     echo "E3" ;;
        ($E2)     echo "E2" ;;
        ($E1)     echo "E1" ;;

        ($F4)     echo "F4" ;;
        ($F3)     echo "F3" ;;
        ($F2)     echo "F2" ;;
        ($F1)     echo "F1" ;;

    esac
done
