""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Credits
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" bryan kennedy's vimrc file
"
" ideas taken from these sources
" http://amix.dk/blog/post/19486#The-ultimate-vim-configuration-vimrc
" http://vimcasts.org
" http://www.vi-improved.org/vimrc.php
" https://github.com/nvie/vimrc
" And lots of others...

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pathogen
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use pathogen to easily modify the runtime path to include all plugins under
" the ~/.vim/bundle directory
call pathogen#infect()
call pathogen#helptags()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vundle - Plugin configurations
"
" Vundle is a module / plugin manager. The Vundle config also
" contains some general setup steps for Vim.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Be iMproved, required by Vundle
set nocompatible
" Required by Vunlde, while we load modules. Renabled below.
filetype off 

" Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Functionality plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Ctrl-P
" Fast file navigation
" I'm using the same mappings that I used to use for Command -T
"
Plugin 'kien/ctrlp.vim'
let g:ctrlp_map = '<leader>t'
"let g:ctrlp_map = '<leader>b'
nmap <leader>b :CtrlPBuffer<cr>

" Make the ctrlp buffer a bit easier to read
"
" We use these functions to set the highlight temp. and then switch it back
" to our default color
let g:ctrlp_buffer_func = { 'enter': 'BrightHighlightOn', 'exit':  'BrightHighlightOff', }

function BrightHighlightOn()
  hi CursorLine guibg=darkred
endfunction

function BrightHighlightOff()
  hi CursorLine guibg=#191919
endfunction

"
" delimitMate
" Provides automatic closing of quotes, parenthesis, brackets, etc
"
Plugin 'Raimondi/delimitMate'
" Remap CTRL + Tab to jump to the right of an autimatically created delimiter
" For example:
"       Type          |   You get
" ===================================
"  (                  |   (|)
" ––––––––––––––––––––|––––––––––––––
"  (stringCTRL+Tab    |   (string)|
" ––––––––––––––––––––|––––––––––––––
inoremap <C-l> <C-R>=delimitMate#JumpAny("\<C-Tab>")<CR>

"
" EasyMotion
"
" Quickly jump around in a document
"
Plugin 'Lokaltog/vim-easymotion'

"
" Exchange
"
" Easily swap things with `cx`
"
Plugin 'tommcdo/vim-exchange'

"
" Fugitive
"
" Git wrapper for Vim
"
Plugin 'tpope/vim-fugitive'

"
" GitGutter
"
" Show Git status in the left margin
Plugin 'airblade/vim-gitgutter'

"
" Indent guides
"
" Visual markers of indent. Off by default, since I just turn these on
" every once in a while to debug an issue.
Plugin 'nathanaelkane/vim-indent-guides'

"
" NERD Commenter
"
" Easily comment out (or in) chunks of code
"
Plugin 'scrooloose/nerdcommenter'

"
" NERD Tree
"
" Tree explorer for navigating the file system
"
Plugin 'scrooloose/nerdtree'
let g:NERDTreeWinPos = "left"
let g:NERDTreeWinSize = 30
let NERDTreeIgnore=['\.rbc$', '\~$']

" A NERDTree toggle combined with the NERDTreeFind command
" Credit to http://bit.ly/lPz9N4
function! NERDTreeFindToggle()
  if exists("t:NERDTreeBufName")
    let s:ntree = bufwinnr(t:NERDTreeBufName)
  else
    let s:ntree = -1
  endif
  if (s:ntree != -1)
    :NERDTreeClose
  else
    :NERDTreeFind
  endif
endfunction

map <Leader>n :call NERDTreeFindToggle()<CR>

"
" Powerline
"
" Better status line at the bottom of the screen
"
" Only enable fancy on GUI systems, otherwise use the simpler status line
" defined further down.
Bundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
if has('gui_running')
  let g:Powerline_symbols = 'fancy'
endif
set t_Co=256
set fillchars+=stl:\ ,stlnc:\
set term=xterm-256color
set termencoding=utf-8

"
" Signature
"
" Tool for displaying and using Vim's marks
"
Plugin 'kshenoy/vim-signature'

"
" Surround
"
" Tool for surround things with other things
"
Plugin 'tpope/vim-surround'

