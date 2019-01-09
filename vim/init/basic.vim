set number         " 行番号を表示する
set showmatch      " 対応する括弧を強調表示
set ruler          " カーソルが何行目の何列か表示
set showcmd        " コマンドの一部を表示
set encoding=utf8  " エンコード"
set fileencoding=utf-8
set backspace=indent,eol,start " Backspaceキーの影響範囲に制限を設けない
set whichwrap=b,s,h,l,<,>,[,]  " 行頭行末の左右移動で行をまたぐ
set scrolloff=8                " 上下8行の視界を確保
set sidescrolloff=16           " 左右スクロール時の視界を確保
set sidescroll=1               " 左右スクロールは一文字づつ行う
set nocursorline " カーソル行を強調表示しない
autocmd InsertEnter,InsertLeave * set cursorline! " 挿入モードの時のみ、カーソル行をハイライトする
set laststatus=2 " 最下部のステータスを常に表示
set noshowmode

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
" 動作環境との統合関連の設定
"------------------------------

set clipboard=unnamed,unnamedplus " OSのクリップボードをレジスタ指定無しで Yank, Put 出来るようにする
set mouse=a                       " マウスの入力を受け付ける

"------------------------------
" コマンドラインの設定
"------------------------------

set wildmenu wildmode=list:longest,full " コマンドラインモードでTABキーによるファイル名補完を有効にする
set history=10000                       " コマンドラインの履歴を10000件保存する

" 括弧の補完
inoremap {<Enter> {}<Left><CR><ESC><S-o>
inoremap (<Enter> ()<Left><CR><ESC><S-o>
inoremap [<Enter> []<Left><CR><ESC><S-o>




