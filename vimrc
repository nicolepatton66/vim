" ~~~~~~~ vimrc ~~~~~~~
" ~~~ Nicole Patton ~~~
"
" TAGS:
"   Module_settings
"   Keybindings
"   Functions
"   Autocommands
"   Lang_settings
"
" ~~~~~~~~~~~~~~~~~~~~~

" do this first!
set nocompatible

" detect filetypes and auto load any plugins for them
filetype on
filetype plugin on

" encoding
set encoding=utf-8
set termencoding=utf-8

" syntax highlighting
set background=dark
set termguicolors
syntax on

" colors
let g:gruvbox_contrast_dark = 'medium'
colorscheme gruvbox

" make the background truly black
"highlight Normal ctermbg=black

" enable matchit
runtime macros/matchit.vim

" set tab width and don't use tab chars
set tabstop=8
set softtabstop=-1
set shiftwidth=4
set expandtab

" have shifts align to tabstops
set shiftround

" number of lines to keep above and below cursor (set to 999 to always center)
set scrolloff=5

" num cols to scroll horizontally (0 will center)
set sidescroll=5
set sidescrolloff=5

" sane indentation by default
set autoindent
filetype indent on

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

" allow pasting from other apps, etc
set clipboard=unnamedplus

" don't change the terminal title
set notitle

" get the backspace key to do sensible things
set backspace=indent,eol,start
vmap <BS> x
nmap <BS> hx

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
set ttymouse=xterm2

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

" don't wrap lines
set nowrap

" menu
set wildmenu
set wildmode=list:longest,full

" ruler (only used when there is no statusline)
set ruler
set rulerformat=%-32(%12(%l\ of\ %L%)\ %-6((%p%%)%)\ %-3c\ %)

" statusline
set laststatus=2
set statusline=%t\ %y%r%m%=%-32(%12(%l\ of\ %L%)\ %-6((%p%%)%)\ %-3c\ %)

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
nnoremap <silent> <F6> :call ToggleShowEOLSpacesAndTabs()<cr>

" F7 clean up file (convert tabs, etc)
nnoremap <silent> <F7> :%s/\s\+$//e<cr>ggVG=:v/./.,/./-1join<cr><c-l>gg:nohlsearch<cr>

" F8 clear eol space
nnoremap <silent> <F8> :call ClearEOLSpace()<cr>:nohlsearch<cr>

" F9 redraw screen and clear highlighting
nnoremap <silent> <F9> <c-l>:nohlsearch<cr>

" F10 bash
nnoremap <silent> <F10> :set ft=sh<cr>ggi#!/usr/bin/env bash<cr>set -e<cr><cr><esc>:!chmod 755 %<cr>

" F11 perl
nnoremap <silent> <F11> :set ft=perl<cr>ggi#!/usr/bin/env perl<cr><cr><esc>:!chmod 755 %<cr>

" F12 ruby
nnoremap <silent> <F12> :set ft=ruby<cr>ggi#!/usr/bin/env ruby<cr><cr><esc>:!chmod 755 %<cr>

" set mode of current file
nnoremap <silent> ,6 :!chmod 644 %<cr>
nnoremap <silent> ,7 :!chmod 755 %<cr>

" default comments (shell type)
setlocal comments=:#
nmap <silent> ,, !!comment_default<cr>
vmap <silent> ,, ygv!comment_default<cr>
nmap <silent> ,. :s/\(\s*\)#/\1/<cr>:call ClearEOLSpace()<cr>:nohlsearch<cr>
vmap <silent> ,. :s/#//<cr>:call ClearEOLSpace()<cr>:nohlsearch<cr>

" toggle colorcolumn
nnoremap <silent> ,c :call ToggleColorColumn()<cr>

" toggle cursorcolumn
nnoremap <silent> ,C :set cursorcolumn!<cr>

" toggle line numbers
nnoremap <silent> ,n :set number!<cr>

" column alignment (,l un-aligns)
vmap <silent> ,a !align<cr>
nmap <silent> ,a :!align<cr>
vmap <silent> ,A !align_all<cr>
nmap <silent> ,A :!align_all<cr>
vmap <silent> ,= !align_equals<cr>
nmap <silent> ,= :!align_equals<cr>
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

" underline current line
nnoremap <silent> ,u yypv$hr=
nnoremap <silent> ,U yypv$hr-

" move to top/bottom quarter of screen
nnoremap <silent> ,H M8k
nnoremap <silent> ,L M8j

" use visual blocks by default... ^v does character based
nnoremap v <c-v>
nnoremap <c-v> v

" delete in normal mode goes back to last write
nnoremap <silent> <delete> :earlier 1f<cr>

" have Y yank to eol
nnoremap Y y$

" have Q exit perl instead of enter Ex mode
noremap Q :q<cr>

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

" page up/down (shift)
noremap K <PageUp>H
noremap J <PageDown>L

" scroll screen in place (ctrl)
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
nnoremap <expr> gV "`[".getregtype(v:register)[0]."`]"

