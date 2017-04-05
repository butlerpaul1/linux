#!/bin/bash


file=$1

month=`date +%B`
year=`date +%Y`

prefix="PaulsBackup"

archivefile=$prefix.$month.$year.tar

# Check for existence of a compressed archive matching the naming convention
if [ -e $archivefile.gz ]
then
   


 echo "Recieved '$file' "
    echo "Archive file $archivefile already exists..."
    echo "Adding file '$oldfile' to existing tar archive..."


    # Uncompress the archive, because you can't add a file to a
    # compressed archive
    gunzip $archivefile.gz

    # Add the file to the archive
    tar --append --file=$archivefile $file

    # compress the archive
    gzip $archivefile
       echo "Sucessful, path is "
    readlink -f $archivefile
   
# create a new archive and add the file
else
   


echo "Recieved '$file' "
    echo "Creating new archive file '$archivefile'..."
    tar --create --file=$archivefile $file
    gzip $archivefile

    echo "Sucessful, path is "
    readlink -f $archivefile
fi
