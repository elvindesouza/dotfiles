"esc remapping
inoremap jk <ESC>

"open up new line in insert mode
inoremap oo <ESC>o
"enter for newline
nnoremap <CR> o<Esc>

"delete previous word
nnoremap  db
inoremap  <C-w>

"delete next word
inoremap <C-kDel> <C-o>dw
nnoremap <C-kDel> dw

"R for redo
nnoremap R <C-R>

"seek to B/EOL
nnoremap 0 ^
vnoremap 0 ^
nnoremap - g$
vnoremap - g_
"insert seek to B/EOL
inoremap kl <ESC>g$i
inoremap kj <ESC>^i

"bracket
nnoremap 9 %
vnoremap 9 %

" Move up/down editor lines
nnoremap j gjzz
nnoremap k gkzz

"alt+nav keys to move lines of text around
"nnoremap j :m .+1<CR>==
"nnoremap k :m .-2<CR>==
"vnoremap j :m '>+1<CR>gv=gv
"vnoremap k :m '<-2<CR>gv=gv
" try on archlinux
"nmap <M-j> mz:m+<cr>`z
"nmap <M-k> mz:m-2<cr>`z
"vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
"vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

"search-replace
nnoremap cn *``cgn
nnoremap cN *``cgN 

"replace other remappings because this just made them redundant
map 0 ^
map - $

" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

nmap <C-_> gcgc
vmap <C-_> gc

" write with sudo
command W :execute ':silent w !sudo tee % > /dev/null' | :edit!


autocmd TextChanged,TextChangedI * silent write

"color elflord
syntax enable
syntax on
filetype plugin on
filetype indent on
"set mouse=a
set clipboard+=unnamedplus
set ignorecase
set smartcase
set expandtab
set tabstop=4
set shiftwidth=4
set virtualedit+=onemore
set incsearch
set hlsearch
set autoindent
set smartindent
set cindent
"set nowrap
set scrolloff=999
set timeoutlen=150
set so=7
set backspace=eol,start,indent
set whichwrap+=<,>,h,l
set showmatch
set encoding=utf8
set ffs=unix,dos,mac
set nobackup
set nowb
set noswapfile

let g:python_highlight_all=1
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_posix_standard = 1
let g:cpp_concepts_highlight = 1
