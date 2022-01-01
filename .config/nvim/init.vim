call plug#begin('~/.config/nvim/autoload/plugged')
Plug 'itchyny/lightline.vim'
Plug 'morhetz/gruvbox'
Plug 'chrisbra/Colorizer'
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'tpope/vim-fugitive'
call plug#end()

set encoding=UTF-8
set nocompatible
set termguicolors
colorscheme gruvbox
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
set spell
set ignorecase
set clipboard=unnamedplus
set list
set listchars=tab:──›,trail:·,lead:·,conceal:?
set splitbelow splitright
set tildeop
set history=100
set autowrite
filetype plugin on
syntax on

" Show number/relativenumber in help screens
autocmd FileType help setlocal number relativenumber | wincmd L

" Disable spellcheck underlining in terminal mode and start in insert mode
autocmd TermOpen * setlocal nospell | startinsert

let g:colorizer_auto_filetype='css,html,js,ts,conf,xdefaults'

let NERDTreeShowHidden=1

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

inoremap <Left> <nop>
inoremap <Down> <nop>
inoremap <Up> <nop>
inoremap <Right> <nop>

noremap , ;
noremap < ,

" Use Ctrl+(arrow key) for moving splits
noremap <C-Left>	<C-w>H
noremap <C-Down>	<C-w>J
noremap <C-Up>		<C-w>K
noremap <C-Right>	<C-w>L

" Exit Terminal Mode with ESC
tnoremap <ESC> <C-\><C-n>

