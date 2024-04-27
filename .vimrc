syntax on
colo onedark
hi LineNr ctermfg=245
hi Comment ctermfg=069
set nu
set ai
set si
set ts=4 sts=4 sw=4
set expandtab
set incsearch
set hlsearch
set list
set listchars=tab:▸\ ,trail:·
set splitright
set nofixendofline

set mouse=
set laststatus=2
set statusline=[%n]\ %<%F\ %m\ \ \ \ [%R%H%W%Y][%{&ff}]\ [%3b\ 0x%2B]\ %=\ line:%l/%L\ col:%-2c\ \ \ %3p%%\ \ ")}}]]]
set cursorline
set noeol


" disable netrw in favour of nvim-tree
let g:loaded_netrw = 1
let g:loaded_netrwPlugin = 1

" leader mappings
let mapleader = "\<space>"

nmap <leader>f :Files<cr>
nmap <leader>r :Rg<cr>
nmap <leader>R :Rg<space>
nmap <leader>h :Hexmode<cr>
nmap <leader>; :set invlist<cr>
nnoremap <leader><space> :NvimTreeFindFileToggle<CR>
nnoremap <esc> :nohlsearch <CR>


" window management
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

" Reselect visual selction after indenting
vnoremap < <gv
vnoremap > >gv

" Quickly escape to Normal mode
imap jj <esc>

" extensions identified as binary files
let g:hexmode_patterns = '*.bin,*.exe,*.dat,*.o'

" go autocomplete suggestions
au filetype go inoremap <buffer> . .<C-x><C-o>

" Use new vim 8.2 popup windows for Go Doc
let g:go_doc_popup_window = 1

" disable fzf preview window
let g:fzf_vim = {}
" let g:fzf_vim.preview_window = ['hidden,right,50%,<70(up,40%)', 'ctrl-_']
let g:fzf_layout = { 'window': { 'width': 80, 'height': 0.4 } }
let g:fzf_vim.preview_window = []


" plugins
call plug#begin()
Plug 'fidian/hexmode'
Plug 'junegunn/fzf', {'do': {-> fzf#install()}}
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-commentary'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'wojciechkepka/vim-github-dark'
Plug 'tpope/vim-surround'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-tree/nvim-tree.lua'
Plug 'nvim-telescope/telescope.nvim'
call plug#end()

lua require'nvim-tree'.setup()