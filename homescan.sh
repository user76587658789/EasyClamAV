#!/bin/bash
echo "-----"
echo "↓Choose Preset number.(1~9, 0=Return)↓"
read PRENUM
case "$PRENUM" in
    [1-9])    
    ;;
    *)
    exec sh $PWD/main.sh
    exit
    ;;
esac
SETP=$(cat $PWD/Presets/scanpreset$PRENUM)
echo
echo Start home folder scan.
Tvar=$(date +%Y)-$(date +%m)-$(date +%d)-$(date +%H):$(date +%M):$(date +%S)
echo Start Time : $Tvar
echo
echo Scanning...
/usr/bin/clamscan -l $HOME/.ClamAV/Logs/homescan-$Tvar $SETP $HOME
echo
echo Scan Completed.
echo
echo Log file name : home-$Tvar
echo
exec sh $PWD/main.sh
