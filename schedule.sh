#!/bin/bash
echo "-----"
echo 0: Reutn
echo 1: Create Scan Script
echo 2: View Scan Scripts
echo 3: Generate Cron Schedule
echo 4: Clear Scan Scripts
echo 5: Remove Specific Scan Script
echo 6: Set Automatic Scheduler
echo 7: View Automatic Scheduler
echo
echo ↓Excute command↓
read CVAR
echo
case $CVAR in
[1])
exec sh $PWD/genscripts.sh
;;
[2])
echo "-----"
echo
ls -a $PWD/Schedule
echo "-----"
echo
echo ↓Enter the script you want to read.↓
read scriptview
echo
echo "-----"
echo "Script name:"$scriptview
echo
cat $PWD/Schedule/$scriptview 2>/dev/null
echo
exec sh $PWD/schedule.sh
;;
[3])
echo "-----"
echo
ls -a $PWD/Schedule
echo
echo "-----"
echo ↓Enter the script to automate↓
read ASC
echo "↓Hour(0~23)↓"
read SCANH
echo "↓Minutes(0~59)↓"
read SCANM
echo "-----"
echo
echo "Run crontab -e and put the following:"
echo
echo "-----"
echo $SCANM $SCANH '*' '*' '*' 'sh' $PWD/Schedule/$ASC
echo "-----"
echo
echo "↓Running crontab -e now?(Yes/No)↓"
read CTAB
case $CTAB in
    [yY][eE][sS]|[yY]) 
        crontab -e
        exec sh $PWD/schedule.sh
        ;;
    *)
        exec sh $PWD/schedule.sh
        ;;
