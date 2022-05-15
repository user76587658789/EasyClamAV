#!/bin/bash
echo "-----"
echo "↓Choose Preset number.(1~9)↓"
read PRENUM
case "$PRENUM" in
    [1-9])    
    ;;
    *)
    exec sh $PWD/scanconf.sh
    ;;
esac
echo "↓Use local signatures?(*Yes/No)↓"
read SIGREAD
case "$SIGREAD" in
    [yY][eE][sS]|[yY]) 
        SIG="--database=$PWD/Sig"
        ;;
    *)
        SIG=""
        ;;
esac
echo "↓Scan all directory?(*Yes/No)↓"
read RUREAD
case "$RUREAD" in
    [yY][eE][sS]|[yY]) 
        RU="--recursive"
        ;;
    *)
        RU=""
        ;;
esac
echo "↓Set limit of file size(MB, <4000, Recommended=25)↓"
read FSIZE
FSIZER=$FSIZE"M"
echo "↓Set limit of scan size(MB, <4000, Recommended=25)↓"
read SSIZE
SSIZER=$SSIZE"M"
echo "↓Show only infected files(*Yes/No)↓"
read IREAD
case "$IREAD" in
    [yY][eE][sS]|[yY]) 
        INFECT="--infected"
        ;;
    *)
        INFECT=""
        ;;
esac
echo "↓Quarantine infected files?(Yes/*No)↓"
read QREAD
case "$QREAD" in
    [yY][eE][sS]|[yY]) 
        QR="--move=$HOME/.ClamAV/Quarantine"
        ;;
    *)
        QR=""
        ;;
esac
echo "↓Check PUA?(*Yes/No)↓"
read PREAD
case "$PREAD" in
    [yY][eE][sS]|[yY]) 
        PUA="--detect-pua=yes"
        ;;
    *)
        PUA="--detect-pua=no"
        ;;
esac
echo "↓Recommended exclusion settings?(*Yes/No)↓"
read REREAD
case "$REREAD" in
    [yY][eE][sS]|[yY]) 
        REX="--exclude-dir=smb4k --exclude-dir=/run/user/$(whoami)/gvfs --exclude-dir=/home/$(whoami)/.gvfs --exclude-dir=$PWD --exclude-dir=/home/$(whoami)/.ClamAV --exclude-dir=.thunderbird --exclude-dir=.mozilla-thunderbird --exclude-dir=.evolution --exclude-dir=Mail --exclude-dir=kmail"
        ;;
    *)
        REX=""
        ;;
esac
echo "↓Exclude specific folder(Yes/*No)↓"
read EXREAD
case "$EXREAD" in
    [yY][eE][sS]|[yY])  
        echo "↓Enter the path to exclude.↓"
        read EX
        EXR="--exclude-dir=$EX"
        ;;
    *)
        EXR=""
        ;;
esac
echo "↓Add custom options?(Yes/*No)↓"
read OPREAD
case "$OPREAD" in
    [yY][eE][sS]|[yY])  
        echo
        echo "The options of clamscan can be found in the official documentation of ClamAV."
        echo 
        echo 'Tip : You can immediately delete infected files by putting "--remove=yes" here.'
        echo 'However, it is not recommended to prevent deletion of important files due to false positive.'
        echo
        echo "↓Enter custom options.↓"
        read OP
        ;;
    *)
        OP=""
        ;;
esac
echo "-----"
cat << EOT > $PWD/Presets/scanpreset$PRENUM
$SIG --max-filesize=$FSIZER --max-scansize=$SSIZER $INFECT $RU $QR $PUA $REX $EXR $OP
EOT
echo "Preset $PRENUM:"
echo
cat $PWD/Presets/scanpreset$PRENUM
echo
exec sh $PWD/scanconf.sh