"
" Syntastic
"
" Syntax checking and error reporting
"
Plugin 'scrooloose/syntastic'
" Tell Syntastic to use pyflakes for testing Python
let g:syntastic_python_checkers=['flake8']
let g:syntastic_python_checker_args='--ignore=E501'
" Tell Syntastic to use jshint for testing JS
let g:syntastic_javascript_checkers=['jshint']
" Tell Syntastic to use csslint for testing CSS
let g:syntastic_css_checkers=['csslint']
" Syntastic errors to the Vim error list.
" This lets you jump between then with lnext and lprev.
let g:syntastic_always_populate_loc_list = 1

"
" Tagbar
"
" Display an outline of the code in a sidebar
"
Plugin 'majutsushi/tagbar'

"
" Make a line a selectable text object, without line breaks
"
Plugin 'kana/vim-textobj-user'
Plugin 'kana/vim-textobj-line'

"
" UltiSnips and YouCompleteMe
"
" These work together to autocomplete words and complete snippets
"
if has('python') || has('python3')
  Plugin 'SirVer/ultisnips'
  Plugin 'honza/vim-snippets'
  Plugin 'Valloric/YouCompleteMe'
endif

" UltiSnips key commands
" We can't use <tab> beucae of YouCompleteMe conflicts
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

"
" YankRing
"
Plugin 'vim-scripts/YankRing.vim'

" Show YankRing with leader and y
nnoremap <silent> <leader>y :YRShow<CR>
" Make YankRing vertical sidebar
let yankring_window_use_horiz=0
let g:yankring_window_width = 40
" Don't add single chars to YankRing buffer
let g:yankring_min_element_length = 2
" Put the yankring history file in the vim directory
" we setup in the install, and make it hidden.
let g:yankring_history_dir = '~/.vim'
let g:yankring_history_file = '.yankring_history'

"
" Yankstack
"
Plugin 'maxbrunsfeld/vim-yankstack'
nmap <leader>p <Plug>yankstack_substitute_older_paste
nmap <leader>P <Plug>yankstack_substitute_newer_paste
" Prevent yankstack from clobbering surround's remap of the S key
" https://github.com/maxbrunsfeld/vim-yankstack/issues/9
call yankstack#setup()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Language syntax plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" CSS
"
" Colorizes color statements like rgba(0, 0, 0) or #FF0000
Plugin 'skammer/vim-css-color'
" Syntax formatter
Plugin 'hail2u/vim-css3-syntax'

"
" HTML5
"
Plugin 'othree/html5.vim'

"
" Javascript
"
" Pangloss' Javascript module
"
Plugin 'pangloss/vim-javascript'
" Highlight HTML and CSS within JS strings
let javascript_enable_domhtmlcss=1
" Enable JS folding
let b:javascript_fold=1

"
" JSON
"
Plugin 'elzr/vim-json'

"
" LESS
"
Plugin 'groenewege/vim-less'

"
" Markdown
"
Plugin 'tpope/vim-markdown'

"
" Mustache templates
"
" Default mustache and also Meteor's handlebars variant, spacebars
"
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'Slava/vim-spacebars'

"
" PHP
"
Plugin 'StanAngeloff/php.vim'

"
" Processing
"
Plugin 'sophacles/vim-processing'

"
" Puppet
"
Plugin 'rodjek/vim-puppet'

"
" Python
"
Plugin 'klen/python-mode'

"
" Tcl for expect scripts
"
Plugin 'vim-scripts/tcl.vim--smithfield'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vundle end
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" All of your Plugins must be added before the following line
call vundle#end()            " required

" Enable detection, plugins and indenting in one step
" Required by Vundle
filetype plugin indent on    " required

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General Vim settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on                    " Color highlighting
                             " has to be called before status line directives
set nocompatible             " Use Vim not Vi settings
set history=1000             " Long memory
set undolevels=1000          " Lots of undo too
if v:version >= 730
    set undofile             " Store the undo in a file
    set undodir=~/.vim/.undo,~/tmp,/tmp
endif
set nobackup                 " I've never once used a Vim backup
set noswapfile               " or restored a file from swap.
set directory=~/.vim/.tmp,~/tmp,/tmp
                             " But, let's put em in tmp if swap does
                             " get turned on.

