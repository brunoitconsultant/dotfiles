" Enable clean color syntax highlighting
syntax on

" Add premium line numbers
set number
set relativenumber

" Clean up the screen space
set showcmd
" set cursorline

" Hide the ugly vertical tildes on empty lines
highlight EndOfBuffer ctermfg=black ctermbg=black

" Automatically start in Insert Mode when opening any file
autocmd BufReadPost,BufNewFile * startinsert
