" Note: Skip initialization for vim-tiny or vim-small.
if !1 | finish | endif

  if has('vim_starting')
    if &compatible
      set nocompatible               " Be iMproved
    endif

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'
"
" My Bundles here:
" Refer to |:NeoBundle-examples|.
" Note: You don't set neobundle setting in .gvimrc!
" call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

" NeoBundle 'YankRing.vim'
NeoBundle 'mbbill/undotree'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'davidhalter/jedi-vim'
NeoBundle 'kevinw/pyflakes-vim'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'toyamarinyon/vim-swift'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'thinca/vim-qfreplace'
NeoBundle 'alfredodeza/pytest.vim'
"" colorscheme
NeoBundle 'jpo/vim-railscasts-theme'
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'tomasr/molokai'
NeoBundle 'crusoexia/vim-monokai'
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'vim-scripts/Zenburn'
NeoBundle 'cocopon/iceberg.vim'
NeoBundle 'vim-scripts/darktango.vim'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'mhartington/oceanic-next'
NeoBundle 'AlessandroYorba/Alduin'

NeoBundle 'fatih/vim-go'
NeoBundle 'bling/vim-airline'
NeoBundle 'elzr/vim-json'
NeoBundle 'derekwyatt/vim-scala'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'nefo-mi/nyan-modoki.vim'
NeoBundleLazy 'jelera/vim-javascript-syntax', {'autoload':{'filetypes':['javascript']}}
"" Glench/Vim-Jinja2-Syntax
NeoBundle 'Glench/Vim-Jinja2-Syntax'
"" Vim養成ギプス
"" NeoBundle 'modsound/gips-vim.git'
NeoBundle 'Yggdroot/indentLine'
" find強化
NeoBundle "rhysd/clever-f.vim"
" vimproc {{{
NeoBundle 'Shougo/vimproc', {
\    'build' : {
\        'mac'  : 'make -f make_mac.mak',
\        'unix' : 'make -f make_unix.mak',},}
" WakaTime
" NeoBundle 'wakatime/vim-wakatime'
" Codic
NeoBundle 'koron/codic-vim'
call neobundle#end()
let g:flake8_builtins="_,apply"
let g:flake8_ignore="E4"
let g:flake8_max_line_length=120
let g:flake8_max_complexity=10
" let g:flake8_cmd="/opt/python/bin/flake8"

" vim-flake8
" https://github.com/nvie/vim-flake8
NeoBundleLazy "nvie/vim-flake8", {
      \ "autoload": {
      \   "filetypes": ["python", "python3", "djangohtml"]
      \ }}
" autocmd BufWritePost *.py call Flake8()

"" unite
let g:unite_enable_start_insert=1
let g:unite_source_history_yank_enable =1
let g:unite_source_file_mru_limit = 200
nnoremap <silent> ,uy :<C-u>Unite history/yank<CR>
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
nnoremap <silent> ,uu :<C-u>Unite file_mru buffer<CR>
""

"" jedi-vim
let g:jedi#auto_initialization = 1
let g:jedi#rename_command = "<leader>R"
let g:jedi#popup_on_dot = 1
"autocmd FileType python let b:did_ftplugin = 1
""

"" pyflakes-vim
let g:pyflakes_use_quickfix = 0

"" vim-fugitive
""

"" neocomplcache
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : ''
        \ }
         " Plugin key-mappings.
         inoremap <expr><C-g>     neocomplcache#undo_completion()
         inoremap <expr><C-l>     neocomplcache#complete_common_string()

         " Recommended key-mappings.
         " <CR>: close popup and save indent.
         inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
         function! s:my_cr_function()
           return neocomplcache#smart_close_popup() . "\<CR>"
           endfunction
           " <TAB>: completion.
           inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
           " <C-h>, <BS>: close popup and delete backword char.
           inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
           inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
           inoremap <expr><C-y>  neocomplcache#close_popup()
           inoremap <expr><C-e>  neocomplcache#cancel_popup()
""

"" VimFiler
"NeoBundle 'Shougo/vimfiler'
"NeoBundle 'vim-scripts/netrw.vim'
"" Vim起動時にFilerも幅30で開く
""autocmd VimEnter * VimFiler -split -simple -winwidth=30 -no-quit
"" :e . で開く
"let g:vimfiler_as_default_explorer = 1
"" セーフモードOFF
"let g:vimfiler_safe_mode_by_default=0
"" netrwは常にtree view
"let g:netrw_liststyle = 3
"
"" NERD Tree
let g:NERDTreeDirArrows = 1
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

"現在開いているバッファのディレクトリを開く
"nnoremap <silent> <Leader>fe :<C-u>VimFilerBufferDir -quit<CR>
" 現在開いているバッファをIDE風に開く
"nnoremap <silent> <Leader>fi :<C-u>VimFilerBufferDir -split -simple -winwidth=35 -no-quit<CR>

"" vim-swift
""

"" vim-quickrun
"vertical split.
let g:quickrun_config={'*': {'split': ''}}
let g:quickrun_config['python.pytest'] = {
      \'command': 'py.test',
      \'cmdopt': '-s -v',
      \'hook/shebang/enable': 0,
      \}
autocmd BufRead,BufNewFile test*.py set filetype=python.pytest
set splitbelow
"<C-l> command is Quickrun.
nnoremap <silent> <C-l> :QuickRun<CR> 
""

"" neosnippet
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ? 
\ "\<Plug>(neosnippet_expand_or_jump)" 
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ? 
\ "\<Plug>(neosnippet_expand_or_jump)" 
\: "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

"" vim-qfreplace 

"" pytest.vim

" カラースキーマを設定
" 気に入らないところを修正
" autocmd ColorScheme * highlight String ctermfg=008 guifg=#ff0000
"autocmd ColorScheme * highlight Function ctermfg=147 guifg=#ff0000
"autocmd ColorScheme * highlight Exception ctermfg=166 guifg=#ff0000
"autocmd ColorScheme * highlight Include ctermfg=74 guifg=#ff0000
"autocmd ColorScheme * highlight Comment ctermfg=242 guifg=#00ff11
"autocmd ColorScheme * highlight Statement ctermfg=74 guifg=#0000ff
"autocmd ColorScheme * highlight pythonOperator ctermfg=4 guifg=#0000ff

"" 行番号の色を変更
" autocmd ColorScheme * highlight LineNr ctermfg=138

let g:rehash256 = 1
set background=dark
colorscheme alduin
" colorscheme iceberg


"" airline
let g:airline_section_a = airline#section#create(['mode','','branch'])
let g:airline#extensions#tabline#enabled = 1
ret g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#fnamemod = ':t'

let g:Powerline_symbols = 'fancy'
let g:airline_theme = 'raven'
let g:airline_right_sep = '◀'
let g:airline_left_sep = '▶'
let g:airline_linecolumn_prefix = '⭡'
let g:airline_branch_prefix = '⭠ '
let g:airline#extensions#readonly#symbol = '⭤ '
let g:airline#extensions#tabline#left_sep = '▶'
let g:airline#extensions#tabline#left_alt_sep = '▶'

"" vim-json

"" vim-scala

"" にゃんもどき
set laststatus=2
set statusline=%{g:NyanModoki()}
let g:nyan_modoki_select_cat_face_number = 2 
let g:nayn_modoki_animation_enabled= 1

"" syntastic
let g:syntastic_mode_map = { 'mode': 'active',
                           \ 'active_filetypes': ['ruby', 'javascript', 'shellscript', 'php'],
                           \ 'passive_filetypes': ['python', 'html'] }


"" Indent Guides
let g:indentLine_faster = 1
nmap <silent><Leader>i :<C-u>IndentLinesToggle<CR>

au BufNewFile,BufRead  *.j2,*.jinja2,*.jinja setf jinja

"NeoBundle 'nathanaelkane/vim-indent-guides'
"
"let g:indent_guides_enable_on_vim_startup=1
"let g:indent_guides_start_level=2
"let g:indent_guides_auto_colors=1
"autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=235
"autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=234
"let g:indent_guides_color_change_percent = 30
"let g:indent_guides_guide_size = 1

