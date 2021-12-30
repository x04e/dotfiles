call plug#begin('~/.config/nvim/autoload/plugged')
Plug 'phanviet/vim-monokai-pro'
Plug 'chrisbra/Colorizer'
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline'
call plug#end()

set encoding=UTF-8
set nocompatible
set termguicolors
colorscheme monokai_pro
set tabstop=4
set shiftwidth=4
set nowrap
set number
set relativenumber
set linebreak
set laststatus=2
set mouse=a
set undofile
set hidden
set incsearch
set nohlsearch
set spell
set ignorecase
set clipboard=unnamedplus
set list
set listchars=tab:──›,trail:·,lead:·,conceal:?
set listchars=tab:›-,trail:·,lead:·
set splitbelow splitright
set tildeop
set history=100
filetype plugin on
syntax on

" Show number/relativenumber in help screens
autocmd FileType help setlocal number relativenumber

" Disable spellcheck underlining in terminal mode and start in insert mode
autocmd TermOpen * setlocal nospell | startinsert

let g:colorizer_auto_filetype='css,html,js,ts,conf,xdefaults'

"let g:netrw_preview=1
"let g:netrw_liststyle=3
"let g:netrw_banner=0
"let g:netrw_browse_split=3
"let g:netrw_winsize=20

let NERDTreeShowHidden=1
let g:airline_powerline_fonts=1
noremap j h
noremap k j
noremap l k
noremap ; l

noremap zj zh
noremap zk zj
noremap zl zk
noremap z; zl

"
" Window splits
"
" Arrow keys for navigating splits
noremap <Left>	<C-w>h
noremap <Down>	<C-w>j
noremap <Up>	<C-w>k
noremap <Right>	<C-w>l
" Shift+(arrow key) for resizing splits
noremap <S-Left>	<C-W>5<
noremap <S-Down>	<C-W>5-
noremap <S-Up>		<C-W>5+
noremap <S-Right>	<C-W>5>

" Use Ctrl+(arrow key) for moving splits
noremap <C-Left>	<C-w>H
noremap <C-Down>	<C-w>J
noremap <C-Up>		<C-w>K
noremap <C-Right>	<C-w>L

"
" Terminal Mode
"
" Exit with ESC instead of Ctrl+\ Ctrl+n
tnoremap <ESC> <C-\><C-n>

