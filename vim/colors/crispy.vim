" Vim color scheme
"
" Name:         crispy.vim
" Maintainer:   bryan kennedy
" License:      public domain
"
" Inspired by these themes
" IR_Black Text Mate theme - http://blog.toddwerth.com/entries/show/2
" Clouds midnight - http://fredhq.com/projects/clouds
" Blackboard - http://www.vim.org/scripts/script.php?script_id=2280
"
" Functional variable code from Bandit color theme
" http://sites.google.com/site/abudden/contents/Vim-Scripts/bandit-colour-scheme
"
" Colors helped by 0to255
" http://0to255.com/

set background=dark

" Clear all highlighting styles
hi clear

" Name the theme
let g:colors_name = "crispy"

" Reset syntax highlighting
if exists("syntax_on")
   syntax reset
endif

" Define the color variables

" Line highlighting
let almost_midnight = '#111111'
let almost_black = '#191919'

" Comments
let pale_grey = '#99a4b3'
let paler_grey = '#dee1e6'
let dark_grey = '#444444'
let darkest_grey = '#222222'

" PHP tags, current buffer
let pale_red = '#FF6C60'
let paler_red = '#FFB6B0'

" Strings
let pale_green = '#A8FF60'
let paler_green = '#CEFFAB'

let vivid_blue = '#5D90CD'
let slate_blue = '#d9ecff'
let pale_blue = '#96CBFE'
let paler_blue = '#B5DCFE'
let lilac_blue = '#5555AA'
let dusk_blue = '#8888AA'

let pale_yellow = '#FFFFB6'
let paler_yellow = '#FFFFCB'

" TRUE/FALSE
let pale_magenta = '#FF73FD'
let paler_magenta = '#FF9CFE'
let vivid_magenta = '#ea00e7'

" Variables
let pale_cyan = '#C6C5FE'
let paler_cyan = '#DFDFFE'

" Define the color assignment array.
"
" Vim color schemes don't support variables, so we store them all in an array
" then loop through it to set the color with the highlight commands
let ColorAssignment = {}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Basic text
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let ColorAssignment['Normal'] = {"GUIFG": 'White', "GUIBG": 'Black'}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Interface elements
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Cursor
let ColorAssignment['Cursor'] = {"GUIFG": 'Black', "GUIBG": 'White'}
let ColorAssignment['CursorLine'] = {"GUIBG": almost_midnight}

" Folding - I don't really use folding, but it's worth formating for when it comes up
let ColorAssignment['FoldColumn'] = {"GUIFG": pale_magenta, "GUIBG": almost_black}
let ColorAssignment['Folded'] = {"GUIFG": pale_magenta, "GUIBG": almost_black}

" Popup Menu for things like Fuzzy Finder
let ColorAssignment['Pmenu'] = {"GUIFG": 'White', "GUIBG": dark_grey}
let ColorAssignment['PmenuSel'] = {"GUIFG": 'Black', "GUIBG": paler_green}

" Line Numbering
let ColorAssignment['LineNr'] = {"GUIFG": pale_blue, "GUIBG": almost_midnight}

" Status Lines aka 'horizontal split'
let ColorAssignment['StatusLine'] = {"GUIFG": almost_midnight, "GUIBG": 'White'}
let ColorAssignment['StatusLineNC'] = {"GUIFG": almost_midnight, "GUIBG": almost_midnight}

" Vertical Splits
let ColorAssignment['VertSplit'] = {"GUIFG": darkest_grey, "GUIBG": almost_midnight}

" Signs Column
let ColorAssignment['SignColumn'] = {"GUIBG": darkest_grey}

let ColorAssignment['Title'] = {"GUIFG": slate_blue, "GUI": "Bold"}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Things that need highlighting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Search highlighting
let ColorAssignment['Search'] = {"GUIFG": 'White', "GUIBG": 'Red'}
let ColorAssignment['IncSearch'] = {"GUIFG": 'White', "GUIBG": pale_red}

" Errors
let ColorAssignment['Error'] = {"GUIFG": 'White', "GUIBG": pale_red, "TERM": 'Reverse'}

" To Do tags
let ColorAssignment['Todo'] = {"GUIFG": dark_grey, "GUIBG": paler_yellow, "TERM": 'Standout'}

" Special Stuff
let ColorAssignment['Special'] = {"GUIFG": 'Red', "TERM": 'Bold'}
let ColorAssignment['SpecialChar'] = {"GUIFG": '#AA0000'} " special character in a constant
let ColorAssignment['SpecialKey'] = {"GUIFG": '#555555'} " special highlighting for 'listchars' etc
let ColorAssignment['NonText'] = {"GUIFG": '#555555'} " special highlighting for 'listchars' etc
let ColorAssignment['MatchParen'] = {"GUI": 'Underline', "GUIFG": "Yellow"} " Highlighting of matching parentheses

let ColorAssignment['Visual'] = {"GUIFG": 'NONE', "GUIBG": '#262D51'}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Generic code highlighting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Comments
" TODO - Test these out further once you get Doxygen plugin working
let ColorAssignment['Comment'] = {"GUIFG": pale_grey, "CTERMFG": 'Grey', "TERM": 'Bold'}

