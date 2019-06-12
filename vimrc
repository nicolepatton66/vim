" ~~~~~~~ vimrc ~~~~~~~
" ~~~ Nicole Patton ~~~
"
"  Module_settings
"  Keybindings
"  Functions
"  Autocommands
"
" ~~~~~~~~~~~~~~~~~~~~~

" do this first!
set nocompatible

" encoding
set encoding=utf-8
set termencoding=utf-8

" detect filetypes and auto load any plugins for them
filetype on
filetype plugin on

" sane indentation by default
set autoindent
filetype indent on

" syntax highlighting
set termguicolors
set background=dark
syntax on
colorscheme gruvbox

" make the background truly black
"highlight Normal ctermbg=black

" set tab width and don't use tab chars
set tabstop=8
set softtabstop=-1
set shiftwidth=4
set expandtab

" have shifts align to tabstops
set shiftround

" enable matchit
runtime macros/matchit.vim

" number of lines to keep above and below cursor (set to 999 to always center)
set scrolloff=5

" num cols to scroll horizontally (0 will center)
set sidescroll=5
set sidescrolloff=5

" c = autowrap comments using textwidth
" q = let gq format comments
" 1 = don't break line after 1 letter word
set textwidth=80
set formatoptions=cq1

" . = scan the current buffer ('wrapscan' is ignored)
" b = scan other loaded buffers that are in the buffer list
set complete=.,b

" write file when putting vim to sleep
set autowrite

" auto load changes
set autoread

" don't leave backup files all over the place, or swap files
set nobackup
set nowritebackup
set noswapfile

" get the backspace key to do sensible things
set backspace=indent,eol,start
vnoremap <BS> x
nnoremap <BS> hx

" don't read dot files in current dir!
set noexrc

" maximize help window (see ,m below)
set helpheight=99

" case-insensitive search if pattern all lower case, case-sensitive otherwise
set smartcase

" searching: hightlight matches, dynamically show match
set hlsearch
set incsearch

" don't add 2 spaces after punctuation when using join cmd
set nojoinspaces

" don't redraw while executing macros
set lazyredraw

" just let msgs stream on by (don't pause all the time)
set nomore

" use the mouse if possible (scrolling!)
set mouse=a

" keep msgs abbreviated and short
set shortmess=atT

" display commands and other useful stuff
set showcmd

" what sort of eol's to handle (priority list)
set fileformats=unix,dos

" milliseconds before cmd is cancelled
set timeoutlen=2000
set ttimeoutlen=2000

" how much ex cmd history to keep
set history=50

" keep the viminfo file under control
set viminfo='20,\"50,n~/.viminfo

" auto ignore these when tabbing through file names
set suffixes=.bak,~,.swp,.o,.info,.aux,.dvi,.out,.class

" don't wrap lines by default
set nowrap

" menu
set wildmenu
set wildmode=list:longest,full

" ruler (only used when there is no statusline)
set ruler
set rulerformat=%-32(%12(%l\ of\ %L%)\ %-6((%p%%)%)\ %-3c\ %)

" statusline
set laststatus=2
set statusline=%F\ %y%r%m%=%-32(%12(%l\ of\ %L%)\ %-6((%p%%)%)\ %-3c\ %)

" don't close buffers: hide them (allow opening new files with unsaved changes, etc)
set hidden

" allow visual blocks to go past eol, etc
set virtualedit=block

" how many changes can we undo
set undolevels=1000

" customize tabs, trailing whitespace, and non-breaking spaces (when list is on)
exec "set listchars=tab:\uBB\uBB,trail:\uB7,nbsp:~"

" Module_settings -----------------------------------------

" BufExplorer
let g:bufExplorerSortBy = 'number'
let g:bufExplorerSplitOutPathName = 1
let g:bufExplorerDefaultHelp = 1
nmap <silent> ,e \be

" TagList (requires ctags)
let Tlist_Inc_Winwidth = 0
let Tlist_WinWidth = 50
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Close_On_Select = 1
let Tlist_Exit_OnlyWindow = 1
let Tlist_Show_One_File = 1
let Tlist_Sort_Type = "name"
let Tlist_Enable_Fold_Column = 0
nnoremap <silent> ,t :TlistToggle<cr>

" Closetag
let g:closetag_filetypes = 'html,xhtml,eruby,xml'

" GitGutter
set updatetime=100

" Keybindings ---------------------------------------------

" F2 toggles between autoindent when pasting or not
set pastetoggle=<F2>

" F3 toggles mouse ownership (Vim or terminal)
nnoremap <silent> <F3> :call ToggleMouse()<cr>

" F4 toggle indent guide
nnoremap <silent> <F4> :IndentGuidesToggle<cr>

" F5 justify paragraphs
nnoremap <silent> <F5> gqap
vnoremap <silent> <F5> gq

" F6 show EOL whitespace
nnoremap <silent> <F6> :setlocal list!<cr>:set list?<cr>

" F7 toggle wrap
nnoremap <silent> <F7> :setlocal wrap!<cr>:set wrap?<cr>

