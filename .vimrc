filetype plugin indent on
syntax on

set re=0 " Use new regular expression engine
set redrawtime=10000 " Sets redrawtime to 10 seconds (default is 2000ms or 2 seconds)

" Use spaces instead of tabs
set expandtab

" Set the number of spaces per tab
set tabstop=4
set shiftwidth=4
set softtabstop=4
" Show existing tab with 4 spaces width
set autoindent

" Enable spell checking
set nospell
set spelllang=en_us
set spellfile=~/.vim/spell/en.utf-8.add

" ]s - Move to the next misspelled word
" [s - Move to the previous misspelled word
" z= - See spelling suggestions for the word under cursor
" zg - Add the word under cursor to your spell file (mark as correct)
" zw - Mark the word under cursor as incorrect
"

set ruler

set noerrorbells visualbell t_vb=
if has('autocmd')
  autocmd GUIEnter * set visualbell t_vb=
endif


:command! Fxml % !tidy -q --input-xml true --indent yes --indent-spaces 4 %
:command! Fjson % !jq .

" autopep8
let g:autopep8_disable_show_diff=1

let g:claude_api_key = $ANTHROPIC_API_KEY 

let g:claude_map_implement = "<Leader>ci"
let g:claude_map_open_chat = "<Leader>cc"
let g:claude_map_send_chat_message = "<C-]>"
let g:claude_map_cancel_response = "<Leader>cx"

nnoremap <Tab> :bn<CR>
nnoremap <S-Tab> :bp<CR>
