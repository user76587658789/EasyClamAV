#!/bin/bash
echo "-----"
echo "↓New Scan name, No blanks.↓"
read SNAME
case "$SNAME" in
    "")
    exec sh $PWD/schedule.sh
    ;;
    .)
    exec sh $PWD/schedule.sh
    ;;
    '.'*)
    exec sh $PWD/schedule.sh
    ;;
esac
echo "↓Choose Preset number.(1~9)↓"
read PRENUM
case "$PRENUM" in
    [1-9])    
    ;;
    *)
    PRENUM=1
    ;;
esac
SETP=$(cat $PWD/Presets/scanpreset$PRENUM)
DATEP='$(date +%Y-%m-%d-%H:%M:%S)'
SVARP='$SVAR'
DVARP='$DVAR'
TAILP='$(tail '$HOME'/.ClamAV/Logs/'$SNAME-$SVARP'|grep Infected|cut -d" " -f3)'
echo "↓Enter the path to scan.↓"
read SCANDIR
echo "↓Update local signatures before scanning?(Yes/*No)↓"
read SIGUP
case "$SIGUP" in
    [yY][eE][sS]|[yY]) 
        SIGB="freshclam --user=$(whoami) --datadir=$PWD/Sig --config-file=$PWD/localupdate.conf"
        ;;
    *)
        SIGB=""
        ;;
esac
echo "↓Turn on GUI notification?(*Yes/No)↓"
read NREAD
case "$NREAD" in
[yY][eE][sS]|[yY]) 
cat << EOT > $PWD/Schedule/$SNAME.sh
#!/bin/bash
$SIGB
notify-send $SNAME "ClamAV is scanning..." && SVAR=$DATEP;/usr/bin/clamscan -l $HOME/.ClamAV/Logs/$SNAME-$SVARP $SETP $SCANDIR 2>/dev/null;DVAR=$TAILP;notify-send "Done, Infected:"$DVARP
EOT
;;
*)
cat << EOT > $PWD/Schedule/$SNAME.sh
#!/bin/bash
$SIGB
/usr/bin/clamscan -l $HOME/.ClamAV/Logs/$SNAME-$DATEP $SETP $SCANDIR 2>/dev/null
EOT
;;
esac
chmod +x $PWD/Schedule/$SNAME.sh
echo "Scripts are created in the following : $PWD/Schedule/$SNAME.sh"
exec sh $PWD/schedule.sh
