#!/usr/bin/env vimrc
############################################################
# install.sh
# Install script for vimrc
#
# Replaces your home directory .vimrc
#
# Designed to be run after you create a conf file from 
# conf.sample.
############################################################

############################################################
# Check to see if you created the conf file to start with
############################################################
BACKUPDIR=$BASH_SOURCE/backups


date_string=$(date '+%Y_%m_%d_%H_%S')

# Clean out home dir
vimrc_files=( .vimrc vimrc )
for vimrc_file in ${vimrc_files[@]}
do
  mv ~/$vimrc_file ~/${vimrc_file}_backup_${date_string}
done
cp ./template/home_vimrc.template ~/.vimrc
sed 's/moon/sun/g' ~/.vimrc > ~/.vimrc
