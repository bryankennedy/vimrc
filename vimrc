"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Credits
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" bryan kennedy's vimrc file
"
" ideas taken from these sources
" http://amix.dk/blog/post/19486#The-ultimate-vim-configuration-vimrc
" http://vimcasts.org
" http://www.vi-improved.org/vimrc.php
" https://github.com/nvie/vimrc

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pathogen
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use pathogen to easily modify the runtime path to include all plugins under
" the ~/.vim/bundle directory
filetype off                 " force reloading *after* pathogen loaded
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()
filetype plugin indent on    " enable detection, plugins and indenting in one step

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" GUI options for MacVim if enabled
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has('gui_running')
  set lines=120              " window height
  set columns=180            " window width
  set go-=T                  " hide the MacVim toolbar

  " Helps keep the windows the right shape after splitting
  set noequalalways

  " Requires 'experimental renderer' in the MacVIm settings window
  set transp=0

  " Unique cursor for insert and edit mode
  set guicursor=n-v-c:hor35-Cursor,ve:ver35-Cursor,o:hor50-Cursor,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor,sm:block-Cursor-blinkwait175-blinkoff150-blinkon175

  " Good monospace font
  "set noantialias
  " TODO Add some conditionals here for systems without this font
  set guifont=Panic_Sans:h15

  " Color scheme
  colors crispy

endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible             " Use Vim not Vi settings
set history=1000             " Long memory
set undolevels=1000          " Lots of undo too
if v:version >= 730
    set undofile             " Store the undo in a file
    set undodir=~/.vim/.undo,~/tmp,/tmp
endif
set nobackup                 " I've never once used a Vim backup...
set noswapfile               " or restored a file from swap.
set directory=~/.vim/.tmp,~/tmp,/tmp
                             " But, let's put em in tmp if swap does
                             " get turned on.

syntax on                    " color highlighting
                             " has to be called before status line directives

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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Status line
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Always show the statusline
set laststatus=2

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
  set statusline=%1*                                   " Set highlighting
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

""""""""""""""""""""""""""
" Line numbers
""""""""""""""""""""""""""
set number               " enable line numbers
set numberwidth=5        " make the line number area wider
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE
set cpoptions+=n         " use the line number area for wrapped lines

""""""""""""""""""""""""""
" Interface
""""""""""""""""""""""""""
set ruler                           " show the cursor position all the time
set scrolloff=3                     " keep 3 lines when scrolling
set nostartofline                   " don't jump to first character when paging
set ttyfast                         " smoother changes
set title                           " show title in console title bar
set so=7                            " scroll 7 lines before the bottom
set cmdheight=2                     " commandbar height
set showmatch                       " show matching curly braces and such
set iskeyword+=_,$,@,%,#            " none of these are word dividers
"set cursorcolumn                   " highlight current cursor position
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

""""""""""""""""""""""""""
" Tools
""""""""""""""""""""""""""
set wildmode=longest:full           " Complete filenames like Bash
set wildignore+=.git                " Ignore some file types in autocomplete
set wildmenu                        " easier naviation of the file system
set hid                             " undo history remainis when switching buffers

""""""""""""""""""""""""""
" Tabs and indenting
""""""""""""""""""""""""""
set tabstop=2                       " Tabstops equal two collumns
set shiftwidth=2                    " Indent operations are also two collumns
set softtabstop=2                   " Makes tabs feel like tabs but act like spaces
set expandtab                       " Insert spaces when you hit the tab key
set smarttab                        " Smart indent new lines
set list listchars=tab:\ \ ,trail:· " Show some hidden char.
set ai                              " auto indent
set si                              " smart indet
set wrap                            " wrap lines

" Use 4 spaces for python
autocmd Filetype python setlocal ts=4 sts=4 sw=4

" Shortcuts for indenting without loosing visual selection
nmap <D-[> <<
nmap <D-]> >>
vmap <D-[> <gv
vmap <D-]> >gv

" load the plugin and indent settings for the detected filetype
" TODO check if the plugin exists
filetype plugin indent on

""""""""""""""""""""""""""
" Search
""""""""""""""""""""""""""
set hlsearch                        " highlight searches
set incsearch                       " do incremental searching
set ignorecase                      " ignore case when searching
set smartcase                       " pay attention to case when searching if you
                                    " use Upper Case letters in your search

" Clear search highlighting
map <silent> <leader><cr> :noh<cr>

" Toggle ignorecase
map <leader>c :set ic!<cr>

"""""""""""""""""""""""""
" General aliases
""""""""""""""""""""""""""
" Fast saving
nmap <leader>w :w!<cr>

" Fast editing of the .vimrc
map <leader>e :e! ~/Dropbox/vimrc/.vim_runtime/vimrc<cr>

" Close the current buffer
map <leader>bd :Bclose<cr>

" Close all the buffers
map <leader>ba :1,300 bd!<cr>

" Navigate betwen buffers with arrows
map <right> :bn<cr>
map <left> :bp<cr>

" Show invisibles
nmap <leader>l :set list!<CR>

" Enter new lines without entering insert mode
map <S-Enter> O<Esc>
map <CR> o<Esc>

" Toggle spell checking on and off
nmap <leader>s :set spell!<CR>

" Use the . to repeat a command for a visual selection
vnoremap . :normal .<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" File type specifications
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("autocmd")
  " Enable file type detection
  filetype on

  " Example conditional filetype setting
  "autocmd FileType javascript setlocal ts=4 sts=4 sw=4 noexpandtab

  " Treat Drupal files as PHP
  autocmd BufNewFile,BufReadPre *.php,*.inc,*.module,*.install setfiletype php

  " Strip EOL whitespace out of specific filetypes
  " also turn tabs into two spaces
  autocmd BufWritePre *.py,*.js,*.php,*.inc,*.module,*.install,*.sh,*.vim :retab | :call <SID>StripTrailingWhitespaces()

endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin configurations
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FuzzyFinder
" Search, starting with current buffer
nmap <leader>f :FufFileWithCurrentBufferDir<cr>
" Search, with a wildcard from current dir
nmap <leader>fw :FufFile **/<cr>

" NERDTree configuration
let NERDTreeIgnore=['\.rbc$', '\~$']
map <Leader>n :NERDTreeToggle<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remove trailing whitespace on save
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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
