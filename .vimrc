" ----------------------------------------------------------------------------------------
"
"
"
"   neobundle
" ----------------------------------------------------------------------------------------
set nocompatible               " Be iMproved

if has('vim_starting')
set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'
call neobundle#end()

" Let NeoBundle manage NeoBundle
"----------------------------
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


NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/neocomplcache'

NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
"NeoBundle 'Shougo/vimfiler'

NeoBundle 'tomasr/molokai'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'othree/eregex.vim'
NeoBundle 'digitaltoad/vim-jade'
NeoBundle 'othree/eregex.vim'

NeoBundle 'tpope/vim-fugitive'
NeoBundle 'christoomey/vim-tmux-navigator'
NeoBundle 'scrooloose/nerdtree'

"インデントをわかりやすく表示
NeoBundle 'nathanaelkane/vim-indent-guides'

NeoBundle 'violetyk/cake.vim'

NeoBundle 'sophacles/vim-processing'
NeoBundle 'thinca/vim-quickrun'

"syntax
NeoBundle 'wavded/vim-stylus'
NeoBundle 'slim-template/vim-slim'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'mxw/vim-jsx'
NeoBundle 'othree/yajs.vim'
NeoBundle 'blockloop/vim-swigjs'
NeoBundle 'gcorne/vim-sass-lint'


"see http://qiita.com/akameco/items/dff88a40db7df3903f78
NeoBundle 'editorconfig/editorconfig-vim'

"検索結果の一括置換
NeoBundle 'thinca/vim-qfreplace'

filetype plugin indent on     " Required!

" Installation check.
"----------------------------

NeoBundleCheck


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

"------------------------------------
" Color
"------------------------------------
set t_Co=256

colorscheme molokai
syntax on


let g:lightline= {
\  'colorscheme' : 'default',
\  'active': {
\    'left': [['mode','paste'],['fugitive','filename']]
\  },
\  'component_function': {
\    'fugitive' : 'MyFugitive',
\    'readonly' : 'MyReadonly',
\    'modified' : 'MyModified',
\    'filename' : 'MyFilename'
\  }
\}

function! MyModified()
  if &filetype == "help"
    return ""
  elseif &modified
    return "+"
  elseif &modifiable
    return ""
  else
    return ""
  endif
endfunction

function! MyReadonly()
  if &filetype == "help"
    return ""
  elseif &readonly
    return "⭤"
  else
    return ""
  endif
endfunction

function! MyFugitive()
  if exists("*fugitive#head")
   let _ = fugitive#head()
   return strlen(_) ? '⭠ '._ : ''
  endif
  return ''
endfunction

function! MyFilename()
  return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
   \ ('' != expand('%:t') ? expand('%:t') : '[No Name]') .
   \ ('' != MyModified() ? ' ' . MyModified() : '')
endfunction

"set listchars=tab:>\ ,extends:<
" 全角スペースの表示
"----------------------------
highlight ZenkakuSpace cterm=underline ctermfg=red guibg=darkgray
match ZenkakuSpace /　/
set cursorline " カーソル行をハイライト

" set ttyfast
"----------------------------

let g:neocomplcache_enable_at_startup = 1

" Recommended key-mappings.
" <CR>: close popup and save indent.
"----------------------------

inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplcache#smart_close_popup() . "\<CR>"
endfunction

" <TAB>: completion.
"----------------------------
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" <C-h>, <BS>: close popup and delete backword char.
"----------------------------
"inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
"inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

"----------------------------
" neosnippet
"----------------------------

" Plugin key-mappings.
imap <C-f>     <Plug>(neosnippet_expand_or_jump)
smap <C-f>     <Plug>(neosnippet_expand_or_jump)
xmap <C-f>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
"imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
"\ "\<Plug>(neosnippet_expand_or_jump)"
"\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"

" For snippet_complete marker.
"if has('conceal')
"  set conceallevel=2 concealcursor=i
"endif


"insert mode から抜ける
"----------------------------
inoremap <silent> jj <Esc><Right>

