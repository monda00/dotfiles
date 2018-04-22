set nocompatible
filetype plugin indent off

if has('vim_starting')
  set runtimepath+=~/dotfiles/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/dotfiles/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'Shougo/vimshell'
NeoBundle 'jpalardy/vim-slime'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'tpope/vim-rails'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'tpope/vim-surround'
NeoBundle 'vim-scripts/AnsiEsc.vim'
NeoBundle 'bronson/vim-trailing-whitespace'
NeoBundle 'kana/vim-submode'
NeoBundle 'slim-template/vim-slim'
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'ujihisa/unite-colorscheme'
NeoBundle 'thoughtbot/vim-rspec'
NeoBundle 'yonchu/accelerated-smooth-scroll'
NeoBundle 'jistr/vim-nerdtree-tabs'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'pmsorhaindo/syntastic-local-eslint.vim'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'kannokanno/previm'
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'mxw/vim-jsx'
NeoBundle 'othree/yajs.vim'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'tomasr/molokai'
NeoBundle 'jacoborus/tender.vim'
NeoBundle 'Yggdroot/indentLine'
NeoBundle 'freeo/vim-kalisi'
NeoBundle 'octol/vim-cpp-enhanced-highlight'
NeoBundle 'joshdick/onedark.vim'
NeoBundle 'soramugi/auto-ctags.vim'
NeoBundle 'itchyny/lightline.vim'

call neobundle#end()

filetype plugin indent on

"------------------------------
"起動設定
"------------------------------
nnoremap <silent><C-e> :NERDTreeToggle<CR>
autocmd vimenter * if !argc() | NERDTree | endif

"------------------------------
"見た目
"------------------------------
syntax on
set background=dark

"c++用
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1

colorscheme onedark
set t_Co=256

set guifont=Ricty\ for\ Powerline:h18

let g:indentLine_color_term = 239
let g:indentLine_color_gui = '#ffffff'
let g:indentLine_char = '¦'
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=0

set number         " 行番号を表示する
set showmatch      " 対応する括弧を強調表示
" set ruler          " カーソルが何行目の何列か表示
set showcmd        " コマンドの一部を表示
set encoding=utf8  " エンコード"
set fileencoding=utf-8

set backspace=indent,eol,start " Backspaceキーの影響範囲に制限を設けない
set whichwrap=b,s,h,l,<,>,[,]  " 行頭行末の左右移動で行をまたぐ
set scrolloff=8                " 上下8行の視界を確保
set sidescrolloff=16           " 左右スクロール時の視界を確保
set sidescroll=1               " 左右スクロールは一文字づつ行う

" 全角スペースの表示
function! ZenkakuSpace()
      highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
endfunction

if has('syntax')
    augroup ZenkakuSpace
        autocmd!
        autocmd ColorScheme * call ZenkakuSpace()
        autocmd VimEnter,WinEnter,BufRead * let w:m1=matchadd('ZenkakuSpace', '　')
    augroup END
    call ZenkakuSpace()
endif

" 最後のカーソル位置を復元する
if has("autocmd")
    autocmd BufReadPost *
    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \   exe "normal! g'\"" |
    \ endif
endif

" カーソル行を強調表示しない
set nocursorline
" 挿入モードの時のみ、カーソル行をハイライトする
autocmd InsertEnter,InsertLeave * set cursorline!

" 最下部のステータスを常に表示
set laststatus=2

set noshowmode

" lightlineの設定

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'component': {
      \   'readonly': '%{&readonly?"\u2b64":""}',
      \ },
      \ 'separator': { 'left': "\u2b80", 'right': "\u2b82" },
      \ 'subseparator': { 'left': "\u2b81", 'right': "\u2b83" },
      \ }

"------------------------------
" ファイル処理関連の設定
"------------------------------

set confirm    " 保存されていないファイルがあるときは終了前に保存確認
set hidden     " 保存されていないファイルがあるときでも別のファイルを開くことが出来る
set autoread   "外部でファイルに変更がされた場合は読みなおす
set nobackup   " ファイル保存時にバックアップファイルを作らない
set noswapfile " ファイル編集中にスワップファイルを作らない

"------------------------------
" 検索/置換の設定
"------------------------------

set hlsearch   " 検索文字列をハイライトする
set incsearch  " インクリメンタルサーチを行う
set ignorecase " 大文字と小文字を区別しない
set smartcase  " 大文字と小文字が混在した言葉で検索を行った場合に限り、大文字と小文字を区別する
set wrapscan   " 最後尾まで検索を終えたら次の検索で先頭に移る
set gdefault   " 置換の時 g オプションをデフォルトで有効にする

"タグジャンプ
set tags=./tags;
let g:auto_ctags = 1
set tags+=./tags