" When vimrc is edited, reload it
autocmd! bufwritepost vimrc source ~/.vimrc

" Diff an unsaved file against saved file
function! s:DiffWithSaved()
  let filetype=&ft
  diffthis
  vnew | r # | normal! 1Gdd
  diffthis
  exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction
com! DiffSaved call s:DiffWithSaved()

" Make the OSX clipboard work with vim
set clipboard=unnamed

" Allow backspace to work across lines, etc.
set backspace=indent,eol,start

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" GUI options for MacVim if enabled
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has('gui_running')
  colors crispy

  " Window size, and disable the MacVim toolbar
  "set lines=60
  "set columns=140
  set go-=T

  " Enable a ruler at 80 chracters to encourage short lines
  if exists('+colorcolumn')
    set colorcolumn=80
  endif

  " Helps keep the windows the right shape after splitting
  set noequalalways

  " Shorter key mapping for split navigation
  " TODO This isn't working right now. Fix it.
  " nnoremap <M-Right> <C-W><C-L>

  " Requires 'experimental renderer' in the MacVIm settings window
  set transp=0

  " Unique cursor for insert and edit mode
  set guicursor=n-v-c:hor35-Cursor,ve:ver35-Cursor,o:hor50-Cursor,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor,sm:block-Cursor-blinkwait175-blinkoff150-blinkon175

  " Good monospace font
  "set noantialias
  " TODO Add some conditionals here for systems without this font.
  " TODO Figure out how you want to package this font.
  " Patched version of Panic Sans. See:
  " http://apw-bash-settings.readthedocs.org/en/latest/fontpatching.html
  " for font patching info.
  set guifont=Panic\ Sans\ for\ Powerline:h13

  " Tabs
  " Access specific Vim tabs with numbers
  noremap <D-1> :tabn 1<CR>
  noremap <D-2> :tabn 2<CR>
  noremap <D-3> :tabn 3<CR>
  noremap <D-4> :tabn 4<CR>
  noremap <D-5> :tabn 5<CR>
  noremap <D-6> :tabn 6<CR>
  noremap <D-7> :tabn 7<CR>
  noremap <D-8> :tabn 8<CR>
  " Command-9 goes to the last tab
  noremap <D-9> :tablast<CR>

endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Copy/Paste
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fix indents on paste with an ESC before p or P
:noremap <Esc>p p'[v']=
:noremap <Esc>P P'[v']=

" Visually select the most recently edited or pasted text
nnoremap <expr> <leader>p '`[' . strpart(getregtype(), 0, 1) . '`]'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Status line
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Always show the statusline
set laststatus=2

" If Powerline isn't being used, set some statusline defaults

" Status line coloring
hi User1     ctermbg=grey      ctermfg=black     guibg=#111111   guifg=#5D90CD
hi User2     ctermbg=white     ctermfg=black     guibg=#111111   guifg=#96CBFE
hi User3     ctermbg=white     ctermfg=black     guibg=#111111   guifg=#FF6C60
hi User4     ctermbg=white     ctermfg=black     guibg=#111111   guifg=#A8FF60

function! SyntaxItem()
  return synIDattr(synID(line("."),col("."),1),"name")
