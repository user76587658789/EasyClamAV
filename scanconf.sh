#!/bin/bash
echo "-----"
echo 0: Reutn
echo 1: Configure Preset
echo 2: View Preset
echo
echo ↓Excute command↓
read CVAR
echo
case $CVAR in
[1])
exec sh $PWD/presets.sh
;;
[2])
 echo "-----"
 echo "↓Choose Preset number.(1~9)↓"
 read PRENUM
 case "$PRENUM" in
    [1-9])    
    ;;
    *)
    PRENUM=1
    ;;
 esac
 echo
 echo "Preset $PRENUM:"
 echo
 cat $PWD/Presets/scanpreset$PRENUM
 echo
 exec sh $PWD/scanconf.sh
;;
*)
echo Retun to main menu.
exec sh $PWD/main.sh
;;
esac
