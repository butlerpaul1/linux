#!/bin/bash

ROOT="/home/network"
ROOT_EXCLUDE="--exclude=/dev --exclude=/proc --exclude=/sys --exclude=/temp --exclude=/run --exlucde=/mnt --exlcude=/media --exclude=/lost+found --exlude=/backup2.tgz"
DESTIN="/home/network/Backup/"
CREATE="/dev /proc /sys /temp /run /mnt /media /lost+found "

day=`date +%d`
month=`date +%B`
year=`date +%Y`

prefix="PaulsBackup"

archivefile=$prefix.$day.$month.$year.tgz

Backup=$archivefile


clear
echo "Menu"

OPTIONS="Backup Restore Destination Exit"
LIST="1)Backup System 2)Restore System 3)Change Destination 4)Exit"

select opt in $OPTIONS; do
if [ "$opt" = "Exit" ]; then
    echo "finished"
    exit

elif [ "$opt" = "Backup" ]; then
    echo "Backing up files,"
    sleep 2


tar cvpfz $DESTIN/$archivefile $ROOT $ROOT_EXCLUDE_DIRS
    echo "Backup finsihed"
    sleep 2
    exit

elif [ "$opt" = "Restore" ]; then
 echo "RESTOTING FILES..."
    sleep 2
    echo $archivefile
    tar xvpfz $DESTIN/$archivefile -C /
    sleep 2
    if [[ -e "/proc" ]]; then
            echo "$CREATE already exists! "
    else
            mkdir $CREATE
            echo "$CREATE are created! "
    fi
    echo "RESTORE COMPLETE..."
    exit

#change dest
elif [ "$opt" = "Destination" ]; then
    echo "destination is:$DESTIN "
    echo "Type new destination"
    echo "Press enter to leave it the same"
    read NEW_DESTIN

    #IF GREATER THEN 0 ASSIGN NEW DESTINATION
    if [ ${#NEW_DESTIN} -gt 0 ]; then
       
      
       createDir=$ROOT/$NEW_DESTIN
       echo "$createDir"
       mkdir $createDir
       echo "Dir Created"
       DESTIN= '$createDir'
    fi

else
    clear
    echo "BAD INPUT!"
    echo "ENTER 1 , 2, 3 or 4.."
    echo $LIST


fi
done
