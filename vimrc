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

set shortmess+=I

"                    Standard 4-character indentation configurations
set tabstop=4      " Renders a hard tab (\t) character as 4 spaces wide
set shiftwidth=4   " Indents by 4 spaces when using the > or < commands
set softtabstop=4  " Makes the Backspace key remove 4 spaces at once like a tab
set expandtab      " Converts all hit tab keystrokes directly into actual spaces

" Automatically create backup and swap directories if they don't exist
if !isdirectory(expand('~/.vim/swap'))
    call mkdir(expand('~/.vim/swap'), 'p')
endif

if !isdirectory(expand('~/.vim/backup'))
    call mkdir(expand('~/.vim/backup'), 'p')
endif

set directory=$HOME/.vim/swap//
set backupdir=$HOME/.vim/backup//

