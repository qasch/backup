#!/bin/bash

# Simple backup script to backup content of 
# /var/www/ folder to remote server
#
# TODO: Add date to archive name
# TODO: Add logging
# TODO: Add encryption
# TODO: Add sending archive to remote
# TODO: Delete local archive afterwards
# TODO: Make script executed every hour


source='/var/www/html'
archive='var-www.bak.tar'

if [ $(id -u) -eq 0 ]; then

  # create tar archive and compress it if successful
  tar --create --verbose --file $archive $source && \
  xz --compress --verbose $archive

  if [ $? -ne 0 ]; then
    echo "Something went wrong creating compressed archive. Exiting."

    exit 1 
  fi

else

  echo "This script must be run with root privileges. Exiting."

    exit 1 

fi