"挿入モードでカーソル移動
"----------------------------
"inoremap <C-j> <Down>
"inoremap <C-k> <Up>
"inoremap <C-h> <Left>
"inoremap <C-l> <Right>

"set softtabstop=2
"set tabstop=2
"set shiftwidth=2
"set expandtab
set autoindent
set smartindent

set clipboard=unnamed
set backspace=indent,eol,start

set showtabline=2

nnoremap / :M/
nnoremap ? :M?
nnoremap ,/ /
nnoremap ,? ?
"nnoremap ,v :VimFilerExplorer<CR>
nnoremap ,v :NERDTree<CR>

"remap paste
"----------------------------
nnoremap P p
nnoremap p P

"http://www.daisaru11.jp/blog/2011/08/vim%E3%81%A7%E6%8C%BF%E5%85%A5%E3%83%A2%E3%83%BC%E3%83%89%E3%81%AB%E3%81%AA%E3%82%89%E3%81%9A%E3%81%AB%E6%94%B9%E8%A1%8C%E3%82%92%E5%85%A5%E3%82%8C%E3%82%8B/
"----------------------------
nnoremap <CR> o<ESC>

"折り返しの禁止
"----------------------------
set nowrap

"http://marutanm.hatenablog.com/entry/20110706/p1
"----------------------------
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P

"esteWatchに更新通知を都度渡せるよう
"----------------------------
set nobackup
set nowritebackup

"http://qiita.com/usamik26/items/f733add9ca910f6c5784
"----------------------------
let &t_ti.="\e[1 q"
let &t_SI.="\e[5 q"
let &t_EI.="\e[1 q"
let &t_te.="\e[0 q"


" @see http://kontany.net/blog/?p=112
" 隠しファイルをデフォルトで表示させる
let NERDTreeShowHidden = 1

" @see http://uskey512.hatenablog.com/entry/20120413/1334323877
" 引数なしで実行したとき、NERDTreeを実行する
let file_name = expand("%:p")
if has('vim_starting') &&  file_name == ""
    autocmd VimEnter * execute 'NERDTree ./'
endif


" @see http://gg-hogehoge.hatenablog.com/entry/2014/04/05/230043
" 自分用 snippet ファイルの場所
"
let s:my_snippet = '~/snippet/'
let g:neosnippet#snippets_directory = s:my_snippet

" 閉じタグ補完
inoremap { {}<LEFT>
inoremap [ []<LEFT>
inoremap ( ()<LEFT>
inoremap " ""<LEFT>
inoremap ' ''<LEFT>
vnoremap { "zdi^V{<C-R>z}<LEFT>
vnoremap [ "zdi^V[<C-R>z]<LEFT>
vnoremap ( "zdi^V(<C-R>z)<LEFT>
vnoremap " "zdi^V"<C-R>z^V"<LEFT>
vnoremap ' "zdi'<C-R>z'<LEFT>

"インデントをわかりやすく表示
" vim-indent-guides

let g:indent_guides_auto_colors=0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#262626 ctermbg=234
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#393939 ctermbg=235
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_guide_size=1
let g:indentLine_faster = 1

"see http://kazuph.hateblo.jp/entry/2013/03/20/211336
let g:quickrun_config = {}
let g:quickrun_config.processing =  {
\     'command': 'processing-java',
\     'exec': '%c --sketch=$PWD/ --output=/Library/Processing --run --force',
\   }

"need npm install >> npm install -g jsxhint
let g:syntastic_javascript_checkers = ['jsxhint']
let g:syntastic_sass_checkers= ['sass_lint']
let g:syntastic_scss_checkers= ['sass_lint']

fun! SetScssConfig()
  let scssConfig = findfile('.sass-lint.yml', '.;')
  if scssConfig != ''
    let b:syntastic_scss_sass_lint_args = '--config ' . scssConfig
  endif
endf

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


"see http://qiita.com/QuestionDriven/items/83cba09d0010e8e31315
autocmd BufRead,BufNewFile *.es6 setfiletype javascript
