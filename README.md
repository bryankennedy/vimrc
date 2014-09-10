# Instalation
1. Clone this repo wherever you'd like to keep your vimrc files. I keep mine in a folder called `~/.dotfiles` along with a bunch of other stuff.

        git clone git://github.com/bryankennedy/vimrc.git ~/.dotfiles/vimrc

1. Change directories to the `vimrc` folder.

        cd ~/.dotfiles/vimrc

1. Run the install script, telling it where you have install the vimrc folder

        ./install.sh ~/.dotfiles/vimrc

# Usage
To add new plugins, download the package, and copy its folder to the vimrc/vim/bundle directory. Pathogen will handle the rest.

# Plugins
Plugins I use. What I use them for.

## Language syntax plugins
* [vim-css3-syntax](https://github.com/hail2u/vim-css3-syntax) - After looking at several alternatives, I think this is the best CSS plugin
* [vim-css-color](https://github.com/ap/vim-css-color/) - Colorize hex colors and color words in CSS
* [vim-html5](https://github.com/othree/html5.vim/) - Best HTML5 syntax plugin
* [vim-javascript](https://github.com/pangloss/vim-javascript/) - Best JS syntax plugin
* [vim-json](https://github.com/elzr/vim-json) - JSON highlighting with keyword/value color differences
* [vim-markdown](https://github.com/plasticboy/vim-markdown/) - Enhanced Markdown syntax
* [vim-php](https://github.com/StanAngeloff/php.vim) - Enhanced PHP syntax
* [vim-processing](https://github.com/sophacles/vim-processing/) - Enhanced Processing syntax
* [vim-puppet](https://github.com/rodjek/vim-puppet/) - I use this to managing Boxen manifests, written in Puppet
* [vim-spacebars](https://github.com/Slava/vim-spacebars/) - Syntax for MeteorJS' handlebars template variant
* [vim-tcl](https://github.com/vim-scripts/tcl.vim--smithfield/) - Tcl syntax for expect scripting

## Functional plugins

* [vim-autocomplpop](http://www.vim.org/scripts/script.php?script_id=1879) - Popup window for selecting autocomplete options.
* [vim-easymotion](https://github.com/Lokaltog/vim-easymotion/) - Magically jump around the page
* [vim-fugitive](https://github.com/tpope/vim-fugitive/) - Git wrapper. I don't use this enough.
* [vim-gitgutter](https://github.com/airblade/vim-gitgutter/) - Highlight Git changes in the Vim gutter
* [vim-indent-guides](https://github.com/nathanaelkane/vim-indent-guides/) - Visually highlight indentation levels
* [vim-powerline](https://github.com/Lokaltog/vim-powerline) - Powerful status line at the footer of the Vim window
* [vim-signature](https://github.com/kshenoy/vim-signature) - Show marks in the Vim gutter
* [vim-snipmate](https://github.com/garbas/vim-snipmate) - Write snippets of code quicker
* [vim-snippets](https://github.com/honza/vim-snippets.git) - Some useful snippets of code for snipmate
* [vim-surround](https://github.com/tpope/vim-surround/) - Tim Pope's essential plugin for surrounding things with things
* [tagbar](https://github.com/majutsushi/tagbar) - Display tags in a sidebar. Improvement on taglist.

## Helpers and required libraries
These plugins are required by various plugins listed above.
### Required by vim-autocomplpop
* [L9](http://www.vim.org/scripts/script.php?script_id=3252)

### Required by vim-snipmate
* [tlib_vim](https://github.com/tomtom/tlib_vim.git)
* [vim-addon-mw-utils](https://github.com/MarcWeber/vim-addon-mw-utils.git)

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
* za - Toggle a fold open/closed
* zi - Turn folding on and off
* ZM - Close all folds
* zMzv - Close all folds, open the current line fold
* zR - Open all folds
