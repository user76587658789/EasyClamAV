#!/bin/bash
echo "-----"
echo 0: Reutn
echo 1: Fedora Workstation - Need SU Permission
echo 2: Fedora Silverblue - Need Reboot
echo 3: Debian - Need SU Permission
echo
echo ↓Excute command↓
read CVAR
echo
case $CVAR in
[1])
echo Install ClamAV...
sudo dnf install clamav clamav-update
echo Install Cron...
sudo dnf install cronie
exec sh $PWD/main.sh
;;
[2])
echo Install ClamAV...
rpm-ostree install clamav clamav-update cronie
exec sh $PWD/main.sh
;;
[3])
echo Install ClamAV...
sudo apt-get install clamav
echo Install Cron...
sudo apt-get install cron
exec sh $PWD/main.sh
;;
*)
echo Retun to main menu.
exec sh $PWD/main.sh
;;
esac
