filetype plugin indent on
syntax on

set ruler

set noerrorbells visualbell t_vb=
if has('autocmd')
  autocmd GUIEnter * set visualbell t_vb=
endif

:command! Fxml % !tidy -q --input-xml true --indent yes --indent-spaces 4 %
