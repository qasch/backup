#!/bin/bash

source='/var/www/html'
archive='var-www.bak.tar'

if [ $(id -u) -eq 0 ]; then

  # create tar archive
  tar --create --verbose --file $archive $source

  # compress archive
  xz --compress --verbose $archive

else

  echo "This script must be run with root privileges. Exiting."

fi