" F8 clear eol space
nnoremap <silent> <F8> :call ClearEOLSpace()<cr>:nohlsearch<cr>

" F9 redraw screen and clear highlighting
nnoremap <silent> <F9> <c-l>:nohlsearch<cr>

" F10 bash
nnoremap <silent> <F10> :set ft=sh<cr>ggi#!/usr/bin/env bash<cr>set -e<cr><cr><esc>

" F11 perl
nnoremap <silent> <F11> :set ft=perl<cr>ggi#!/usr/bin/env perl<cr><cr><esc>

" F12 ruby
nnoremap <silent> <F12> :set ft=ruby<cr>ggi#!/usr/bin/env ruby<cr><cr><esc>

" default comments (shell type)
setlocal comments=:#
nmap <silent> ,, !!comment_default<cr>
vmap <silent> ,, ygv!comment_default<cr>
nmap <silent> ,. :s/\(\s*\)#/\1/<cr><F8>
vmap <silent> ,. :s/#//<cr><F8>

" set mode of current file
nnoremap <silent> ,6 :!chmod 644 %<cr>
nnoremap <silent> ,7 :!chmod 755 %<cr>

" toggle colorcolumn (line at column 80)
nnoremap <silent> ,c :call ToggleColorColumn()<cr>

" toggle cursorcolumn (line at cursor)
nnoremap <silent> ,C :set cursorcolumn!<cr>

" toggle line numbers
nnoremap <silent> ,n :set number!<cr>

" update gitgutter display
nnoremap <silent> ,g :GitGutterAll<cr>

" source vimrc
nnoremap <silent> ,v :source $MYVIMRC<cr>

" column alignment
vnoremap <silent> ,a !align<cr>
nnoremap <silent> ,a :!align<cr>
vnoremap <silent> ,A !align_all<cr>
nnoremap <silent> ,A :!align_all<cr>
vnoremap <silent> ,= !align_equals<cr>
nnoremap <silent> ,= :!align_equals<cr>

" un-align the current row
nmap <silent> ,l 1,A

" join this line and the next
nnoremap <silent> ,j 2:j<cr>
vnoremap <silent> ,j J

" join an entire paragraph
nnoremap <silent> ,J vip:j<cr>jj

" flip focus and maximize split window (used with help window)
nnoremap <silent> ,m <c-w>w<c-w>_

" quote word
nnoremap <silent> ,q :normal! "zyiw<esc>:let @z="\'".@z."\'"<cr>cw<c-r>z<esc>b
nnoremap <silent> ,Q :normal! "zyiw<esc>:let @z="\"".@z."\""<cr>cw<c-r>z<esc>b

" spellcheck word
nnoremap <silent> ,s :!echo <cword> \| aspell -a<cr>
vnoremap <silent> ,s :w! %.spellcheck<cr>:!aspell -x check %.spellcheck<cr>:*d<cr>:if line(".") != line("$")<cr>.-1r %.spellcheck<cr>else<cr>.r %.spellcheck<cr>endif<cr>:!rm %.spellcheck<cr>

" move to top/bottom quarter of screen
nnoremap <silent> ,H M8k
nnoremap <silent> ,L M8j

" search and replace word under cursor
nnoremap ,r :%s/\<<c-r><c-w>\>//gc<left><left><left>
nnoremap ,R :%s/\<<c-r><c-w>\>/<c-r><c-w>/gc<left><left><left>

" pretty print json
nnoremap <silent> ,pj !!python -mjson.tool<cr>:set ft=json<cr>
vmap     <silent> ,pj ,j,pj

" pretty print xml
nnoremap <silent> ,px !!xmllint --format -<cr>:set ft=xml<cr>
vmap     <silent> ,px ,j,px

" pretty print sql
nnoremap <silent> ,ps !!sqlformat --reindent --keywords upper -<cr>:set ft=sql<cr>
vmap     <silent> ,ps ,j,ps

" pretty print active record results
nnoremap <silent> ,pr !!record_split<cr>:set ft=text<cr>

" pretty print decoded url parameters
nnoremap <silent> ,pu !!url_split<cr>:set ft=text<cr>

" use visual blocks by default... ^v does character based
nnoremap v <c-v>
nnoremap <c-v> v

" delete in normal mode goes back to last write
nnoremap <silent> <delete> :earlier 1f<cr>

" have Y yank to eol
nnoremap Y y$

" have Q do nothing
noremap Q <nop>

" have & remember flags and be global
nnoremap & :%&&<cr>

" have return key insert blank line
nnoremap <return> o<esc>

" have space page down
noremap <space> <PageDown>L

" have tab indent a visual selection
vnoremap <tab>   >gv
vnoremap <s-tab> <gv

" have tab autocomplete
inoremap <silent> <tab> <c-r>=TabWrapper()<cr>

" use tab to switch buffers
nnoremap <silent> <tab>   :bn<cr>
nnoremap <silent> <s-tab> :bp<cr>

