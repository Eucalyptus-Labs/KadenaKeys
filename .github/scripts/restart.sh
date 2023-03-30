#!/bin/bash

# This script is used to re-deploy the KadenaKeys application

# There are two copies of this script:
# 1. in /var/www/KadenaKeys of the web servers
#   - this script is run to restart the application
# 2. in KadenaKeys/.github/scripts
#   - this copy is a reference
# Changes to either may need to be applied to the other

# call: restart.sh <environment> <branch_name> 
# /var/www/KadenaKeys$ ./restart.sh develop master

pwd

#checkout target branch
cd $1
ts=`date +"%Y%m%d%H%M%S"`
git clone git@github.com:Eucalyptus-Labs/KadenaKeys.git $ts

# install deps and build
cd $ts
nvm use 14
npm install
npx webpack
flutter build web

# re-link current
cd ..
ln -vsfn $ts /var/www/KadenaKeys/master/current

# reload site
service_name=$1.kadenakeys.io
if [ $1 == 'production' ]; then service_name=kadenakeys.io; fi
pm2 reload $service_name

# delete oldest directory
dirs=(*/)
if [ ${#dirs[@]} -ge 6 ]; then rm -rf ${dirs[0]}; fi
