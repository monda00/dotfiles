if $SHELL =~ '/fish$'
  set shell=zsh
endif

set runtimepath+=~/dotfiles/vim/
runtime! ./plugins.vim
runtime! init/*.vim
runtime! plugins/*.vim
