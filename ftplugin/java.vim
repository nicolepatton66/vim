let java_allow_cpp_keywords=1

call CommentForwardSlashes()
call WrapLineInBraces()

setlocal list
setlocal cin
setlocal cino=:.5s=.5sc1

syn keyword javaTodo contained XXX DEBUG NOTICE WARNING TAG TODO FIXME HARDCODE DATABASE

nnoremap <buffer><silent> dm /}<cr>[m?^\(\s*$\\|{\)<cr>jV]m%d
nnoremap <buffer><silent> ym /}<cr>[m?^\(\s*$\\|{\)<cr>jV]m%y