" search and replace word under cursor
nnoremap ,r :%s/\<<c-r><c-w>\>//gc<left><left><left>
nnoremap ,R :%s/\<<c-r><c-w>\>/<c-r><c-w>/gc<left><left><left>

" pretty print json
nmap <silent> ,x !!python -mjson.tool<cr>:set ft=json<cr>
vmap <silent> ,x ygv!python -mjson.tool<cr>:set ft=json<cr>

" pretty print xml
nmap <silent> ,X !!xmllint --format -<cr>:set ft=xml<cr>
vmap <silent> ,X ygv!xmllint --format -<cr>:set ft=xml<cr>

" pretty print sql
nmap <silent> ,S !!sqlformat --reindent --keywords upper -<cr>:set ft=sql<cr>
vmap <silent> ,S ygv!sqlformat --reindent --keywords upper -<cr>:set ft=sql<cr>

" pretty print active record results
nmap <silent> ,k V!record_split<cr>:set ft=text<cr>
vmap <silent> ,k !record_split<cr>:set ft=text<cr>

" decode urls
nmap <silent> ,d V!python -c "import sys, urllib as ul; print ul.unquote(sys.stdin.read());"<cr>
vmap <silent> ,d ygv!python -c "import sys, urllib as ul; print ul.unquote(sys.stdin.read());"<cr>

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

function! ShowEOLSpacesAndTabs()
    if !exists("b:list_showing")
        let b:list_showing = 1
    endif
    setlocal list
endfunction

function! ToggleShowEOLSpacesAndTabs()
    if !exists("b:list_showing")
        let b:list_showing = 0
    endif

    if b:list_showing == 0
        let b:list_showing = 1
        setlocal list
    else
        let b:list_showing = 0
        setlocal nolist
    endif
endfunction

function! ToggleMouse()
    if !exists("g:old_mouse")
        let g:old_mouse = "a"
    endif

    if &mouse == ""
        let &mouse = g:old_mouse
        echo "Mouse is for Vim"
    else
        let g:old_mouse = &mouse
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
    " Remember where we parked...
    let cursorpos = getpos('.')
    let cursorcol = cursorpos[2]
    let curr_line = getline('.')

    " Special subpattern to match only at cursor position...
    let curr_pos_pat = '\%' . cursorcol . 'c'

    " Tab as usual at the left margin...
    if curr_line =~ '^\s*' . curr_pos_pat
        return "\<tab>"
    endif

    " If no contextual match and after an identifier, do keyword completion...
    if curr_line =~ '\k' . curr_pos_pat
        return "\<c-p>"
    endif

    if curr_line =~ '\(\->\|::\)' . curr_pos_pat
        return "\<c-x>\<c-o>"
    else
        return "\<s-tab>"
    endif
endfunction

function! DeleteTrailingWS()
    exe "normal mz"
    %s/\s\+$//ge
    exe "normal `z"
endfunction

function! RubyEndToken()
    let current_line = getline( '.' )
    let braces_at_end = '{\s*\(|\(,\|\s\|\w\)*|\s*\)\?$'
    let stuff_without_do = '^\s*\(class\|if\|unless\|begin\|case\|for\|module\|while\|until\|def\)'
    let with_do = 'do\s*\(|\(,\|\s\|\w\)*|\s*\)\?$'

    if match(current_line, braces_at_end) >= 0
        return "\<CR>}\<C-O>O"
    elseif match(current_line, stuff_without_do) >= 0
        return "\<CR>end\<C-O>O"
    elseif match(current_line, with_do) >= 0
        return "\<CR>end\<C-O>O"
    else
        return "\<CR>"
    endif
endfunction

" Autocommands --------------------------------------------

