#!/bin/bash
echo "-----"
echo 0: Exit
echo 1: Configure Scan Presets
echo 2: Scan Home Folder 
echo 3: Custom Scan
echo 4: Scheduled Scan
echo 5: Log Viewer
echo 6: Quarantine
echo 7: Update Local Signatures - Recommended
echo 8: Update System Signatures - Need SU Permission
echo 9: Install Essential Packages - Need SU Permission - Fedora/RHEL only
echo
echo ↓Excute command↓
read CVAR
echo
case $CVAR in
[1])
exec sh $PWD/scanconf.sh
;;
[2])
exec sh $PWD/homescan.sh
;;
[3])
exec sh $PWD/customscan.sh
;;
[4])
exec sh $PWD/schedule.sh
;;
[5])
exec sh $PWD/logviewer.sh
;;
[6])
exec sh $PWD/quarantine.sh
;;
[7])
exec sh $PWD/updater.sh
;;
[8])
exec sh $PWD/updater-advanced.sh
;;
[9])
exec sh $PWD/install-essential-packages.sh
;;
*)
echo Bye.
exit
;;
esac

