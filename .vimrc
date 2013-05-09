call pathogen#infect()

set autoindent
set smartindent
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

set nu "show line numbers
set showcmd "show the unfinished command-mode command
set showmode "show me when Im in overtype/insert mode
set ruler "put meaningful information in the bottom line of your window
set noswapfile "no swap file
set wildmenu "magic completion at  command line

syntax on
filetype plugin indent on

" Open NERDtree if no files are specified
autocmd vimenter * if !argc() | NERDTree | endif

