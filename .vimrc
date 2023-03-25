:syntax on
:set expandtab
:set tabstop=4
:set softtabstop=4
:set shiftwidth=4
:set background=dark
:set number
:set clipboard=unnamedplus
:set tabpagemax=100
"   When closing tabs, content in CLIPBOARD stays, but empties when Vim is closed.
"   Below is FIX line.
autocmd VimLeave * call system("xclip -se c -i", getreg('+'))

" \l to highlight a line
nnoremap <silent> <leader>l :call matchadd('Search', '\%'.line('.').'l')<CR>

" \L to remove highlighted line
nnoremap <silent> <leader>L :
  \for m in filter(getmatches(), { i, v -> has_key(l:v, 'pattern') && l:v.pattern is? '\%'.line('.').'l'} )
  \<BAR>           :call matchdelete(m.id)
  \<BAR> :endfor<CR>

"could be 'map <esc>[1;5D b' and 'map <esc>[1;5C w'
"set TERM=xterm is bad solution, because we are giving to vim
"wrong idea on terminal capabilities
if &term == "screen"
    map <esc>[1;5D <C-Left>
    map <esc>[1;5C <C-Right>
endif
