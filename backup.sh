#!/bin/bash

# Simple backup script to backup content of 
# /var/www/ folder to remote server
#
# TODO: Add date to archive name done
# TODO: Add logging
# TODO: Add encryption --
# TODO: Add sending archive to remote
# TODO: Delete local archive afterwards
# TODO: Make script executed every hour


source='/var/www/html'
today=`date +%d-%m-%y`
archive=$today'var-www.bak.tar'

echo `date` 'script started' >> log.txt


if [ $(id -u) -eq 0 ]; then

  # create tar archive and compress it if successful

  echo `date` 'Creating Archive and comrpressing it' >> log.txt
  tar --create --verbose --file $archive $source && \
  xz --compress --verbose $archive && \
  gpg --symmetric --batch --passphrase 1234 $archive.xz && \
  rm $archive.xz 

  if [ $? -ne 0 ]; then
    echo "Something went wrong creating compressed archive. Exiting."

    exit 1 
  fi

  echo `date` 'Script ended' >> log.txt
  echo ' ' >> log.txt

else

  echo "This script must be run with root privileges. Exiting."

    exit 1 

fi

