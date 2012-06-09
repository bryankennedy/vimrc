# Instalation
1. Clone this repo wherever you'd like to keep your vimrc files. I keep mine in a folder called `~/.dotfiles` along with a bunch of other stuff.

        git clone git://github.com/bryankennedy/vimrc.git ~/.dotfiles/vimrc

1. Change directories to the `vimrc` folder.

        cd ~/.dotfiles/vimrc

1. Run the install script, telling it where you have install the vimrc folder

        ./install.sh ~/.dotfiles/vimrc

# Usage
To add new plugins, download the package, and copy its folder to the vimrc/vim/bundle directory. Pathogen will handle the rest.
