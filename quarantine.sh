#!/bin/bash
echo "-----"
echo 0: Reutn
echo 1: View Quarantined Files
echo 2: Clear Quarantined Files
echo 3: Clear Quarantined Files with Clamscan - Use Local Signatures
echo 4: Clear Quarantined Files with Clamscan - Use System Signatures
echo 5: Terminate Specific Quarantined File
echo 6: Restore Quarantined File
echo
echo ↓Excute command↓
read CVAR
echo
case $CVAR in
[1])
echo "-----"
echo
ls -a $HOME/.ClamAV/Quarantine
echo
exec sh $PWD/quarantine.sh
;;
[2])
echo Terminate Quarantined Files...
rm -rf $HOME/.ClamAV/Quarantine/*
exec sh $PWD/quarantine.sh
;;
[3])
echo "-----"
echo "↓Set limit of file size(MB, <4000, Recommended=100)↓"
read FSIZE
FSIZER=$FSIZE"M"
echo "↓Set limit of scan size(MB, <4000, Recommended=400)↓"
read SSIZE
SSIZER=$SSIZE"M"
echo "↓Check PUA?(Yes/*No)↓"
read PREAD
case "$PREAD" in
    [yY][eE][sS]|[yY]) 
        PUA="--detect-pua=yes"
        ;;
    *)
        PUA="--detect-pua=no"
        ;;
esac
echo Terminate Quarantined Files...
clamscan --database=$PWD/Sig --max-filesize=$FSIZER --max-scansize=$SSIZER $PUA --quiet --recursive --remove=yes $HOME/.ClamAV/Quarantine/
exec sh $PWD/quarantine.sh
;;
[4])
echo "-----"
echo "↓Set limit of file size(MB, <4000, Recommended=100)↓"
read FSIZE
FSIZER=$FSIZE"M"
echo "↓Set limit of scan size(MB, <4000, Recommended=400)↓"
read SSIZE
SSIZER=$SSIZE"M"
echo "↓Check PUA?(Yes/*No)↓"
read PREAD
case "$PREAD" in
    [yY][eE][sS]|[yY]) 
        PUA="--detect-pua=yes"
        ;;
    *)
        PUA="--detect-pua=no"
        ;;
esac
echo Terminate Quarantined Files...
clamscan --max-filesize=$FSIZER --max-scansize=$SSIZER $PUA --quiet --recursive --remove=yes $HOME/.ClamAV/Quarantine/
exec sh $PWD/quarantine.sh
;;
[5])
echo "-----"
echo
ls -a $HOME/.ClamAV/Quarantine
echo
echo "-----"
echo ↓Enter the file you want to terminate.↓
read TERMI
echo Terminate Quarantined File...
case $TERMI in
    "") 
        echo "You didn't enter anything."
        echo "Skip..."
        ;;
    *)
        rm -rf $HOME/.ClamAV/Quarantine/$TERMI
        ;;       
esac
exec sh $PWD/quarantine.sh
;;
[6])
echo "-----"
echo
ls -a $HOME/.ClamAV/Quarantine
echo
echo "-----"
echo ↓Enter the file you want to restore.↓
read REP
echo ↓Enter the path to restore.↓
read REPATH
echo Restore Quarantined File...
case $REP in
    "") 
        echo "You didn't enter anything."
        echo "Skip..."
        ;;
    *)
        mv $HOME/.ClamAV/Quarantine/$REP $REPATH
        ;;       
esac
exec sh $PWD/quarantine.sh
;;
*)
echo Retun to main menu.
exec sh $PWD/main.sh
;;
esac
