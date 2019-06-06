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

" 一括コメントアウト
vmap <silent> <Leader>cc gcc