"""

"}}}
"" vim-quickrun {{{
"NeoBundle 'thinca/vim-quickrun'
"nnoremap <Leader>r :QuickRun<CR>
"let g:quickrun_config = {
"\    '_' : {
"\        'hook/close_buffer/enable_failure':    1,
"\        'hook/close_buffer/enable_empty_data': 1,
"\        'runner':                              'vimproc',
"\        'runner/vimproc/updatetime':           60,
"\        'outputter':                           'multi:buffer:quickfix',
"\        'outputter/buffer/split':              ':botright',
"\        'outputter/buffer/close_on_empty':     1,},
"\    'watchdogs_checker/_' : {
"\        'hook/close_quickfix/enable_exit':           1,
"\        'hook/back_window/enable_exit':              0,
"\        'hook/back_window/priority_exit':            1,
"\        'hook/quickfix_status_enable/enable_exit':   1,
"\        'hook/quickfix_status_enable/priority_exit': 2,
"\        'hook/qfsigns_update/enable_exit':           1,
"\        'hook/qfsigns_update/priority_exit':         3,
"\        'hook/qfstatusline_update/enable_exit':      1,
"\        'hook/qfstatusline_update/priority_exit':    4,},
"\    'watchdogs_checker/php' : {
"\        'command':     'php',
"\        'exec':        '%c -d error_reporting=E_ALL -d display_errors=1 -d display_startup_errors=1 -d log_errors=0 -d xdebug.cli_color=0 -l %o %s:p',
"\        'errorformat': '%m\ in\ %f\ on\ line\ %l',},}
""}}}
" vim-watchdogs {{{
" NeoBundleLazy 'osyo-manga/vim-watchdogs', {
" \    'depends': ['thinca/vim-quickrun', 'osyo-manga/shabadou.vim', 'KazuakiM/vim-qfsigns', 'KazuakiM/vim-qfstatusline', 'dannyob/quickfixstatus'],
" \    'autoload' : {
" \        'filetypes': ['php'],},}
" let s:hooks = neobundle#get_hooks('vim-watchdogs')
" function! s:hooks.on_source(bundle)
"     "vim-qfsigns
"     nnoremap <Leader>sy :QfsignsJunmp<CR>
"     "vim-qfstatusline (This setting is userd at lightline)
"     "let g:Qfstatusline#UpdateCmd = function('lightline#update')
"     "vim-watchdogs
"     let g:watchdogs_check_BufWritePost_enable = 0
"     let g:watchdogs_check_BufWritePost_enables = {
"         \   'php' : 1,}
"     let g:watchdogs_check_CursorHold_enable = 1
"   endfunction
"   unlet s:hooks

"" CSV ユーティリティ
"NeoBundle 'rbtnn/rabbit-ui.vim'
"NeoBundle 'rbtnn/rabbit-ui-collection.vim'
"--------------------------------------------------------------------------------
" マイVim設定

" 移動系のキーバインド
" Emacs キーバインド 
inoremap <C-a> <Home>
inoremap <C-e> <End>
inoremap <C-d> <Del>
inoremap <C-b> <Left>
inoremap <C-n> <Down>
inoremap <C-p> <Up>
inoremap <C-f> <Right>

" ノーマルモード時のみコロンとセミコロンを入れ替え
nnoremap : ;
nnoremap ; :
nnoremap s <Nop>
nnoremap st :<C-u>tabnew<CR>
nnoremap sp gT
nnoremap sn gt

nnoremap sq :<C-u>q<CR>
nnoremap sQ :<C-u>bd<CR>

nnoremap sf :<C-u>NERDTreeToggle<CR>

" HTML/XML の閉じタグを </ が入力されたときに自動的に補完する
augroup MyXML
    autocmd!
    autocmd Filetype xml inoremap <buffer> </ </<C-x><C-o>
    autocmd Filetype html inoremap <buffer> </ </<C-x><C-o>
    autocmd Filetype eruby inoremap <buffer> </ </<C-x><C-o>
augroup END

"オートCD
au BufEnter * execute ":lcd " . expand("%:p:h")

" 拡張子で読み込みタグ変更                                                      
au BufNewFile,BufRead *.php set tags+=$HOME/php.tags 

" Vim grepを自動で開く
autocmd QuickfixCmdPost make,grep,grepadd,vimgrep if len(getqflist()) != 0 | copen | endif

" 検索したいワードにカーソル置いて<Space>gで内部grep、<Space>Gで外部grepの書式が挿入される
set grepprg=grep\ -rnIH\ --exclude-dir=.svn\ --exclude-dir=.git
autocmd QuickfixCmdPost vimgrep copen
autocmd QuickfixCmdPost grep copen
nnoremap [q :cprevious<CR>
nnoremap ]q :cnext<CR>
nnoremap [Q :<C-u>cfirst<CR>
nnoremap ]Q :<C-u>clast<CR>

" grep の書式を挿入
nnoremap <expr> <Space>g ':vimgrep /\<' . expand('<cword>') . '\>/j **/*.' . expand('%:e')
nnoremap <expr> <Space>G ':sil grep! ' . expand('<cword>') . ' *'

" スマートにタグジャンプ!!
nnoremap <C-h> :vsp<CR> :exe("tjump ".expand('<cword>'))<CR>
nnoremap <C-k> :split<CR> :exe("tjump ".expand('<cword>'))<CR>

"----------------------------------------------------------------------------------
" vi互換ではなくVimのデフォルト設定にする
set nocompatible
" 一旦ファイルタイプ関連を無効化
"filetype off
" ファイルタイプ関連を有効化
filetype plugin on
filetype indent on
"ターミナル接続を高速にする
set ttyfast
"ターミナルで256色表示を使う
set t_Co=256
"内容が変更されたら自動的に再読み込み
set autoread
"行番号を表示する
set number
" 右下に行列を表示
set ruler
"編集中のファイル名を表示
set title
"括弧入力時の対応する括弧を表示
set showmatch
"シンタックスハイライトを有効に
syntax on
"エンコード
set encoding=utf-8
"ファイルエンコード
set fileencoding=utf-8
"swapファイルを作らないように
set noswapfile
set nobackup
set noundofile
"検索したキーワードをハイライト表示する機能を無効に
set hlsearch
"カーソルラインを表示する
set cursorline
" TAB, EOFを可視化する
set list
set listchars=tab:>-
" コピペ時の自動インデントをOFF
"set paste
set clipboard=unnamed
" カラー設定
highlight StatusLine term=none cterm=none ctermfg=grey ctermbg=black
highlight CursorLine cterm=underline ctermfg=none ctermbg=none

" タブ幅の設定
set tabstop=2
set expandtab
set shiftwidth=2
set softtabstop=2

set laststatus=2 " ステータスラインを常に表示
set statusline=%F%r%h%= " ステータスラインの内容

" 検索&補完機能設定
set ignorecase "大文字/小文字の区別なく検索する
set smartcase "検索文字列に大文字が含まれている場合は区別して検索する
set wrapscan "検索時に最後まで行ったら最初に戻る
set incsearch "インクリメンタル検索を有効にする
set wildmenu wildmode=list:full "コマンドラインモードにおける補完機能を有効にする。一番使いやすい補完機能にしておく

" 補完機能が一つの場合でもポップアップ表示させる
set completeopt=menuone

" Python 
autocmd FileType python setl autoindent expandtab tabstop=4 shiftwidth=4 softtabstop=4
autocmd FileType python setl smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class

" PHP
autocmd FileType php setl autoindent expandtab tabstop=4 shiftwidth=4 softtabstop=4

" ruby
autocmd FileType ruby setl expandtab tabstop=2 shiftwidth=2 softtabstop=2

" html
autocmd FileType html setl expandtab tabstop=2 shiftwidth=2 softtabstop=2

" Scala
" scalaが拡張子のファイルはファイルタイプをscalaとして読みこむ
au BufNewFile,BufRead *.scala setf scala

" crontab編集時に強制的にバックアップをコピーで作る
autocmd BufRead /private/tmp/crontab.* set backupcopy=yes

" Vimからjq
command! -nargs=? Jq call s:Jq(<f-args>)
function! s:Jq(...)
    if 0 == a:0
        let l:arg = "."
    else
        let l:arg = a:1
    endif
    execute "%! jq \"" . l:arg . "\""
endfunction

""" Codic complete script
inoremap <silent> <C-x><C-t>  <C-R>=<SID>codic_complete()<CR>
function! s:codic_complete()
  let line = getline('.')
  let start = match(line, '\k\+$')
  let cand = s:codic_candidates(line[start :])
  call complete(start +1, cand)
  return ''
endfunction
function! s:codic_candidates(arglead)
  let cand = codic#search(a:arglead, 30)
  " error
  if type(cand) == type(0)
    return []
  endif
  " english -> english terms
  if a:arglead =~# '^\w\+$'
    return map(cand, '{"word": v:val["label"], "menu": join(map(copy(v:val["values"]), "v:val.word"), ",")}')
  endif
  " japanese -> english terms
  return s:reverse_candidates(cand)
endfunction
function! s:reverse_candidates(cand)
  let _ = []
  for c in a:cand
    for v in c.values
      call add(_, {"word": v.word, "menu": !empty(v.desc) ? v.desc : c.label })
    endfor
  endfor
  return _
endfunction
"""
