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
" ]s - Move to the next misspelled word
" [s - Move to the previous misspelled word
" z= - See spelling suggestions for the word under cursor
" zg - Add the word under cursor to your spell file (mark as correct)
" zw - Mark the word under cursor as incorrect
set autoindent

set ruler

set noerrorbells visualbell t_vb=
if has('autocmd')
  autocmd GUIEnter * set visualbell t_vb=
endif

set rtp+=/opt/homebrew/opt/fzf

:command! Fxml % !tidy -q --input-xml true --indent yes --indent-spaces 4 %
:command! Fjson % !jq .