augroup custom
    autocmd!

    autocmd BufRead,BufNewFile *.coffee        setlocal ft=coffee
    autocmd BufRead,BufNewFile *.slim          setlocal ft=slim
    autocmd BufRead,BufNewFile *.hs            setlocal ft=xml
    autocmd BufRead,BufNewFile *.tt            setlocal ft=html
    autocmd BufRead,BufNewFile *.tt2           setlocal ft=html
    autocmd BufRead,BufNewFile *.json          setlocal ft=json
    autocmd BufRead,BufNewFile .bash_functions setlocal ft=sh
    autocmd BufRead,BufNewFile .erdconfig      setlocal ft=yaml

    autocmd BufRead,BufNewFile * if &filetype == "" | setlocal ft=text | endif

    autocmd FileType asm        call Asm_settings()
    autocmd FileType c          call C_settings()
    autocmd FileType coffee     call Coffee_settings()
    autocmd FileType cpp        call Cpp_settings()
    autocmd FileType eruby      call ERuby_settings()
    autocmd FileType html       call Html_settings()
    autocmd FileType java       call Java_settings()
    autocmd FileType javascript call Javascript_settings()
    autocmd FileType json       call Json_settings()
    autocmd FileType make       call Make_settings()
    autocmd FileType perl       call Perl_settings()
    autocmd FileType ruby       call Ruby_settings()
    autocmd FileType scss       call Scss_settings()
    autocmd FileType slim       call Slim_settings()
    autocmd FileType sql        call Sql_settings()
    autocmd FileType text       call Text_settings()
    autocmd FileType vim        call Vim_settings()
    autocmd FileType xhtml      call Html_settings()
    autocmd FileType xml        call Html_settings()
    autocmd FileType yaml       call Yaml_settings()

    " remove crap that somehow gets added
    autocmd FileType * setlocal formatoptions-=r formatoptions-=o formatoptions-=l

    autocmd BufWrite *.java   :call DeleteTrailingWS()
    autocmd BufWrite *.js     :call DeleteTrailingWS()
    autocmd BufWrite *.pm     :call DeleteTrailingWS()
    autocmd BufWrite *.pl     :call DeleteTrailingWS()
    autocmd BufWrite *.rb     :call DeleteTrailingWS()
    autocmd BufWrite *.erb    :call DeleteTrailingWS()
    autocmd BufWrite *.slim   :call DeleteTrailingWS()
    autocmd BufWrite *.yml    :call DeleteTrailingWS()
    autocmd BufWrite *.coffee :call DeleteTrailingWS()

    " make sure mouse is left in a sane state
    autocmd VimLeavePre * set ttymouse=xterm

    " always return to last position when opening a file
    autocmd BufReadPost *
    \   if line("'\"") > 1 && line("'\"") <= line("$")
    \|     exe "normal! g`\""
    \|  endif
augroup END

" Lang_settings -------------------------------------------

function! Ruby_settings()
    call ShowEOLSpacesAndTabs()

    setlocal shiftwidth=2

    " create closing tokens (complete block)
    imap <buffer> <cr> <c-r>=RubyEndToken()<cr>

    ia lb puts "============================================="
endfunction

function! ERuby_settings()
    call ShowEOLSpacesAndTabs()
    call CommentHtml()

    setlocal shiftwidth=2
endfunction

function! Html_settings()
    call ShowEOLSpacesAndTabs()
    call CommentHtml()

    setlocal shiftwidth=2
endfunction

function! Scss_settings()
    setlocal shiftwidth=2
endfunction

function! Coffee_settings()
    setlocal cursorcolumn
    setlocal shiftwidth=2
endfunction

function! Slim_settings()
    call CommentSlim()

    setlocal cursorcolumn
    setlocal shiftwidth=2
endfunction

function! Yaml_settings()
    setlocal shiftwidth=2
endfunction

function! Perl_settings()
    call ShowEOLSpacesAndTabs()

    setlocal cin
    setlocal cino=:.5s=.5sc1
    setlocal cinkeys=0{,0},!^F,o,O,e
    setlocal iskeyword-=,

    let perl_want_scope_in_variables=1
    let perl_extended_vars=1
    let perl_include_pod=1

    inoremap <silent> <tab> <c-r>=PerlTabWrapper()<cr>

    vmap <silent> ,p !expand_params<cr>
    nmap <silent> ,p 1:!expand_params<cr>
    vmap <silent> ,P !collapse_params<cr>
    nmap <silent> ,P :!collapse_params<cr>

    ia ret return
    ia xx #XXX
    ia lb print STDERR "###################\n";#XXX
endfunction

function! Javascript_settings()
    call CommentForwardSlashes()
    call WrapLineInBraces()

    setlocal shiftwidth=2
endfunction

function! Java_settings()
    let java_allow_cpp_keywords=1

    call ShowEOLSpacesAndTabs()
    call CommentForwardSlashes()
    call WrapLineInBraces()

    setlocal cin
    setlocal cino=:.5s=.5sc1

    syn keyword javaTodo contained XXX DEBUG NOTICE WARNING TAG TODO FIXME HARDCODE DATABASE

    inoremap <silent> <tab> <c-r>=JavaTabWrapper()<cr>

    nnoremap dm /}<cr>[m?^\(\s*$\\|{\)<cr>jV]m%d
    nnoremap ym /}<cr>[m?^\(\s*$\\|{\)<cr>jV]m%y
endfunction

function! Asm_settings()
    setlocal shiftwidth=8
endfunction

function! C_settings()
    call ShowEOLSpacesAndTabs()
    call CommentForwardSlashes()

    setlocal cin
    setlocal cino=:.5s=.5sc1
endfunction

function! Cpp_settings()
    call ShowEOLSpacesAndTabs()
    call CommentForwardSlashes()

    setlocal cin
    setlocal cino=:.5s=.5sc1
endfunction

function! Json_settings()
    " hide double quotes or not
    let g:vim_json_syntax_conceal = 0

    setlocal formatoptions=tcq2l
    setlocal shiftwidth=2
endfunction

function! Make_settings()
    setlocal noexpandtab
endfunction

function! Sql_settings()
    call CommentSql()
endfunction

function! Text_settings()
    setlocal nosmartindent
    setlocal formatoptions=tc1
endfunction

function! Vim_settings()
    call CommentVim()

    " open help for word under cursor
    nnoremap <silent> ,h :help <c-r><c-w><cr>
endfunction