"------------------------------
" タブ/インデントの設定
"------------------------------

set expandtab     " タブ入力を複数の空白入力に置き換える
set tabstop=2     " 画面上でタブ文字が占める幅
set shiftwidth=2  " 自動インデントでずれる幅
set softtabstop=2 " 連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
set autoindent    " 改行時に前の行のインデントを継続する
set smartindent   " 改行時に入力された行の末尾に合わせて次の行のインデントを増減する
filetype indent off

"------------------------------
" 動作環境との統合関連の設定
"------------------------------

" OSのクリップボードをレジスタ指定無しで Yank, Put 出来るようにする
set clipboard=unnamed,unnamedplus
" マウスの入力を受け付ける
set mouse=a

"------------------------------
" コマンドラインの設定
"------------------------------

" コマンドラインモードでTABキーによるファイル名補完を有効にする
set wildmenu wildmode=list:longest,full
" コマンドラインの履歴を10000件保存する
set history=10000

"------------------------------
"キーをカスタマイズ
"------------------------------
" ハイライトをESC二回で消す
nmap <silent> <Esc><Esc> :nohlsearch<CR>
" Ctrl + hjkl でウィンドウ間を移動
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" 画面移動と画面分割
nnoremap s <Nop>
" 分割
nnoremap ss :<C-u>sp<CR>          "水平分割
nnoremap sv :<C-u>vs<CR>          "垂直分割
" 分割したウィンドウ間を移動する
nnoremap sj <C-w>j "下に移動
nnoremap sk <C-w>k "上に移動
nnoremap sl <C-w>l "右に移動
nnoremap sh <C-w>h "左に移動
nnoremap sw <C-w>w  "次に移動
" 分割したウィンドウそのものを移動する
nnoremap sJ <C-w>J
nnoremap sK <C-w>K
nnoremap sL <C-w>L
nnoremap sH <C-w>H
nnoremap sr <C-w>r
" カレントウィンドウの大きさを変える
nnoremap s= <C-w>=
nnoremap so <C-w>_<C-w>|
nnoremap sO <C-w>=
" カレントウィンドウの大きさを変える
call submode#enter_with('bufmove', 'n', '', 's>', '<C-w>>')
call submode#enter_with('bufmove', 'n', '', 's<', '<C-w><')
call submode#enter_with('bufmove', 'n', '', 's+', '<C-w>+')
call submode#enter_with('bufmove', 'n', '', 's-', '<C-w>-')
call submode#map('bufmove', 'n', '', '>', '<C-w>>')
call submode#map('bufmove', 'n', '', '<', '<C-w><')
call submode#map('bufmove', 'n', '', '+', '<C-w>+')
call submode#map('bufmove', 'n', '', '-', '<C-w>-')
" タブ関連
nnoremap st :<C-u>tabnew<CR>
nnoremap sn gt
nnoremap sp gT
" 閉じる
nnoremap sq :<C-u>q<CR>
nnoremap sQ :<C-u>bd<CR>

" jjでインサートからノーマル
inoremap <silent> jj <ESC>

"------------------------------
"NERDTree 設定
"------------------------------

" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction
call NERDTreeHighlightFile('cpp',     'yellow',  'none', 'yellow',  '#151515')
call NERDTreeHighlightFile('h',     'blue',    'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('hpp',    'yellow',  'none', 'yellow',  '#151515')
call NERDTreeHighlightFile('config', 'yellow',  'none', 'yellow',  '#151515')
call NERDTreeHighlightFile('conf',   'yellow',  'none', 'yellow',  '#151515')
call NERDTreeHighlightFile('json',   'yellow',  'none', 'yellow',  '#151515')
call NERDTreeHighlightFile('html',   'yellow',  'none', 'yellow',  '#151515')
call NERDTreeHighlightFile('styl',   'cyan',    'none', 'cyan',    '#151515')
call NERDTreeHighlightFile('css',    'cyan',    'none', 'cyan',    '#151515')
call NERDTreeHighlightFile('rb',     'Red',     'none', 'red',     '#151515')
call NERDTreeHighlightFile('js',     'Red',     'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php',    'Magenta', 'none', '#ff00ff', '#151515')

let g:NERDTreeDirArrows = 1
let g:NERDTreeDirArrowExpandable  = '▶'
let g:NERDTreeDirArrowCollapsible = '▼'

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" https://sites.google.com/site/fudist/Home/vim-nihongo-ban/-vimrc-sample

" 括弧の補完
inoremap {<Enter> {}<Left><CR><ESC><S-o>
inoremap (<Enter> ()<Left><CR><ESC><S-o>
inoremap [<Enter> []<Left><CR><ESC><S-o>