" Strings and constants
let ColorAssignment['Keyword'] = {"GUIFG": slate_blue}
let ColorAssignment['PreProc'] = {"GUIFG": vivid_blue}
let ColorAssignment['Constant'] = {"GUIFG": pale_green, "CTERMFG": 'red', "TERM": 'Underline'}
let ColorAssignment['String'] = {"GUIFG": pale_green}
let ColorAssignment['Character'] = {"GUIFG": pale_green}
let ColorAssignment['Number'] = {"GUIFG": pale_green}

" HTML tag text
let ColorAssignment['Statement'] = {"GUIFG": paler_blue, "TERM": 'Bold'}

" Statements are shades of magenta
let ColorAssignment['Conditional'] = {"GUIFG": paler_magenta} " if, then, else, endif, switch, etc.
let ColorAssignment['Label'] = {"GUIFG": paler_magenta} " case, default, etc.
let ColorAssignment['Repeat'] = {"GUIFG": vivid_magenta} " for, do, while, etc.
let ColorAssignment['Exception'] = {"GUIFG": vivid_magenta} " try, catch, throw

" Variables
let ColorAssignment['Identifier'] = {"GUIFG": paler_cyan}
" Varible related symbols ($, +, =, -, % etc)
let ColorAssignment['Operator'] = {"GUIFG": pale_cyan}

" Identifiers are shades of Cyan
let ColorAssignment['Function'] = {"GUIFG": paler_green, "CTERMFG": 'Green'}
let ColorAssignment['Method'] = {"GUIFG": paler_green, "CTERMFG": 'Cyan'}

" Types
let ColorAssignment['Type'] = {"GUIFG": pale_red, "TERM": 'Underline'}
let ColorAssignment['StorageClass'] = {"GUIFG": paler_red} " static, register, volatile, etc.
let ColorAssignment['Structure'] = {"GUIFG": paler_red} " struct, union, enum, etc.

" HTML
let ColorAssignment['htmlH1'] = {"GUIFG": slate_blue}
let ColorAssignment['htmlH2'] = {"GUIFG": paler_blue}
let ColorAssignment['htmlH3'] = {"GUIFG": pale_blue}
let ColorAssignment['htmlH4'] = {"GUIFG": lilac_blue}
let ColorAssignment['htmlH5'] = {"GUIFG": dusk_blue}
let ColorAssignment['htmlH6'] = {"GUIFG": pale_grey}
let ColorAssignment['htmlH6'] = {"GUIFG": pale_grey}
highlight link htmlTag Type
highlight link htmlEndTag htmlTag
highlight link htmlTagName htmlTag

" Delimiters
let ColorAssignment['Delimiter'] = {"GUIFG": paler_magenta}

" C
" Preprocessor directives are bold shades of blue
let ColorAssignment['Include'] = {"GUIFG": slate_blue} " preprocessor #include
let ColorAssignment['Define'] = {"GUIFG": '#5555FF', "GUI": 'Bold'} " preprocessor #define
let ColorAssignment['Macro'] = {"GUIFG": '#5555FF', "GUI": 'Bold'} " same as Define
let ColorAssignment['PreCondit'] = {"GUIFG": '#8888FF', "GUI": 'Bold'} " preprocessor #if, #else, #endif, etc.

let valid_cterm_Colors =
      \ [
      \     'Black', 'DarkBlue', 'DarkGreen', 'DarkCyan',
      \     'DarkRed', 'DarkMagenta', 'Brown', 'DarkYellow',
      \     'LightGray', 'LightGrey', 'Gray', 'Grey',
      \     'DarkGray', 'DarkGrey', 'Blue', 'LightBlue',
      \     'Green', 'LightGreen', 'Cyan', 'LightCyan',
      \     'Red', 'LightRed', 'Magenta', 'LightMagenta',
      \     'Yellow', 'LightYellow', 'White',
      \ ]

for key in keys(ColorAssignment)
  let s:Colors = ColorAssignment[key]
  if has_key(s:Colors, 'TERM')
    let term = s:Colors['TERM']
  else
    let term = 'NONE'
  endif
  if has_key(s:Colors, 'GUI')
    let gui = s:Colors['GUI']
  else
    let gui='NONE'
  endif
  if has_key(s:Colors, 'GUIFG')
    let guifg = s:Colors['GUIFG']
  else
    let guifg='NONE'
  endif
  if has_key(s:Colors, 'GUIBG')
    let guibg = s:Colors['GUIBG']
  else
    let guibg='NONE'
  endif
  if has_key(s:Colors, 'CTERM')
    let cterm = s:Colors['CTERM']
  else
    let cterm=gui
  endif
  if has_key(s:Colors, 'CTERMFG')
    let ctermfg = s:Colors['CTERMFG']
  else
    if index(valid_cterm_Colors, guifg) != -1
      let ctermfg=guifg
    else
      let ctermfg='Blue'
    endif
  endif
  if has_key(s:Colors, 'CTERMBG')
    let ctermbg = s:Colors['CTERMBG']
  else
    if index(valid_cterm_Colors, guibg) != -1
      let ctermbg=guibg
    else
      let ctermbg='NONE'
    endif
  endif
  if has_key(s:Colors, 'GUISP')
    let guisp = s:Colors['GUISP']
  else
    let guisp='NONE'
  endif

  if key =~ '^\k*$'
    execute "hi ".key." term=".term." cterm=".cterm." gui=".gui." ctermfg=".ctermfg." guifg=".guifg." ctermbg=".ctermbg." guibg=".guibg." guisp=".guisp
  endif
endfor