" use right/left arrow keys to switch buffers
nnoremap <right> :bn<cr>
nnoremap <left>  :bp<cr>

" use up/down arrow keys to page up/down
nnoremap <up>   <PageUp>H
nnoremap <down> <PageDown>L

" page up/down
noremap K <PageUp>H
noremap J <PageDown>L

" scroll screen in place
noremap <c-k> <c-y>k
noremap <c-j> <c-e>j
noremap <c-h> 5zh
noremap <c-l> 5zl

" have ctrl-p auto-indent
nnoremap <c-p> p=`]

" center these in searches
nnoremap n nzz
nnoremap `` ``zz

" select pasted text
nnoremap <silent> gV `[v`]

" Functions -----------------------------------------------

function! CommentHtml()
    setlocal comments=
    nmap <silent> ,, !!comment_html<cr>
    vmap <silent> ,, ygv!comment_html<cr>
    nmap <silent> ,. :s/<!-- *\(.*\)-->/\1/<cr><F8>
    vmap <silent> ,. :s/<!-- *\(.*\)-->/\1/<cr><F8>
endfunction

function! CommentSlim()
    setlocal comments=:\/
    nmap <silent> ,, !!comment_slim<cr>
    vmap <silent> ,, ygv!comment_slim<cr>
    nmap <silent> ,. :s/\///<cr><F8>
    vmap <silent> ,. :s/\///<cr><F8>
endfunction

function! CommentForwardSlashes()
    setlocal comments=:\/\/
    nmap <silent> ,, !!comment_forward_slashes<cr>
    vmap <silent> ,, ygv!comment_forward_slashes<cr>
    nmap <silent> ,. :s/\/\///<cr><F8>
    vmap <silent> ,. :s/\/\///<cr><F8>
endfunction

function! CommentSql()
    setlocal comments=:--
    nmap <silent> ,, !!comment_sql<cr>
    vmap <silent> ,, ygv!comment_sql<cr>
    nmap <silent> ,. :s/-- //<cr><F8>
    vmap <silent> ,. :s/-- //<cr><F8>
endfunction

function! CommentVim()
    setlocal comments=:\"
    nmap <silent> ,, !!comment_vim<cr>
    vmap <silent> ,, ygv!comment_vim<cr>
    nmap <silent> ,. :s/"//<cr><F8>
    vmap <silent> ,. :s/"//<cr><F8>
endfunction

function! WrapLineInBraces()
    nnoremap <silent> ,w :normal! kA {<esc>jo}<esc>k==
    nnoremap <silent> ,W :normal! k$hDjjddk<cr>==
endfunction

function! ClearEOLSpace()
    normal m`
    %s/\s\+$//e
    normal ``
endfunction

function! ToggleMouse()
    if &mouse == ""
        let &mouse="a"
        echo "Mouse is for Vim"
    else
        let &mouse=""
        echo "Mouse is for terminal"
    endif
endfunction

function! ToggleColorColumn()
    if &colorcolumn == ''
        set colorcolumn=80
    else
        set colorcolumn=
    endif
endfunction

function! TabWrapper()
    let col = col('.') - 1
    if !col
        return "\<tab>"
    elseif getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction

function! JavaTabWrapper()
    let col = col('.') - 1
    if !col
        return "\<tab>"
    elseif getline('.')[col - 1] == '.'
        return "\<c-x>\<c-o>"
    elseif getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction

function! PerlTabWrapper ()
    let cursorpos = getpos('.')
    let cursorcol = cursorpos[2]
    let curr_line = getline('.')
    let curr_pos_pat = '\%' . cursorcol . 'c'
    if curr_line =~ '^\s*' . curr_pos_pat
        return "\<tab>"
    endif
    if curr_line =~ '\k' . curr_pos_pat
        return "\<c-p>"
    endif
    if curr_line =~ '\(\->\|::\)' . curr_pos_pat
        return "\<c-x>\<c-o>"
    else
        return "\<s-tab>"
    endif
endfunction

" Autocommands --------------------------------------------

augroup custom
    autocmd!

    autocmd BufRead,BufNewFile *.coffee setlocal ft=coffee
    autocmd BufRead,BufNewFile *.slim   setlocal ft=slim
    autocmd BufRead,BufNewFile *.hs     setlocal ft=xml
    autocmd BufRead,BufNewFile *.tt     setlocal ft=html
    autocmd BufRead,BufNewFile *.tt2    setlocal ft=html
    autocmd BufRead,BufNewFile *.json   setlocal ft=json

    " set default filetype to text
    autocmd BufRead,BufNewFile * if &filetype == "" | setlocal ft=text | endif

    " always delete trailing whitespace
    autocmd BufWrite * :call ClearEOLSpace()

    " remove crap that somehow gets added
    autocmd FileType * setlocal formatoptions-=r formatoptions-=o formatoptions-=l

    " always return to last position when opening a file
    autocmd BufReadPost *
    \   if line("'\"") > 1 && line("'\"") <= line("$") && &ft !~# 'commit'
    \|     exe "normal! g`\""
    \|  endif
augroup END
