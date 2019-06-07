let perl_want_scope_in_variables=1
let perl_extended_vars=1
let perl_include_pod=1

setlocal list
setlocal cin
setlocal cino=:.5s=.5sc1
setlocal cinkeys=0{,0},!^F,o,O,e
setlocal iskeyword-=,

inoremap <silent> <tab> <c-r>=PerlTabWrapper()<cr>

ia ret return
ia xx #XXX
ia lb print STDERR "###################\n";#XXX
