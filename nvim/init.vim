source ~/.config/nvim/plugins.vim

syntax enable
colorscheme delek
set clipboard=unnamed

set relativenumber
set linebreak
set showbreak=+++
set textwidth=100
set showmatch
set visualbell
set hlsearch
set smartcase
set ignorecase
set incsearch
set ruler
set autoindent
set expandtab
set shiftwidth=4
set smartindent
set smarttab
set softtabstop=4
 
set backspace=indent,eol,start

inoremap jk <Esc>

" Ignore arrow keys
" nnoremap <up>    <nop>
" nnoremap <down>  <nop>
" nnoremap <left>  <nop>
" nnoremap <right> <nop>
" inoremap <up>    <nop>
" inoremap <down>  <nop>
" inoremap <left>  <nop>
" inoremap <right> <nop>

""" Plug configuration
let g:airline_powerline_fonts = 1
