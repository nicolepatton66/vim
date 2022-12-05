setlocal list
setlocal shiftwidth=2

nmap <silent> ,, mzO<% if false # XXX %><esc>jo<% end # XXX %><esc>`z0w:nohlsearch<cr>
vmap <silent> ,, mzy`<O<% if false # XXX %><esc>`>o<% end # XXX %><esc>`z0w:nohlsearch<cr>

nmap <silent> ,. mzkddjdd`z0w:nohlsearch<cr>
vmap <silent> ,. mzy`<kdd`>jdd`z0w:nohlsearch<cr>
