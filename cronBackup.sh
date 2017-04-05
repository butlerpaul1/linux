#!/bin/bash

ROOT="/home/network"
ROOT_EXCLUDE="--exclude=/dev --exclude=/lost+found --exclude=/proc --exclude=/sys --exclude=/temp --exclude=/run --exlucde=/mnt --exlcude=/media --exlude=/backup2.tgz"
DESTIN="/home/network/cronBackup"
CREATE="/dev /proc /sys /temp /run /mnt /media /lost+found"

min=`date +%M`
hour=`date +%H`
day=`date +%d`
month=`date +%B`
year=`date +%Y`

prefix="PaulsCronBackup"

archivefile=$prefix.$min.$hour.$day.$month.$year.tgz


    echo "BACKING UP FILES..."
    sleep 2
    tar cvpfz $DESTIN/$archivefile $ROOT $ROOT_EXCLUDE_DIRS
    echo "BACKUP COMPLETE"
    sleep 2
