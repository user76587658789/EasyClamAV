#!/bin/bash
echo "-----"
echo 0: Reutn
echo 1: Update Signatures
echo 2: Generate Cron Schedule
echo 3: Create Script for Automatic Scheduler
echo 4: Create Local Update Config 
echo 5: Copy System Update Config - Need SU Permission
echo 6: Edit Local Update Config with Nano
echo
echo ↓Excute command↓
read CVAR
echo
case $CVAR in
[1])
freshclam --user=$(whoami) --datadir=$PWD/Sig --config-file=$PWD/localupdate.conf
exec sh $PWD/updater.sh
;;
[2])
echo "↓Hour(0~23)↓"
read SCANH
echo "↓Minutes(0~59)↓"
read SCANM
echo "-----"
echo
echo "Run crontab -e and put the following:"
echo
echo "-----"
echo $SCANM $SCANH '*' '*' '*' "freshclam --user=$(whoami) --datadir=$PWD/Sig --config-file=$PWD/localupdate.conf"
echo "-----"
echo
echo "↓Running crontab -e now?(Yes/No)↓"
read CTAB
case $CTAB in
    [yY][eE][sS]|[yY]) 
        crontab -e
        exec sh $PWD/updater.sh
        ;;
    *)
        exec sh $PWD/updater.sh
        ;;
esac
;;
[3])
cat << EOT > $PWD/Schedule/sigupdater.sh
#!/bin/bash
freshclam --user=$(whoami) --datadir=$PWD/Sig --config-file=$PWD/localupdate.conf
EOT
chmod +x $PWD/Schedule/sigupdater.sh
echo "$PWD/Schedule/sigupdater.sh Created."
exec sh $PWD/updater.sh
;;
[4])
cat << EOT > $PWD/localupdate.conf
DatabaseMirror database.clamav.net
EOT
echo "$PWD/localupdate.conf Created."
exec sh $PWD/updater.sh
;;
[5])
sudo cp -f /etc/freshclam.conf $PWD/localupdate.conf
sudo chmod a+rw $PWD/localupdate.conf
echo 'Done.'
exec sh $PWD/updater.sh
;;
[6])
nano $PWD/localupdate.conf
exec sh $PWD/updater.sh
;;
*)
echo Retun to main menu.
exec sh $PWD/main.sh
;;
esac
