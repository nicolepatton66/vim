" ~~~~~~~~~~~~~~~~~~~~~
" ~~~~~~~ vimrc ~~~~~~~
" ~~~ Nicole Patton ~~~
" ~~~~~~~~~~~~~~~~~~~~~

" requires: ctags, fzf, ag, xmllint, sqlformat

" do this first!
set nocompatible

" encoding
set encoding=utf-8
set termencoding=utf-8

" detect filetypes and auto load any plugins for them
filetype on
filetype plugin on

" enable indentation
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

" number of lines to keep above and below cursor
set scrolloff=5

" num cols to scroll horizontally
set sidescroll=5
set sidescrolloff=5

" c = autowrap comments using textwidth
" q = let gq format comments
" 1 = don't break line after 1 letter word
set textwidth=80
set formatoptions=cq1

" . = scan the current buffer ('wrapscan' is ignored)
" b = scan other loaded buffers that are in the buffer list
" t = scan tags file
set complete=.,b,t
set complete+=k~/.vim/dictionary

" write file when putting vim to sleep
set autowrite

" auto load changes
set autoread

" don't leave backup or swap files all over the place
set nobackup
set nowritebackup
set noswapfile

" get the backspace key to do sensible things
set backspace=indent,eol,start
vnoremap <bs> x
nnoremap <bs> hx

" don't read dot files in current dir!
set noexrc

" maximize help window (see ,m below)
set helpheight=99

" searching: hightlight matches, dynamically show match
set hlsearch
set incsearch

" don't add 2 spaces after punctuation when using join cmd
set nojoinspaces

" don't redraw while executing macros
set lazyredraw

" let messages stream by without pausing
set nomore

" use the mouse if possible (scrolling!)
set mouse=a

" keep msgs abbreviated and short
set shortmess=atT

" display commands and other useful stuff
set showcmd

" what sort of eol's to use (priority list)
set fileformats=unix,dos

" milliseconds before command is cancelled
set timeoutlen=2000
set ttimeoutlen=2000

" make sure syntax highlighting works for very long files
set redrawtime=10000

" how much ex command history to keep
set history=50

" keep the viminfo file under control
set viminfo='20,\"50,n~/.viminfo

" auto ignore these when tabbing through file names
set suffixes=.bak,~,.swp,.o,.info,.aux,.dvi,.out,.class

" don't wrap lines by default
set nowrap

" indicate beginning of a wrapped line
set showbreak=↳

" set list on by default, and customize characters used
set list
set listchars=tab:»»,trail:·,precedes:←,extends:→,nbsp:˽

" menu
set wildmenu
set wildmode=list:longest,full

" statusline
set laststatus=2
set statusline=%F\ %m%=%12(%l\ of\ %L%)\ (%p%%)\ %-3c\ %-5([%n/%{len(filter(range(1,bufnr('$')),'buflisted(v:val)'))}]%)

" don't close buffers: hide them (allow opening new files with unsaved changes, etc)
set hidden

" allow visual blocks to go past eol, etc
set virtualedit=block

" how many changes can we undo
set undolevels=100

" use system clipboard for cut and paste
set clipboard=unnamed

" persistent undo
set undofile
set undodir=~/.vim/undofiles

" use hidden tags file
set tags=./tags,tags,./.tags,.tags;

" enable fzf
if has('macunix')
  set rtp+=/usr/local/opt/fzf
else
  set rtp+=~/.fzf
endif

" Module settings -----------------------------------------

" netrw
let g:netrw_banner = 0
let g:netrw_fastbrowse = 0

" bufexplorer
let g:bufExplorerSortBy = 'number'
let g:bufExplorerSplitOutPathName = 1
let g:bufExplorerDefaultHelp = 1

" taglist (requires ctags)
let Tlist_Inc_Winwidth = 0
let Tlist_WinWidth = 50
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Close_On_Select = 1
let Tlist_Exit_OnlyWindow = 1
let Tlist_Show_One_File = 1
let Tlist_Sort_Type = 'name'
let Tlist_Enable_Fold_Column = 0

" closetag
let g:closetag_filetypes = 'html,xhtml,eruby,xml'

" gitgutter
set updatetime=100

" nerdcommenter
let g:NERDDefaultAlign = 'left'
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1

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