esac
;;
[4])
echo Clear scripts...
rm $PWD/Schedule/*.sh
exec sh $PWD/schedule.sh
;;
[5])
echo "-----"
echo
ls -a $PWD/Schedule
echo "-----"
echo ↓Enter the script you want to remove.↓
read TERMI
echo Remove Script...
case $TERMI in
    "") 
        echo "You didn't enter anything."
        echo "Skip..."
        ;;
    *)
        rm $PWD/Schedule/$TERMI
        ;;       
esac
exec sh $PWD/schedule.sh
;;
[6])
echo "-----"
echo
ls -a $PWD/Schedule
echo
echo "-----"
echo "↓Script to run in this hour:00↓"
read SR0
case $SR0 in
    "") 
        SRR0=""
        ;;
    *)
        SRR0='exec sh '$PWD'/Schedule/'$SR0
        ;;       
esac
echo "-----" 
echo "↓Script to run in this hour:01↓"
read SR1
case $SR1 in
    "") 
        SRR1=""
        ;;
    *)
        SRR1='exec sh '$PWD'/Schedule/'$SR1
        ;;       
esac
echo "-----" 
echo "↓Script to run in this hour:02↓"
read SR2
case $SR2 in
    "") 
        SRR2=""
        ;;
    *)
        SRR2='exec sh '$PWD'/Schedule/'$SR2
        ;;       
esac
echo "-----" 
echo "↓Script to run in this hour:03↓"
read SR3
case $SR3 in
    "") 
        SRR3=""
        ;;
    *)
        SRR3='exec sh '$PWD'/Schedule/'$SR3
        ;;       
esac
echo "-----" 
echo "↓Script to run in this hour:04↓"
read SR4
case $SR4 in
    "") 
        SRR4=""
        ;;
    *)
        SRR4='exec sh '$PWD'/Schedule/'$SR4
        ;;       
esac
echo "-----" 
echo "↓Script to run in this hour:05↓"
read SR5
case $SR5 in
    "") 
        SRR5=""
        ;;
    *)
        SRR5='exec sh '$PWD'/Schedule/'$SR5
        ;;       
esac
echo "-----" 
echo "↓Script to run in this hour:06↓"
read SR6
case $SR6 in
    "") 
        SRR6=""
        ;;
    *)
        SRR6='exec sh '$PWD'/Schedule/'$SR6
        ;;       
esac
echo "-----" 
echo "↓Script to run in this hour:07↓"
read SR7
case $SR7 in
    "") 
        SRR7=""
        ;;
    *)
        SRR7='exec sh '$PWD'/Schedule/'$SR7
        ;;       
esac
echo "-----" 
echo "↓Script to run in this hour:08↓"
read SR8
case $SR8 in
    "") 
        SRR8=""
        ;;
    *)
        SRR8='exec sh '$PWD'/Schedule/'$SR8
        ;;       
esac
echo "-----" 
echo "↓Script to run in this hour:09↓"
read SR9
case $SR9 in
    "") 
        SRR9=""
        ;;
    *)
        SRR9='exec sh '$PWD'/Schedule/'$SR9
        ;;       
esac
echo "-----" 
echo "↓Script to run in this hour:10↓"
read SR10
case $SR10 in
    "") 
        SRR10=""
        ;;
    *)
        SRR1='exec sh '$PWD'/Schedule/'$SR10
        ;;       
esac
echo "-----" 
echo "↓Script to run in this hour:11↓"
read SR11
case $SR11 in
    "") 
        SRR11=""
        ;;
    *)
        SRR11='exec sh '$PWD'/Schedule/'$SR11
        ;;       
esac
echo "-----" 
echo "↓Script to run in this hour:12↓"
read SR12
case $SR12 in
    "") 
        SRR12=""
        ;;
    *)
        SRR12='exec sh '$PWD'/Schedule/'$SR12
        ;;       
esac
echo "-----" 
echo "↓Script to run in this hour:13↓"
read SR13
case $SR13 in
    "") 
        SRR13=""
        ;;
    *)
        SRR13='exec sh '$PWD'/Schedule/'$SR13
        ;;       
esac
echo "-----" 
echo "↓Script to run in this hour:14↓"
read SR14
case $SR14 in
    "") 
        SRR14=""
        ;;
    *)
        SRR14='exec sh '$PWD'/Schedule/'$SR14
        ;;       
esac
echo "-----" 
echo "↓Script to run in this hour:15↓"
read SR15
case $SR15 in
    "") 
        SRR15=""
        ;;
    *)
        SRR15='exec sh '$PWD'/Schedule/'$SR15
        ;;       
esac
echo "-----" 
echo "↓Script to run in this hour:16↓"
read SR16
case $SR16 in
    "") 
        SRR16=""
        ;;
    *)
        SRR16='exec sh '$PWD'/Schedule/'$SR16
        ;;       
esac
echo "-----" 
echo "↓Script to run in this hour:17↓"
read SR17
case $SR17 in
    "") 
        SRR17=""
        ;;
    *)
        SRR17='exec sh '$PWD'/Schedule/'$SR17
        ;;       
esac
echo "-----" 
echo "↓Script to run in this hour:18↓"
read SR18
case $SR18 in
    "") 
        SRR18=""
        ;;
    *)
        SRR18='exec sh '$PWD'/Schedule/'$SR18
        ;;       
esac
echo "-----" 
echo "↓Script to run in this hour:19↓"
read SR19
case $SR19 in
    "") 
        SRR19=""
        ;;
    *)
        SRR19='exec sh '$PWD'/Schedule/'$SR19
        ;;       
esac
echo "-----" 
echo "↓Script to run in this hour:20↓"
read SR20
case $SR20 in
    "") 
        SRR20=""
        ;;
    *)
        SRR20='exec sh '$PWD'/Schedule/'$SR20
        ;;       
esac
echo "-----" 
echo "↓Script to run in this hour:21↓"
read SR21
case $SR21 in
    "") 
        SRR21=""
        ;;
    *)
        SRR21='exec sh '$PWD'/Schedule/'$SR21
        ;;       
esac
echo "-----" 
echo "↓Script to run in this hour:22↓"
read SR22
case $SR22 in
    "") 
        SRR22=""
        ;;
    *)
        SRR22='exec sh '$PWD'/Schedule/'$SR22
        ;;       
esac
echo "-----" 
echo "↓Script to run in this hour:23↓"
read SR23
case $SR23 in
    "") 
        SRR23=""
        ;;
    *)
        SRR23='exec sh '$PWD'/Schedule/'$SR23
        ;;       
esac
echo "-----" 
DATEP='$(date +%H)'
cat << EOT > $PWD/timebot.sh
#!/bin/bash
case $DATEP in
    00) 
    $SRR0
    ;;
    01) 
    $SRR1
    ;;
    02) 
    $SRR2
    ;;
    03) 
    $SRR3
    ;;
    04) 
    $SRR4
    ;;
    05) 
    $SRR5
    ;;
    06) 
    $SRR6
    ;;
    07) 
    $SRR7
    ;;
    08) 
    $SRR8
    ;;
    09) 
    $SRR9
    ;;
    10) 
    $SRR10
    ;;
    11) 
    $SRR11
    ;;
    12) 
    $SRR12
    ;;
    13) 
    $SRR13
    ;;
    14) 
    $SRR14
    ;;
    15) 
    $SRR15
    ;;
    16) 
    $SRR16
    ;;
    17) 
    $SRR17
    ;;
    18) 
    $SRR18
    ;;
    19) 
    $SRR19
    ;;
    20) 
    $SRR20
    ;;
    21) 
    $SRR21
    ;;
    22) 
    $SRR22
    ;;
    23) 
    $SRR23
    ;;
esac
EOT
chmod +x $PWD/timebot.sh
echo "-----"
echo
echo "Run crontab -e and put the following:"
echo
echo "-----"
echo '0' '*' '*' '*' '*' 'sh' $PWD/timebot.sh
echo "-----"
echo
echo "↓Running crontab -e now?(Yes/No)↓"
read CTAB
case $CTAB in
    [yY][eE][sS]|[yY]) 
        crontab -e
        exec sh $PWD/schedule.sh
        ;;
    *)
        exec sh $PWD/schedule.sh
        ;;
esac
;;
[7])
echo "-----"
cat $PWD/timebot.sh
exec sh $PWD/schedule.sh
;;
*)
echo Retun to main menu.
exec sh $PWD/main.sh
;;
esac
