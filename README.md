# Installation
1. Clone this repo wherever you'd like to keep your vimrc files. I keep mine in a folder called `~/.dotfiles` along with a bunch of other stuff.

        git clone git://github.com/bryankennedy/vimrc.git ~/.dotfiles/vimrc

1. Change directories to the `vimrc` folder.

        cd ~/.dotfiles/vimrc

1. Run the install script, telling it where you have install the vimrc folder

        ./install.sh ~/.dotfiles/vimrc

# Plugins
These are the plugins I am currently using, with some justification and some quick tips on how I most commonly use them. This list isn't entirely complete.

## Language syntax plugins
* [css-color](https://github.com/ap/vim-css-color/) - Colorize hex colors and color words in CSS
* [javascript](https://github.com/pangloss/vim-javascript/) - Best JS syntax plugin
* [json](https://github.com/elzr/vim-json) - JSON highlighting with keyword/value color differences
* [markdown](https://github.com/tpope/vim-markdown/) - Force .md files to open as Markdown
* [php](https://github.com/StanAngeloff/php.vim) - Enhanced PHP syntax
* [processing](https://github.com/sophacles/vim-processing/) - Enhanced Processing syntax
* [puppet](https://github.com/rodjek/vim-puppet/) - I use this to managing Boxen manifests, written in Puppet
* [spacebars](https://github.com/Slava/vim-spacebars/) - Syntax for MeteorJS' handlebars template variant
* [tcl](https://github.com/vim-scripts/tcl.vim--smithfield/) - Tcl syntax for expect scripting

## Functional plugins

##### [command-p](https://github.com/kien/ctrlp.vim)  - Quick and intuitive tool to open files quickly.

* `<leader>t` - Search files from cwd
* `<leader>b` - Search files from current buffers

Once you have a file highlighted, use CTRL + v to open it in a vertical split, and use CTRL + s to open it in a horizontal split.

#####[delimitMate](https://github.com/Raimondi/delimitMate) - Quote and bracket auto-completion. Best plugin. Doesn't break undo/redo.

##### [easymotion](https://github.com/Lokaltog/vim-easymotion/) - Magically jump around the page

* `<leader\>\<leader\>w` - Jump to a specific word
* `<leader\>\<leader\>t` - Jump to a specific character

##### [expand-region](http://github.com/terryma/vim-expand-region) - Expand selection regions smartly.

* vvv - replaces a bunch of vit, viw, vi', vi" operations.

##### [fugitive](https://github.com/tpope/vim-fugitive/) - Git wrapper. I don't use this enough.

* `:Gblame` - Who did what?
* `:Gcommit` - Commit your changes
* `:Gdiff` - See what's different from the git index

##### [indent-guides](https://github.com/nathanaelkane/vim-indent-guides/) - Visually highlight indentation levels

Disabled by default. Enable with `:IndentGuidesEnable`

##### [nerdcommenter](https://github.com/scrooloose/nerdcommenter/) - Commenting helper.

* `<leader>c<space>` -  Comment out the current line or text selected in visual mode.
* `<leader>cm` - Comment out the selection using only one surrounding comment tag

##### [nerdtree](https://github.com/scrooloose/nerdtree/) - File tree explorer in a sidebar.

* `<leader>n` - Load NERDTree

##### [powerline](https://github.com/Lokaltog/vim-powerline) - Powerful status line at the footer of the Vim window
##### [signature](https://github.com/kshenoy/vim-signature) - Show marks in the Vim gutter

* `:ma {a-z}` - Set a mark
* `'{a-z}` - Jump to a mark

##### [snipmate](https://github.com/garbas/vim-snipmate) - Write snippets of code quicker

* e.g. - in insert mode type `for` and then tab to create a for block

##### [snippets](https://github.com/honza/vim-snippets.git) - Some useful snippets of code for snipmate

* There are [many snippets for all kinds of languages](https://github.com/honza/vim-snippets/tree/master/snippets)

##### [surround](https://github.com/tpope/vim-surround/) - Tim Pope's essential plugin for surrounding things with things
##### [syntastic](https://github.com/scrooloose/syntastic/) - Syntax checking.
##### [tagbar](https://github.com/majutsushi/tagbar) - Display tags in a sidebar. Improvement on taglist.

* `<leader>g` - Open the tag sidebar

##### [yankring](https://github.com/vim-scripts/YankRing.vim) - Browse the paste buffer

* `<leader>y` - Open a sidebar, showing the paste buffer

### Disabled

##### [gitgutter](https://github.com/airblade/vim-gitgutter/) - Highlight Git changes in the Vim gutter
I'd love to be able to use this again, but it causes some very slow load times, so I've removed it.



## Helpers and required libraries
These plugins are required by various plugins listed above.
* [L9](http://www.vim.org/scripts/script.php?script_id=3252) - Required by autocomplpop
* [tlib_vim](https://github.com/tomtom/tlib_vim.git) - Required by vim-snipmate
* [vim-addon-mw-utils](https://github.com/MarcWeber/vim-addon-mw-utils.git) - Required by vim-snipmate

# Shortcuts
A curated list of leaders and other custom shortcuts provided as part of my custom vimrc and by the enabled plugins.

## Leader...
* `<leader>c` - Toggle ignorecase
* `<leader>cd` - Change to the directory of the current file
* `<leader>e` - Edit this vimrc
* `<leader>s` - Toggle spell checking
* `<leader>w` - Write
* `<leader>z` - Start a find/replace with the selected 'text'
* `<leader><leader>]` - Jump to the next QuickFix error
* `<leader><leader>\[` - Jump to the previous QuickFix error
* `<leader><cr>` - Clear search highlight

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
* ]s - Next misspelled word

## Snippets

### Javascript
cn > CTRL + j = console('')
con > CTRL + j = console('var', var)
