#!/bin/bash

source='/var/www'
archive='var-www.bak.tar'

if [ $(id -u) -eq 0 ]; then

  tar --create --verbose --file $archive $source

else

  echo "This script must be run with root privileges. Exiting."

fi

