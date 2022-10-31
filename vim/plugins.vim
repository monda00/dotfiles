if &compatible
  set nocompatible
endif

set runtimepath+=$HOME/.cache/dein/repos/github.com/Shougo/dein.vim

call dein#begin('$HOME/.cache/dein')

" Let dein manage dein
call dein#add('$HOME/.cache/dein/repos/github.com/Shougo/dein.vim')

call dein#end()

filetype plugin indent on
syntax enable
