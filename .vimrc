syntax on
set title
filetype plugin indent on
set tabstop=8
set softtabstop=8
set shiftwidth=8
set noexpandtab

au BufNewFile,BufRead *.py
\ setlocal tabstop=4 |
\ set softtabstop=4 |
\ set shiftwidth=4 |
\ set textwidth=79 |
\ set expandtab   |
\ set autoindent  |
\ set fileformat=unix 

au BufNewFile,BufRead *.c
\ setlocal  tabstop=8 |
\ setlocal  shiftwidth=8 |
\ setlocal  softtabstop=8 |
\ setlocal  textwidth=80 |
\ setlocal  noexpandtab |
\ setlocal  cindent 





"code style
"let &colorcolumn=join(range(81,999),",")

highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/

set modeline


if exists('+colorcolumn')
  set colorcolumn=80
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif
