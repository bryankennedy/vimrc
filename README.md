# Instalation
1. Clone this repo wherever you'd like to keep your vimrc files. I keep mine in a folder called `~/.dotfiles` along with a bunch of other stuff.

        git clone git://github.com/bryankennedy/vimrc.git ~/.dotfiles/vimrc

1. Change directories to the `vimrc` folder.

        cd ~/.dotfiles/vimrc

1. Run the install script, telling it where you have install the vimrc folder

        ./install.sh ~/.dotfiles/vimrc

# Plugins
I use [pathogen](https://github.com/tpope/vim-pathogen) to load plugins. I manage plugins as git submodules at `vim/bundle`. I've generally renamed plugin folders for consistency, removing `vim-` strings.

## Add a new plugin

    $ git submodule add http://example.com/vim-plugin.git vim/bundle/plugin

These are the plugins I am currently using, with some justification and some quick tips on how I most commonly use them.

## Language syntax plugins
* [css3-syntax](https://github.com/hail2u/vim-css3-syntax) - After looking at several alternatives, I think this is the best CSS plugin
* [css-color](https://github.com/ap/vim-css-color/) - Colorize hex colors and color words in CSS
* [html5](https://github.com/othree/html5.vim/) - Best HTML5 syntax plugin
* [javascript](https://github.com/pangloss/vim-javascript/) - Best JS syntax plugin
* [json](https://github.com/elzr/vim-json) - JSON highlighting with keyword/value color differences
* [markdown](https://github.com/plasticboy/vim-markdown/) - Enhanced Markdown syntax
* [php](https://github.com/StanAngeloff/php.vim) - Enhanced PHP syntax
* [processing](https://github.com/sophacles/vim-processing/) - Enhanced Processing syntax
* [puppet](https://github.com/rodjek/vim-puppet/) - I use this to managing Boxen manifests, written in Puppet
* [spacebars](https://github.com/Slava/vim-spacebars/) - Syntax for MeteorJS' handlebars template variant
* [tcl](https://github.com/vim-scripts/tcl.vim--smithfield/) - Tcl syntax for expect scripting

## Functional plugins

##### [ack](https://github.com/mileszs/ack.vim) - Ack searching in Vim

    :Ack [search term]

[Ack keyboard shortcuts](https://github.com/mileszs/ack.vim#keyboard-shortcuts)

##### [autocomplpop](http://www.vim.org/scripts/script.php?script_id=1879) - Popup window for selecting autocomplete options.

##### [command-t](https://github.com/wincent/command-t)  - Quick and intuitive tool to open files quickly.
<leader>t - Search files from cwd
<leader>b - Search files from current buffers

#####[delimitMate](https://github.com/Raimondi/delimitMate) - Quote and bracket auto-completion. Best plugin. Doesn't break undo/redo.

##### [easymotion](https://github.com/Lokaltog/vim-easymotion/) - Magically jump around the page
##### [fugitive](https://github.com/tpope/vim-fugitive/) - Git wrapper. I don't use this enough.
##### [gitgutter](https://github.com/airblade/vim-gitgutter/) - Highlight Git changes in the Vim gutter
##### [indent-guides](https://github.com/nathanaelkane/vim-indent-guides/) - Visually highlight indentation levels
##### [nerdcommenter](https://github.com/scrooloose/nerdcommenter/) - Commenting helper.
##### [nerdtree](https://github.com/scrooloose/nerdtree/) - File tree explorer in a sidebar.
##### [powerline](https://github.com/Lokaltog/vim-powerline) - Powerful status line at the footer of the Vim window
##### [signature](https://github.com/kshenoy/vim-signature) - Show marks in the Vim gutter
##### [snipmate](https://github.com/garbas/vim-snipmate) - Write snippets of code quicker
##### [snippets](https://github.com/honza/vim-snippets.git) - Some useful snippets of code for snipmate
##### [surround](https://github.com/tpope/vim-surround/) - Tim Pope's essential plugin for surrounding things with things
##### [syntastic](https://github.com/scrooloose/syntastic/) - Syntax checking.
##### [tagbar](https://github.com/majutsushi/tagbar) - Display tags in a sidebar. Improvement on taglist.
##### [yankstack](https://github.com/maxbrunsfeld/vim-yankstack) - Quickly cycle through paste buffer

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
