setlocal list
setlocal shiftwidth=2

" convert a string to/from a ruby symbol
nmap <silent> ,y cs"'ds'i:<esc>
nmap <silent> ,Y F:xysiw'

nmap <silent> ,b 0/ef \(self.\)\?/e<cr>wyiwoputs "============================================="<esc>i <esc>pl:nohlsearch<cr>
nmap <silent> ,B 0/ef \(self.\)\?/e<cr>wyiwoputs "                ============================="<esc>i <esc>pl:nohlsearch<cr>

ia lb puts "============================================="
ia lbs puts "                ============================="
ia ret return
