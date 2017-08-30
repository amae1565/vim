"---------------------------------------------------------------------------
" Amae's .vimrc
"---------------------------------------------------------------------------

"---------------------------------------------------------------------------

" profile start profile.txt
" profile file ~/.vim/rc/*
" profile func dein#*

let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  let g:rc_dir    = expand('~/.vim/rc')
  let s:toml      = g:rc_dir . '/dein.toml'
  let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'

  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  call dein#end()
  call dein#save_state()
endif

if dein#check_install()
  call dein#install()
endif

"--------------------------------------------------------------------------------
" Emacs keybind
inoremap <C-a> <Home>
inoremap <C-e> <End>
inoremap <C-d> <Del>
inoremap <C-b> <Left>
inoremap <C-n> <Down>
inoremap <C-p> <Up>
inoremap <C-f> <Right>

nnoremap : ;
nnoremap ; :
nnoremap s <Nop>
nnoremap st :<C-u>tabnew<CR>
nnoremap sp gT
nnoremap sn gt

"----------------------------------------------------------------------------------
set nocompatible
set ttyfast
set t_Co=256
set autoread
set number
set ruler
set title
set showmatch
set encoding=utf-8
set fileencoding=utf-8
set noswapfile
set nobackup
set noundofile
set hlsearch
set cursorline
set list
set listchars=tab:>-
set clipboard=unnamed
syntax on
filetype plugin on
filetype indent on

"----------------------------------------------------------------------------------
highlight StatusLine term=none cterm=none ctermfg=grey ctermbg=black
highlight CursorLine cterm=underline ctermfg=none ctermbg=none

"----------------------------------------------------------------------------------
set tabstop=2
set expandtab
set shiftwidth=2
set softtabstop=2

set laststatus=2
set statusline=%F%r%h%=

"----------------------------------------------------------------------------------
set ignorecase
set smartcase
set wrapscan
set incsearch
set wildmenu wildmode=list:full
set completeopt=menuone

