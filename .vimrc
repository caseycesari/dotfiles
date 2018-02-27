set shell=/bin/bash

""" Vundle setup
" source: https://github.com/gmarik/Vundle.vim
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" install Vundle bundles
if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif

call vundle#end()            " required
filetype plugin indent on    " required

""" Config
" source: https://github.com/square/maximum-awesome/blob/master/vimrc
" with modifications
syntax enable
set autoindent
set autoread                                                 " reload files when changed on disk, i.e. via `git checkout`
set backspace=2                                              " Fix broken backspace in some setups
set backupcopy=yes                                           " see :help crontab
set clipboard=unnamed                                        " yank and paste with the system clipboard
set directory-=.                                             " don't store swapfiles in the current directory
set encoding=utf-8
set expandtab                                                " expand tabs to spaces
set ignorecase                                               " case-insensitive search
set incsearch                                                " search as you type"
set laststatus=2                                             " always show statusline
set list                                                     " show trailing whitespace
set listchars=tab:▸\ ,trail:▫
set number                                                   " show line numbers
set ruler                                                    " show where you are
set scrolloff=3                                              " show context above/below cursorline
set shiftwidth=4                                             " normal mode indentation commands use 2 spaces
set showcmd
set smartcase                                                " case-sensitive search if any caps
set softtabstop=4                                            " insert mode tab and backspace use 2 spaces
set tabstop=8                                                " actual tabs occupy 8 characters
set wildignore=log/**,node_modules/**,target/**,tmp/**,*.rbc
set wildmenu                                                 " show a navigable menu for tab completion
set wildmode=longest,list,full
set nocursorline                                             " don't highlight current line
inoremap jj <ESC>

" Enable basic mouse behavior such as resizing buffers.
set mouse=a
if exists('$TMUX')  " Support resizing in tmux
  set ttymouse=xterm2
endif

" plugin settings
let g:ctrlp_match_window = 'order:ttb,max:20'
let g:NERDSpaceDelims=1
let g:gitgutter_enabled = 1

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  let g:ackprg = 'ag --nogroup --column'

  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

" fdoc is yaml
autocmd BufRead,BufNewFile *.fdoc set filetype=yaml
" md is markdown
autocmd BufRead,BufNewFile *.md set filetype=markdown
" automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =

" filetype spacing settings
autocmd Filetype html setlocal ts=2 sts=2 sw=2 expandtab
autocmd Filetype ruby setlocal ts=2 sts=2 sw=2 expandtab
autocmd Filetype javascript setlocal ts=4 sts=4 sw=4 expandtab
autocmd Filetype python setlocal ts=4 sts=4 sw=4 expandtab
autocmd Filetype scss setlocal ts=2 sts=2 sw=2 expandtab
autocmd Filetype xml setlocal ts=4 sts=4 sw=4 expandtab
autocmd Filetype typescript setlocal ts=2 sts=2 sw=2 expandtab

" Fix Cursor in TMUX
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

""" Font
set anti enc=utf-8
set guifont=Source\ Code\ Pro:h17

""" Theme
set background=dark
colorscheme tomorrow-night-bright

""" No bells
set noerrorbells
set novisualbell
set t_vb=
autocmd! GUIEnter * set vb t_vb=

""" Ctrl+p config
let g:ctrlp_show_hidden=1
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/dist/*,*/.vagrant/*
let g:ctrlp_custom_ignore = 'node_modules'  " Ignore node_modules folder

""" Syntastic
" source: https://gist.github.com/mmcfarland/5506869
let g:syntastic_python_checkers=['flake8']
let g:syntastic_javascript_checkers=['eslint']
let g:syntastic_typescript_checkers=['tslint']
au BufRead,BufNewFile *.json set filetype=json
let g:syntastic_json_checkers=['jsonlint']
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='>'
let g:syntastic_auto_loc_list=1
let g:syntastic_loc_list_height=4
map <F2> :SyntasticToggleMode<CR>

""" Ag
let g:ackprg = 'ag --nogroup --nocolor --column'
set shellpipe=>  " Prevent search results from appearing in terminal
" let g:ack_autoclose=1  " Close results window
let g:ackhighlight = 1  " Highlight search term in results window
