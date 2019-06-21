""""""""""""""""""""""""""""""
" => Python section
""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""
" => C++ section
""""""""""""""""""""""""""""""

au FileType cpp let g:cpp_class_scope_highlight = 1
au FileType cpp let g:cpp_member_variable_highlight = 1

""""""""""""""""""""""""""""""
" => Vagrantfile section
""""""""""""""""""""""""""""""

 augroup vagrant
   au!
   au BufRead,BufNewFile Vagrantfile set filetype=ruby
 augroup END