endfunction
set statusline+=%{SyntaxItem()}
if has('statusline')
  set statusline=%1*                                    " Set highlighting
  set statusline+=\ \ \                                 " Spacing
  set statusline+=%F\                                   " File name
  set statusline+=%h%m%r%w\                             " Flags
  set statusline+=\ \ \ \ \                             " Spacing
  set statusline+=%2*                                   " Set highlighting
  set statusline+=%{SyntaxItem()}                       " Syntax highlight group under cursor
  set statusline+=%=                                    " Align right
  set statusline+=\ \ \ \ \                             " Spacing
  set statusline+=%3*                                   " Set highlighting
  set statusline+=TYPE=%{strlen(&ft)?&ft:'none'}\       " File type
  set statusline+=ENC=%{(&fenc==\"\"?&enc:&fenc)}\|     " Encoding
  set statusline+=%{&fileformat}\                       " File format
  set statusline+=LANG=%{&spelllang}\                   " Language of spelling checker
  set statusline+=%4*                                   " Set highlighting
  set statusline+=\ \ \ \ \                             " Spacing
  set statusline+=%-7.(%l,%c%V%)\ %<%P                  " Cursor position/offset
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Line numbers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set number               " enable line numbers
set numberwidth=2        " make the line number area wider
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE
set cpoptions+=n         " use the line number area for wrapped lines

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set ruler                           " show the cursor position all the time
set scrolloff=3                     " keep 3 lines when scrolling
set nostartofline                   " don't jump to first character when paging
set ttyfast                         " smoother changes
set title                           " show title in console title bar
set so=7                            " scroll 7 lines before the bottom
set cmdheight=2                     " commandbar height
set showmatch                       " show matching curly braces and such
set iskeyword+=_,$,@,%,#,.          " none of these are word dividers
set iskeyword-=.                    " but these are word dividers
set cursorline                      " highlight current line

" Set some text defaults
set encoding=utf8
try
    lang en_US
catch
endtry

set ffs=unix,dos,mac "Default file types

" Use better tab and end of line chars.
set listchars=tab:▸\ ,eol:¬

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tools
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set wildmode=longest:full           " Complete filenames like Bash
set wildignore+=.git                " Ignore some file types in autocomplete
set wildmenu                        " easier naviation of the file system
set hid                             " undo history remainis when switching buffers

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tabs and indenting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nosmartindent                   " Disable the annoying smartindent
set tabstop=2                       " Tabstops equal two collumns
set shiftwidth=2                    " Indent operations are also two collumns
set softtabstop=2                   " Makes tabs feel like tabs but act like spaces
set expandtab                       " Insert spaces when you hit the tab key
set smarttab                        " Smart indent new lines
set list listchars=tab:\ \ ,trail:· " Show some hidden char.
set ai                              " auto indent
set wrap                            " wrap lines

" Use 4 spaces for python
autocmd Filetype python setlocal ts=4 sts=4 sw=4
"
" Use 3 spaces for AutoIt scripts
autocmd Filetype autoit setlocal ts=3 sts=3 sw=3

" Shortcuts for indenting without loosing visual selection
nmap <D-[> <<
nmap <D-]> >>
vmap <D-[> <gv
vmap <D-]> >gv

" load the plugin and indent settings for the detected filetype
" TODO check if the plugin exists
filetype plugin indent on

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Search
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set hlsearch                        " highlight searches
set incsearch                       " do incremental searching
set ignorecase                      " ignore case when searching
set smartcase                       " pay attention to case when searching if you
                                    " use Upper Case letters in your search

" Clear search highlighting
map <silent> <leader><cr> :noh<cr>

" Toggle ignorecase
map <leader>c :set ic!<cr>

" Escape special characters in a string for exact matching.
" This is useful to copying strings from the file to the search tool
" Based on this - http://peterodding.com/code/vim/profile/autoload/xolox/escape.vim
function! EscapeString (string)
  let string=a:string
  " Escape regex characters
  let string = escape(string, '^$.*\/~[]')
  " Escape the line endings
  let string = substitute(string, '\n', '\\n', 'g')
  return string
endfunction

" Get the current visual block for search and replaces
" This function passed the visual block through a string escape function
" Based on this - http://stackoverflow.com/questions/676600/vim-replace-selected-text/677918#677918
function! GetVisual() range
  " Save the current register and clipboard
  let reg_save = getreg('"')
  let regtype_save = getregtype('"')
  let cb_save = &clipboard
  set clipboard&

  " Put the current visual selection in the " register
  normal! ""gvy
  let selection = getreg('"')

  " Put the saved registers and clipboards back
  call setreg('"', reg_save, regtype_save)
  let &clipboard = cb_save

  "Escape any special characters in the selection
  let escaped_selection = EscapeString(selection)

  return escaped_selection
endfunction

" Start the find and replace command across the entire file
vmap <leader>z <Esc>:%s/<c-r>=GetVisual()<cr>/

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General aliases
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Help fat fingers
" I constantly am accidentally typing :W, :Q, :Qall because I still and
" pressing the shift for the colon by the time I get over to the w or q.
" This remaps the caps versions of these commands to the lowercase commands
" that I mean to be typing.
cnoreabbrev <expr> W ((getcmdtype() is# ':' && getcmdline() is# 'W')?('w'):('W'))
cnoreabbrev <expr> Q ((getcmdtype() is# ':' && getcmdline() is# 'Q')?('q'):('Q'))
cnoreabbrev <expr> Qall ((getcmdtype() is# ':' && getcmdline() is# 'Qall')?('qall'):('Qall'))

" Fast saving
nmap <leader>w :w!<cr>

" Fast editing of the .vimrc
" TODO - don't hard code this
map <leader>e :e! ~/.vimrc<cr>

" Close all the buffers
" This is nice because it cleans everything up but leaves You
" with a blank page for new composing.
map <leader>q :1,300 bd<cr>

" Navigate betwen buffers with arrows
map <right> :bn<cr>
map <left> :bp<cr>

" Enter new lines without entering insert mode
map <S-Enter> O<Esc>
map <CR> o<Esc>

" Toggle spell checking on and off
nmap <leader>s :set spell!<CR>

" Use the . to repeat a command for a visual selection
vnoremap . :normal .<CR>

" Shortcut to cd to the directory of the current file
nnoremap <leader>cd :cd %:p:h<CR>

" Shortcut to jump between quickfix errors
map <leader>] :lnext<cr>
map <leader>[ :lprevious<cr>

" Quicker window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" File type specifications
"
" @TODO@ cleanup the filetype specifications scattered 
" throughout this file
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("autocmd")
  " Enable file type detection
  filetype on

  " Example conditional filetype setting
  autocmd FileType javascript setlocal ts=4 sts=4 sw=4

  " Treat Drupal files as PHP
  autocmd BufNewFile,BufReadPre *.php,*.inc,*.module,*.install setfiletype php

  " Treat Drupal template files and Handlebard templates as HTML
  autocmd BufNewFile,BufReadPre *.tpl.php,*.hbs setfiletype html
  autocmd BufNewFile,BufReadPre *.tpl.php,*.hbs setfiletype html
  autocmd FileType html set cursorcolumn

  " Treat Apache config files as conf files
  autocmd BufNewFile,BufReadPre *.enabled,*.disabled setfiletype conf

  " Treat TileMill Carto files as CSS
  autocmd BufNewFile,BufRead *.mss setfiletype less

  " Treat TileMill project files like the JSON that they are
  autocmd BufNewFile,BufRead *.mml setfiletype json

  " JSON settings
  autocmd FileType json set foldmethod=syntax
  autocmd FileType json setlocal conceallevel=0

  " Markdown and text settings
  " Wrap these files to 80 char wide for easy reading.
  autocmd FileType md setlocal tw=80
  autocmd FileType txt setlocal tw=80

  " Strip EOL whitespace out of specific filetypes
  " also turn tabs into two spaces
  autocmd BufWritePre *.py,*.css,*.mss,*.html,*.js,*.json,*.xml,*.php,*.inc,*.module,*.install,*.sh,*.vim :retab | :call <SID>StripTrailingWhitespaces()
endif

" PHP testing
set makeprg=php\ -l\ %
set errorformat=%m\ in\ %f\ on\ line\ %l

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Folding
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set foldmethod=expr
set foldcolumn=0
" Shortcut to toggle a fold open and closed
nnoremap <space> za
vnoremap <space> za

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin configurations
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" NERDTree


"
" Indent guides
"
" Enable indent guides on startup
let g:indent_guides_enable_on_vim_startup = 0


"
" Tagbar
" Source code browser, alternative to Taglist
"
map <Leader>g :TagbarToggle<CR>


"
" Signature
"
" Plugin to toggle, display and navigate marks
"
let g:SignatureEnabledAtStartup = 1


"
" PyFlakes
" Syntax checking for Python on file save
"
" Disabled because of some performance issues.
"autocmd BufWritePost *.py call Flake8()



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remove trailing whitespace on save
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! <SID>StripTrailingWhitespaces()
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " Do the business:
  %s/\s\+$//e
  " Clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction
