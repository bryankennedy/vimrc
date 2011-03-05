#!/usr/bin/env bash
############################################################
# install.sh
# Install script for vimrc
#
# Replaces your home directory vim configurations
############################################################

# Default install location
INSTALL_DIR="~/vimrc"

# Check to see if the install dir exists and is our vimrc
if [ ! -e ${INSTALL_DIR}/README.md ]; then
  # Your vimrc isn't in the standard location and you haven't
  # specified a custom location. Provide instructions.
  if [ ! $1 ]; then
    echo "The deafult location for this vimrc system is at ~/vimrc"
    echo "Either move this vimrc folder to your home directory or specify a custom location:"
    echo "Custom location example:"
    echo "./install.sh ~/.dotfiles/vimrc"
    echo "Do not use a trailing slash for locations"
    echo "Quiting"
    exit
  else
    # You've specified a custom location but it doesn't exist
    if [ ! -e $1/README.md ]; then
      echo "There is a problem with your custom install location $1" 
      echo "Custom location example:"
      echo "./install.sh ~/.dotfiles/vimrc"
      echo "Do not use a trailing slash for locations"
      echo "Quiting"
      exit
    fi
    # You've specified a custom location correctly
    INSTALL_DIR=$1
    echo $INSTALL_DIR
  fi
fi

date_string=$(date '+%Y_%m_%d_%H_%S')

############################################################
# Ask for Y/n input with a default option
#
# Returns the user's choice
############################################################
function choice {
  CHOICE=' '
  local prompt="$1"
  local default="$2"
  local answer

  #Ask the question
  read -p "$prompt" answer

  # Interpret no answer as the default answer
  [ -z $answer ] && answer="$default"

  # Check the answer. Case insensitve.
  # Dump non-conforming answers to a variable for error messages.
  case "$answer" in
    [yY1] ) CHOICE='y';;
    [nN0] ) CHOICE='n';;
    *     ) CHOICE="$answer";;
  esac
}

############################################################
# Instructions
############################################################
echo "This script will replace your home directory vim files:"
echo "(.vim .vimrc vimrc)"
echo "with symlinks to this vimrc system."
echo "This script will make backups of your existing files in your home directory."

# If NO, or error
choice "Do you wish to continue [Y/n]: " "y"
if [ "$CHOICE" != "y" ]; then
  if [ "$CHOICE" = "n" ]; then
    echo "Quitting. Your files are unafected"
    exit
  fi
  echo "I didn't understand, $CHOICE. Quiting."
  exit
fi

# Clean out home dir
vimrc_files=( .vim .vimrc vimrc )
for vimrc_file in ${vimrc_files[@]}
do
  vimrc_file=~/${vimrc_file}
  if [ -f $vimrc_file ] || [ -d $vimrc_file ]; then
    mv $vimrc_file ${vimrc_file}_backup_${date_string}
  fi
done

# Create symlinks to the vimrc and vim config dir
ln -s $INSTALL_DIR/vimrc ~/.vimrc
ln -s $INSTALL_DIR/vim ~/.vim

echo "Installed"
