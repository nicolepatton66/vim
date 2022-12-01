setlocal list
setlocal shiftwidth=2

" convert a string to/from a ruby symbol
nmap <silent> ,y cs"'ds'i:<esc>
nmap <silent> ,Y F:xysiw'

nmap <silent> ,b mz$?^\s*def <cr>0/ef \(self.\)\?/e<cr>wyiw`zoputs "============================================="<esc>i <esc>pl:nohlsearch<cr>
nmap <silent> ,B mz$?^\s*def <cr>0/ef \(self.\)\?/e<cr>wyiw`zoputs "                ============================="<esc>i <esc>pl:nohlsearch<cr>

" copy current method (Get Function)
nmap <silent> ,gf mz$?^\s*def <cr>$^V%y`z:nohlsearch<cr>

ia lb puts "============================================="
ia lbs puts "                ============================="
ia ret return
