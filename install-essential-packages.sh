#!/bin/bash
echo "-----"
echo Install ClamAV...
sudo dnf install clamav clamav-update
echo Install Cron...
sudo dnf install cronie
exec sh $PWD/main.sh
