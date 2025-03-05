filetype plugin indent on
syntax on

" Use spaces instead of tabs
set expandtab

" Set the number of spaces per tab
set tabstop=4
set shiftwidth=4
set softtabstop=4

" Enable spell checking
set spell
set spelllang=en_us

" Show existing tab with 4 spaces width
set autoindent

set ruler

set noerrorbells visualbell t_vb=
if has('autocmd')
  autocmd GUIEnter * set visualbell t_vb=
endif

set rtp+=/opt/homebrew/opt/fzf

:command! Fxml % !tidy -q --input-xml true --indent yes --indent-spaces 4 %
:command! Fjson % !jq .

