"\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
"
"                                   CREDITS AND BYLINE
"
"   - .vimrc by me 
"   - reminder: do not put anything in your .vimrc that you do not understand
"   - modeline: set specific settings for this file; 1 means check final line for special comment
"
"\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

" BASICS {{{
"\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
"
"    			               			BASIC VIM SETTINGS
"
"	- turn syntax highlighting on
"	- clipboard: clipboard setting; alllow copy/paste from clipboard
"	- tabstop: when vim opens a file and reads a TAB character, it uses 4 spaces for it
"	- softtabstop: pressing the tab key will insert 4 spaces (as opposed to the default of 8)
"   - shiftwidth: setting the amount of spaces that will be inserted with '<' and '>'
"	- expandtab: turns tabs into spaces 
"	- number: show line numbers
"	- showcmd: show latest command in bottom bar
"	- filetype indent: load filetype-specific indent files
"	- wildmenu: provides graphical menu when cycling through filenames (ex. in :e ~/.vim<TAB>)
"	- showmatch: when cursor moves over parenthesis like character, highlight the matching one
"	- incsearch: search as characters are entered
"	- hlsearch: highlight matches
"	- set 'leader' to comma, (\ is the default leader)
"	- Vim will keep highlighted searches until you manually un-highlight or do a new one; 
"     sets unhighlight to ,<SPACE> 
"	- allow mouse usage; since i am boosted 
"   - autoindent: copy indentation from previous line at start of new line
"   - filetype plugin on: enable filetype plugins
"   
"
"\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

syntax enable
set clipboard=unnamed
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab 
set number
set showcmd 
filetype indent on 
set wildmenu
set showmatch 
set incsearch 
set hlsearch
let mapleader=","

nnoremap <Leader><space> :nohlsearch<CR> 

set mouse=a             "a is for all
set autoindent 
filetype plugin on 

" }}}
" SPECIFICS {{{ 
"\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
"
"    			               			SPECIFIC VIM SETTINGS
"
"   - colorscheme: from ~/.vim/colors. download color schemes form the world wide web.
"	- set jk to <ESC>
"   - mksession saves a given assortment of windows so that they're open the next time;
"     mapped to <,s>. to reopen, use 'vim -S Session.vim' 
"   - pretty visual mode highlight color that matches with color scheme. main thing is the ctermbg
"     attribute good values for that are: 1 and 3
"   - change highlight color on pattern search hit
"   - maplocalleader - set local leader; secondary map leader applying to
"     only certain files
"
"\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

colorscheme  tetragrammaton
inoremap jk <esc>
nnoremap <Leader>s :mksession<CR>
highlight Visual cterm=NONE ctermbg=3 ctermfg=NONE guibg=Grey40 
highlight Search cterm=NONE ctermfg=grey ctermbg=blue guibg=Grey40
highlight Folded ctermbg=3
let maplocalleader="\\"

"}}}
" FOLDING {{{
"\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
"    			               		    	FOLDING 
"
"   - vim folding is good, but i don't need to use it a lot, so i make it toggle-able 
"   - folds are how we can selectively show and conceal sections of code that may sometimes not 
"     not be completely relevant and see the 'bigger picture' more easily
"
"   - foldenable: enable folding
"   - foldlevelstart: open most folds by default; setting to 0 means all folds are closed, setting 
"     to 99 means all are open. setting to 10 ensures only very nested blocks of code are folded
"     when opening a buffer
"   - foldnestmax: folds can be nested. setting a max guards against too many folds 
"   - space <za>: space opens and closes folds
"   - foldmethod: fold based on indent. other options are: marker, manual, expr, syntax, diff
"     run :help to find what each one of those do
"
"\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

set foldenable
set foldlevelstart=10 
set foldnestmax=10 
nnoremap <space> za
set foldmethod=indent
" }}}
" VIMPLUG {{{
"\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
"    			               		    	
"                                           VIMPLUG
"
"   - ****USE SINGLE QUOTES ONLY******
"   - plugin manager for vim; minimalist -- allows me to install other vim plugins 
"   - reload .vimrc and use :PlugInstall to install plugins
"   - call plug#begin: specify a directory for plugins, avoid using standard vim directory names 
"     like 'plugin'. 
"   - plugins: 
"       - nerdtree: the NERD tree allows you to explore your filesystem and to open files and
"                   directories. It presents the filesystem to you in the form of a tree which you
"                   manipulate with the keyboard and/or mouse. It also allows you to perform
"                   simple filesystem operations.  
"       - nerdcommenter: simplified and prettified commenting
"       - vimtex: vim support for latex
"   - call plug#end: initialize plugin system
"
"
"\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'scrooloose/nerdcommenter'
Plug 'lervag/vimtex'

call plug#end()

" }}}
" NERDTREE {{{
"\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
"    			               		    	
"                                          NERDTREE 
"
"   - <C-n>: toggle nerd tree with control + n
"   - <C-h>: go to next left window (same as vim navigation)
"   - <C-j>: go to window below (same as vim navigation)
"   - <C-k>: go to window above (same as vim navigation)
"   - <C-l>: go to window to the right (same as vim navigation)
"   - autocmd bufenter: this line will set vim to automatically close if the
"     tree is the only thing left open
"
"
"\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

map <C-n> :NERDTreeToggle<CR>
map <C-h> <C-W>h<C-W>
map <C-j> <C-W>j<C-W>
map <C-k> <C-W>k<C-W>
map <C-l> <C-W>l<C-W>

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" }}}
" NERDCOMMENTER {{{
"\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
"    			               		    	
"                                          NERDCOMMENTER                                    
"                                          
"   - SpaceDelims: add spaces after comment delims by default
"   - Compact: Use compact syntax for prettified multi-line comments
"   - Align: Align line-wise comment delimiters flush left instead of following code indentation 
"   - Alternate_java: custom delims for java 
"   - custome delims for C
"   - EmptyLines: allow comments on empty lines
"   - TrimTrailingWhitespace: trim trailing whitespaces when uncommenting  
"
"
"\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
let g:NERDAltDelims_java = 1
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1

" }}}
" VIMTEX {{{
"\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
"    			               		    	
"                                          VIMTEX
"                                          
"   - vimtex_view_method - change pdf viewer to zathura 
"   - vimtex_fold_enabled - disable folding in vimtex
"   - tex_flavor - seemingly useless; just putting this line in an attempt to
"                  reduce lag
"
"\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

let g:vimtex_view_method = 'zathura'
let g:vimtex_fold_enabled=0
let g:tex_flavor='latex'

" }}}


set modelines=1     
" vim:foldmethod=marker:foldlevel=0