" F6 toggle list
nnoremap <silent> <F6> :setlocal list!<cr>:set list?<cr>

" F7 toggle wrap
nnoremap <silent> <F7> :setlocal wrap!<cr>:set wrap?<cr>

" F8 clear eol space
nnoremap <silent> <F8> :call ClearEOLSpace()<cr>:nohlsearch<cr>

" F9 redraw screen and clear highlighting
nnoremap <silent> <F9> :redraw!<cr>:nohlsearch<cr>

" F10 bash
nnoremap <silent> <F10> :setlocal filetype=sh<cr>ggi#!/usr/bin/env bash<cr>set -e<cr><cr><esc>

" F11 perl
nnoremap <silent> <F11> :setlocal filetype=perl<cr>ggi#!/usr/bin/env perl<cr><cr><esc>

" F12 ruby
nnoremap <silent> <F12> :setlocal filetype=ruby<cr>ggi#!/usr/bin/env ruby<cr><cr><esc>

" set mode of current file
nnoremap <silent> ,6 :!chmod 644 %<cr><cr><cr>
nnoremap <silent> ,7 :!chmod 755 %<cr><cr><cr>

" call bufexplorer
nmap <silent> ,e \be

" toggle taglist
nnoremap <silent> ,t :TlistToggle<cr>

" commenting
nmap <silent> ,, <plug>NERDCommenterYank
vmap <silent> ,, <plug>NERDCommenterYank
nmap <silent> ,. <plug>NERDCommenterUncomment
vmap <silent> ,. <plug>NERDCommenterUncomment

" toggle colorcolumn (line at column 80)
nnoremap <silent> ,c :call ToggleColorColumn()<cr>

" toggle cursorcolumn and cursorline (lines at cursor)
nnoremap <silent> ,C :setlocal cursorcolumn!<cr>:setlocal cursorline!<cr>

" toggle line numbers
nnoremap <silent> ,n :setlocal number!<cr>

" update gitgutter display
nnoremap <silent> ,gg :GitGutterAll<cr>:redraw<cr>

" gitgutter hunk commands
nmap <silent> ,hu <plug>GitGutterUndoHunk
nmap <silent> ,hs <plug>GitGutterStageHunk

" fugitive git commands
nnoremap <silent> ,gb :Gblame<cr>
nnoremap <silent> ,gd :Gdiff<cr>
nnoremap <silent> ,gs :Gstatus<cr>
nnoremap <silent> ,ge :Gsplit<cr>
nnoremap <silent> ,gw :Gwrite<cr>

" simple quotes (uses surround plugin)
nmap <silent> ,q mzysiw'`z
nmap <silent> ,Q mzysiw"`z
nmap <silent> ,f mzcs"'`z
nmap <silent> ,F mzcs'"`z

" fzf commands
nnoremap <silent> ,ff :GFiles<cr>
nnoremap <silent> ,fl :BLines<cr>
nnoremap <silent> ,fc :BCommits!<cr>
nnoremap <silent> ,fa :Ag <c-r><c-w><cr>

" source vimrc (:e causes ft plugins to activate)
nnoremap <silent> ,v :source $MYVIMRC<cr>:e<cr>:redraw<cr>:echo 'vimrc sourced'<cr>

" column alignment
vnoremap <silent> ,a !align<cr>
nnoremap <silent> ,a :!align<cr>
vnoremap <silent> ,A !align_all<cr>
nnoremap <silent> ,A :!align_all<cr>
vnoremap <silent> ,= !align_equals<cr>
nnoremap <silent> ,= :!align_equals<cr>

" un-align
vnoremap <silent> ,l !un_align<cr>
nnoremap <silent> ,l 1:!un_align<cr>

" smush (remove all spaces)
vnoremap <silent> ,S !smush<cr>
nnoremap <silent> ,S 1:!smush<cr>

" join this line and the next
nnoremap <silent> ,j 2:j<cr>

" join an entire paragraph
nnoremap <silent> ,J vip:j<cr>jj

" toggle ignorecase
nnoremap <silent> ,i :set ignorecase!<cr>:echo "ignorecase=" . &ignorecase<cr>

" flip focus and maximize split window (used with help window)
nnoremap <silent> ,m <c-w>w<c-w>_

" spellcheck word
nnoremap <silent> ,s :!echo <cword> \| aspell -a<cr>

" search and replace word under cursor
nnoremap ,r :%s/\<<c-r><c-w>\>//gc<left><left><left>
nnoremap ,R :%s/\<<c-r><c-w>\>/<c-r><c-w>/gc<left><left><left>

" pretty print json
nnoremap <silent> ,pj !!python -mjson.tool<cr>:set filetype=json<cr>
vmap     <silent> ,pj ,j,pj

" pretty print xml
nnoremap <silent> ,px !!xmllint --format -<cr>:set filetype=xml<cr>
vmap     <silent> ,px ,j,px

" pretty print sql
nnoremap <silent> ,ps !!sqlformat --reindent --keywords upper -<cr>:set filetype=sql<cr>
vmap     <silent> ,ps ,j,ps

" pretty print active record results
nnoremap <silent> ,pr !!record_split<cr>:set filetype=text<cr>

" pretty print encoded url parameters
nnoremap <silent> ,pu !!url_split<cr>:set filetype=text<cr>

" use visual blocks by default... ^v does character based
nnoremap v <c-v>
nnoremap <c-v> v

" have Y yank to eol
nnoremap Y y$

" have Q do nothing
noremap Q <nop>

" have & remember flags and be global
nnoremap & :%&&<cr>

" have return key insert blank line
nnoremap <return> o<esc>

" have space page down
noremap <space> <pagedown>L

" have tab indent a visual selection
vnoremap <tab>   >gv
vnoremap <s-tab> <gv

" use tab to switch buffers
nnoremap <silent> <tab>   :bn<cr>
nnoremap <silent> <s-tab> :bp<cr>

" move to top/bottom quarter of screen
nnoremap <silent> ,H M8k
nnoremap <silent> ,L M8j

" move display-wise
nnoremap <silent> j gj
nnoremap <silent> k gk

" page up/down
noremap K <pageup>H
noremap J <pagedown>L

" scroll screen in place
noremap <c-k> <c-y>k
noremap <c-j> <c-e>j

" navigate splits
noremap <leader>k <c-w>k
noremap <leader>j <c-w>j
noremap <leader>h <c-w>h
noremap <leader>l <c-w>l

" center these in searches
nnoremap n nzz
nnoremap `` ``zz

" select pasted text
nnoremap gV `[v`]

" Functions -----------------------------------------------

function! WrapLineInBraces()
  nnoremap <buffer><silent> ,w :normal! kA {<esc>jo}<esc>k==
  nnoremap <buffer><silent> ,W :normal! k$hDjjddk<cr>==
endfunction

function! ClearEOLSpace()
  normal m`
  %s/\s\+$//e
  normal ``
endfunction

function! ToggleMouse()
  if &mouse == ''
    let &mouse='a'
    echo 'Mouse is for Vim'
  else
    let &mouse=''
    echo 'Mouse is for terminal'
  endif
endfunction

function! ToggleColorColumn()
  if &colorcolumn == ''
    setlocal colorcolumn=80
  else
    setlocal colorcolumn=
  endif
endfunction

" Autocommands --------------------------------------------

augroup custom
  autocmd!

  autocmd BufRead,BufNewFile *.coffee setlocal filetype=coffee
  autocmd BufRead,BufNewFile *.slim   setlocal filetype=slim
  autocmd BufRead,BufNewFile *.hs     setlocal filetype=xml
  autocmd BufRead,BufNewFile *.tt     setlocal filetype=html
  autocmd BufRead,BufNewFile *.tt2    setlocal filetype=html
  autocmd BufRead,BufNewFile *.json   setlocal filetype=json

  " set default filetype to text
  autocmd BufRead,BufNewFile * if &filetype == '' | setlocal filetype=text | endif

  " always delete trailing whitespace
  autocmd BufWrite * :call ClearEOLSpace()

  " fix netrw
  autocmd FileType netrw setl bufhidden=wipe

  " remove crap that somehow gets added
  autocmd FileType * setlocal formatoptions-=r formatoptions-=o formatoptions-=l

  " always return to last position when opening a file
  autocmd BufReadPost *
  \   if line("'\"") > 1 && line("'\"") <= line("$") && &filetype !~# 'commit'
  \|    exe "normal! g`\""
  \|  endif
augroup END
