#!/bin/bash
echo "-----"
echo 0: Reutn
echo 1: Enable Auto Update
echo 2: Disable Auto Update
echo 3: Update Signatures
echo
echo ↓Excute command↓
read CVAR
echo
case $CVAR in
[1])
sudo systemctl stop clamav-freshclam
sudo freshclam
sudo systemctl start clamav-freshclam
sudo systemctl enable clamav-freshclam
echo 'Done.'
exec sh $PWD/updater-advanced.sh
;;
[2])
sudo systemctl stop clamav-freshclam
sudo systemctl disable clamav-freshclam
echo 'Done.'
exec sh $PWD/updater-advanced.sh
;;
[3])
sudo freshclam
exec sh $PWD/updater-advanced.sh
;;
*)
echo Retun to main menu.
exec sh $PWD/main.sh
;;
esac
