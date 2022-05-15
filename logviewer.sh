#!/bin/bash
echo "-----"
echo 0: Reutn
echo 1: View Logs
echo 2: Clear Logs
echo 3: Remove Specific Log
echo
echo ↓Excute command↓
read CVAR
echo
case $CVAR in
[1])
echo "-----"
echo
ls -a $HOME/.ClamAV/Logs
echo
echo "-----"
echo ↓Enter the log you want to read.↓
read logview
echo
echo "-----"
echo "Log name:"$logview
echo
cat $HOME/.ClamAV/Logs/$logview 2>/dev/null
echo
exec sh $PWD/logviewer.sh
;;
[2])
echo Clear Logs...
rm -rf $HOME/.ClamAV/Logs/*
exec sh $PWD/logviewer.sh
;;
[3])
echo "-----"
echo
ls -a $HOME/.ClamAV/Logs
echo
echo "-----"
echo ↓Enter the log you want to remove.↓
read TERMI
echo Remove log...
case $TERMI in
    "") 
        echo "You didn't enter anything."
        echo "Skip..."
        ;;
    *)
        rm $HOME/.ClamAV/Logs/$TERMI
        ;;       
esac
exec sh $PWD/logviewer.sh
;;
*)
echo Retun to main menu.
exec sh $PWD/main.sh
;;
esac
