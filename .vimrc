set nu
syntax on
colo desert
filetype plugin indent on
set laststatus=2
colorscheme slate 
set bs=2
set sw=4 
set sts=4
set ts=4 
set expandtab 
"autocmd BufNewFile *.py setl sts=2 ts=2 sw=2 expandtab
inoremap kj <ESC>

highlight StatusLine ctermfg=gray ctermbg=black
function! GitBranch()
  let branch = system("git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* //'")
  if branch != ''
    return ' [Git: ' . substitute(branch, '\n', '', 'g').']'
  en  
  return ''
endfunction
 
" minimal status line, only shows git branch
"set statusline=%{GitBranch()}
set statusline=[%n]\ %<%F\ %m\ \ \ \ [%R%H%W%Y][%{&ff}]\ \ %=\ line:%l/%L\ col:%-2c\ \ \ %3p%%\ \ \ @%{strftime(\"%H:%M:%S\")}"")}}]]]
"autocmd vimenter * NERDTree
