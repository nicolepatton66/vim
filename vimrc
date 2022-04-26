" ~~~~~~~~~~~~~~~~~~~~~
" ~~~~~~~ vimrc ~~~~~~~
" ~~~ Nicole Patton ~~~
" ~~~~~~~~~~~~~~~~~~~~~

" requires: ctags, fzf, xmllint, sqlformat

" to snake case (normal mode): crs
" to camel case (normal mode): crc

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

" number of lines to keep above and below cursor
set scrolloff=5

" num cols to scroll horizontally
set sidescroll=1
set sidescrolloff=1

" format options
set textwidth=80
set formatoptions=c  " autowrap comments using textwidth
set formatoptions+=q " let gq format comments
set formatoptions+=1 " don't break line after 1 letter word

" completion options
set complete=.  " scan the current buffer
set complete+=b " scan other buffers
set complete+=k~/.vim/dictionary
set complete+=t " scan tags file

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
set laststatus=2             " always show statusline
set statusline=%F            " filename
set statusline+=\ %1*        " color red
set statusline+=%m           " modified flag
set statusline+=%*           " reset color (for correct bg color)
set statusline+=%=           " switch to right
let branch=gitbranch#name()
if len(branch) != 0
  set statusline+=\ %3*      " color yellow
  set statusline+=%{branch}  " git branch
  set statusline+=%*         " reset color
  set statusline+=\ \|       " add separator
end
set statusline+=\ %2*        " color green
set statusline+=%l\ of\ %L   " line of total
set statusline+=\ (%p%%)     " percentage
set statusline+=\ %c         " column number
set statusline+=%*\ "        " reset color and pad

highlight User1 ctermbg=239 ctermfg=red
highlight User2 ctermbg=239 ctermfg=green
highlight User3 ctermbg=239 ctermfg=yellow

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

" stop junk from displaying
set t_RV=

" enable matchit
runtime macros/matchit.vim

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
nnoremap <silent> <F10> :setlocal filetype=sh<cr>ggi#!/usr/bin/env bash<cr><cr><esc>

" F11 perl
nnoremap <silent> <F11> :setlocal filetype=perl<cr>ggi#!/usr/bin/env perl<cr><cr><esc>

" F12 ruby
nnoremap <silent> <F12> :setlocal filetype=ruby<cr>ggi#!/usr/bin/env ruby<cr><cr><esc>

" set mode of current file
nnoremap <silent> ,6 :!chmod 644 %<cr><cr><cr>
nnoremap <silent> ,7 :!chmod 755 %<cr><cr><cr>

" source vimrc (:e causes ft plugins to activate)
nnoremap <silent> ,v :source $MYVIMRC<cr>:e<cr>:redraw<cr>:echo 'vimrc sourced'<cr>

" flip focus and maximize split window (used with help window)
nnoremap <silent> ,m <c-w>w<c-w>_

" fzf
nnoremap <silent> ,z :GFiles<cr>
nnoremap <silent> ,Z :Files<cr>

" bufexplorer
nmap <silent> ,e \be

" taglist
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

" fugitive git commands
nnoremap <silent> ,gb :Gblame<cr>
nnoremap <silent> ,gd :Gdiff<cr>
nnoremap <silent> ,gs :Gstatus<cr>
nnoremap <silent> ,ge :Gsplit<cr>
nnoremap <silent> ,gw :Gwrite<cr>

" update gitgutter display
nnoremap <silent> ,gg :GitGutterAll<cr>:redraw<cr>

" gitgutter hunk commands
nmap <silent> ,hu <plug>GitGutterUndoHunk
nmap <silent> ,hs <plug>GitGutterStageHunk

" quote word (uses surround plugin)
nmap <silent> ,q mzysiw'`z
nmap <silent> ,Q mzysiw"`z

" flip quotes
nmap <silent> ,f mzcs"'`z
nmap <silent> ,F mzcs'"`z

" column alignment
vnoremap <silent> ,aa !align -a<cr>
nnoremap <silent> ,aa :!align -a<cr>
vnoremap <silent> ,a= !align -e<cr>
nnoremap <silent> ,a= :!align -e<cr>
vnoremap <silent> ,a, !align -c<cr>
nnoremap <silent> ,a, :!align -c<cr>

" un-align
vnoremap <silent> ,l !un_align<cr>
nnoremap <silent> ,l 1:!un_align<cr>

" un-align and smush tags
vnoremap <silent> ,L !un_align_smush_tags<cr>
nnoremap <silent> ,L 1:!un_align_smush_tags<cr>

" smush (remove all spaces)
vnoremap <silent> ,S !smush<cr>
nnoremap <silent> ,S 1:!smush<cr>

" join this line and the next
nnoremap <silent> ,j 2:j<cr>

" join an entire paragraph
nnoremap <silent> ,J vip:j<cr>jj

