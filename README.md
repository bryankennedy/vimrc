# Instalation
1. Clone this repo wherever you'd like to keep your vimrc files. I keep mine in a folder called `~/.dotfiles` along with a bunch of other stuff.

        git clone git://github.com/bryankennedy/vimrc.git ~/.dotfiles/vimrc

1. Change directories to the `vimrc` folder.

        cd ~/.dotfiles/vimrc

1. Run the install script, telling it where you have install the vimrc folder

        ./install.sh ~/.dotfiles/vimrc

# Usage
To add new plugins, download the package, and copy its folder to the vimrc/vim/bundle directory. Pathogen will handle the rest.

# Shortcuts
A curated list of leaders and other custom shortcuts provided as part of my custom vimrc and by the enabled plugins.

## Leader...
* \c - Toggle ignorecase
* \c<space> - Comment out the current line or text selected in visual mode.
* \cd - Change to the directory of the current file
* \cm - Comment out the selection using only one surrounding comment tag
* \e - Edit this vimrc
* \g - Load taglist
* \n - Load NERDTree
* \p - Select the pasted text
* \q - Close all saved buffers
* \s - Toggle spell checking
* \t - Command-T file searcher
* \w - Write
* \y - Browse YankRing
* \z - Start a find/replace with the selected 'text'
* \\\] - Jump to the next QuickFix error
* \\\[ - Jump to the previous QuickFix error
* \\\<cr> - Clear search highlight
* \\\w - jump to a word with easymotion
* \\\t - jump to a character with easymotion

## Commonly forgotten shortcuts
* csw" - Put " around a word
* cs"' - Change those " to '
* ds' - Remove those '
* VS# - Wrap a visual selection in #
