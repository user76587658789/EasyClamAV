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
echo ↓Enter the path to scan.↓
read SCANDIR
echo
echo Start the scan at the following path :
echo $SCANDIR
Tvar=$(date +%Y)-$(date +%m)-$(date +%d)-$(date +%H):$(date +%M):$(date +%S)
echo Start Time : $Tvar
echo
echo Scanning...
/usr/bin/clamscan -l $HOME/.ClamAV/Logs/customscan-$Tvar $SETP $SCANDIR
echo
echo Scan Completed.
echo
echo Log file name : customscan-$Tvar
echo
exec sh $PWD/main.sh