" expand all folds
nnoremap <silent> ,X zR

" delete whitespace
vnoremap <silent> ,ds mz:s/\%V\s*//g<cr>`z:nohlsearch<cr>

" delete given character
vnoremap <silent> ,d) mz:s/\%V)//g<cr>`z:nohlsearch<cr>
vnoremap <silent> ,d} mz:s/\%V}//g<cr>`z:nohlsearch<cr>
vnoremap <silent> ,d] mz:s/\%V\]//g<cr>`z:nohlsearch<cr>
vnoremap <silent> ,d, mz:s/\%V,//g<cr>`z:nohlsearch<cr>
vnoremap <silent> ,d: mz:s/\%V://g<cr>`z:nohlsearch<cr>
vnoremap <silent> ,d' mz:s/\%V'//g<cr>`z:nohlsearch<cr>
vnoremap <silent> ,d" mz:s/\%V"//g<cr>`z:nohlsearch<cr>

" delete whitespace before given character
vnoremap <silent> ,D) mz:s/\%V\(\s*\))/)\1/g<cr>`z:nohlsearch<cr>
vnoremap <silent> ,D} mz:s/\%V\(\s*\)}/}\1/g<cr>`z:nohlsearch<cr>
vnoremap <silent> ,D] mz:s/\%V\(\s*\)\]/\]\1/g<cr>`z:nohlsearch<cr>
vnoremap <silent> ,D, mz:s/\%V\(\s*\),/,\1/g<cr>`z:nohlsearch<cr>
vnoremap <silent> ,D: mz:s/\%V\(\s*\):/:\1/g<cr>`z:nohlsearch<cr>
vnoremap <silent> ,D' mz:s/\%V\(\s*\)'/'\1/g<cr>`z:nohlsearch<cr>
vnoremap <silent> ,D" mz:s/\%V\(\s*\)"/"\1/g<cr>`z:nohlsearch<cr>

" toggle ignorecase
nnoremap <silent> ,i :set ignorecase!<cr>:echo "ignorecase=" . &ignorecase<cr>

" spellcheck word
nnoremap <silent> ,s :!echo <cword> \| aspell -a<cr>

" turn on spell checking
nnoremap <silent> ,K :setlocal spell spelllang=en_us<cr>:echo "Spell checking on"<cr>

" search and replace word under cursor
nnoremap ,r :%s/\<<c-r><c-w>\>//gc<left><left><left>
nnoremap ,R :%s/\<<c-r><c-w>\>/<c-r><c-w>/gc<left><left><left>

" temporal marks (save/restore)
nnoremap ,us :AddTemporalMark a<cr>:echo 'Temporal mark set'<cr>
nnoremap ,ur :AddTemporalMark b<cr>:JumpToTemporalMark a<cr>:redraw<cr>:echo 'Temporal mark restored'<cr>
nnoremap ,uu :JumpToTemporalMark b<cr>:redraw<cr>:echo 'Undo last restore'<cr>

" pretty print json
nnoremap <silent> ,pj ggVG!python -mjson.tool<cr>:set filetype=json<cr>
vmap     <silent> ,pj !python -mjson.tool<cr>:set filetype=json<cr>

" pretty print xml
nnoremap <silent> ,px ggVG!xmllint --format -<cr>:set filetype=xml<cr>
vmap     <silent> ,px !xmllint --format -<cr>:set filetype=xml<cr>

" pretty print sql
nnoremap <silent> ,ps ggVG!sqlformat --reindent --keywords upper -<cr>:set filetype=sql<cr>
vmap     <silent> ,ps !sqlformat --reindent --keywords upper -<cr>:set filetype=sql<cr>

" pretty print active record results
nnoremap <silent> ,pr ggVG!record_split<cr>:set filetype=text<cr>
vmap     <silent> ,pr !record_split<cr>:set filetype=text<cr>

" pretty print encoded url parameters
nnoremap <silent> ,pu ggVG!url_split<cr>:set filetype=text<cr>
vmap     <silent> ,pu !url_split<cr>:set filetype=text<cr>

" have backspace delete
vnoremap <bs> x
nnoremap <bs> hx

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
  autocmd BufRead,BufNewFile *.csv    setlocal filetype=csv

  " set default filetype to text
  autocmd BufRead,BufNewFile * if &filetype == '' | setlocal filetype=text | endif

  " always delete trailing whitespace
  autocmd BufWrite * :call ClearEOLSpace()

  " fix netrw
  autocmd FileType netrw setlocal bufhidden=wipe

  " remove crap that somehow gets added
  autocmd FileType * setlocal formatoptions-=r formatoptions-=o formatoptions-=l

  " return to last position when opening a file
  autocmd BufReadPost *
  \   if line("'\"") > 1 && line("'\"") <= line("$") && &filetype !~# 'commit'
  \|    exe "normal! g`\""
  \|  endif
augroup END
