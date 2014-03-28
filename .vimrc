" ----------------------------------------------------------------------------------------
"   neobundle
" ----------------------------------------------------------------------------------------
set nocompatible               " Be iMproved

if has('vim_starting')
set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

" Recommended to install
" After install, turn shell ~/.vim/bundle/vimproc, (n,g)make -f your_machines_makefile
" NeoBundle 'Shougo/vimproc', {
"   \ 'build' : {
"     \ 'windows' : 'make -f make_mingw32.mak',
"     \ 'cygwin' : 'make -f make_cygwin.mak',
"     \ 'mac' : 'make -f make_mac.mak',
"     \ 'unix' : 'make -f make_unix.mak',
"   \ },
" \ }


" Brief help
" :NeoBundleList          - list configured bundles
" :NeoBundleInstall(!)    - install(update) bundles
" :NeoBundleClean(!)      - confirm(or auto-approve) removal of unused bundles


NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'tomasr/molokai'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
" NeoBundle 'Lokaltog/powerline',{'rtp':'powerline/bindings/vim'}
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'othree/eregex.vim'
NeoBundle 'ujihisa/unite-colorscheme'
NeoBundle 'jpalardy/vim-slime'
NeoBundle 'othree/eregex.vim'

" NeoBundle 'Shougo/vimshell'
" NeoBundle 'Shougo/vimproc'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'fuenor/im_control.vim'



filetype plugin indent on     " Required!

" Installation check.

NeoBundleCheck

"------------------------------------
" Color
"------------------------------------
let g:lightline ={
      \'component':{
      \'readonly':'%{&readonly?"\u2b64":""}',
      \},
      \'separator':{'left':"\u2b80",'right':"\u2b82"},
      \'subseparator':{'left':"\u2b81",'right':"\u2b83"},
      \}

set t_Co=256

colorscheme molokai
syntax on

"------------------------------------
" Show
"------------------------------------
set title " タイトルを表示する
set ruler " ルーラーを表示
set laststatus=2 " 常にステータラスラインを表示
set showmatch " 対応する括弧をハイライト
set number " 行番号表示
set list " 不可視文字表示
set listchars=tab:>-,trail:-,nbsp:%,extends:>,precedes:<
set encoding=utf-8
set guifont=Ricty_for_Powerline:h10
set guifontwide=Ricty:h10
" let g:Powerline_symbols='fancy'
let g:lightline= {
  \'colorscheme' : 'default',
  \ 'component': {
  \   'readonly': '%{&readonly?"⭤":""}',
  \ },
  \'separator': { 'left': '', 'right': '' }
  \}

"set listchars=tab:>\ ,extends:<
" 全角スペースの表示
highlight ZenkakuSpace cterm=underline ctermfg=red guibg=darkgray
match ZenkakuSpace /　/
set cursorline " カーソル行をハイライト
" set ttyfast 

let g:neocomplcache_enable_at_startup = 1

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
inoremap <C-j> <Esc>

"http://d.hatena.ne.jp/yascentur/20120219/1329578432
inoremap () ()<Left>
inoremap {} {}<Left>
inoremap [] []<Left>
inoremap <> <><Left>
inoremap "" ""<Left>
inoremap '' ''<Left>
inoremap `` ``<Left>


set softtabstop=2
set tabstop=2
set shiftwidth=2
set expandtab

set clipboard=unnamed
set backspace=indent,eol,start

imap <C-j> <Esc>:w<cr>

set showtabline=2

nnoremap / :M/
nnoremap ? :M?
nnoremap ,/ /
nnoremap ,? ?

"http://www.daisaru11.jp/blog/2011/08/vim%E3%81%A7%E6%8C%BF%E5%85%A5%E3%83%A2%E3%83%BC%E3%83%89%E3%81%AB%E3%81%AA%E3%82%89%E3%81%9A%E3%81%AB%E6%94%B9%E8%A1%8C%E3%82%92%E5%85%A5%E3%82%8C%E3%82%8B/
nnoremap <CR> o<ESC>

"折り返しの禁止
set nowrap
