call plug#begin('~/.config/nvim/plugged')
Plug 'itchyny/lightline.vim'
Plug 'morhetz/gruvbox'
Plug 'chrisbra/Colorizer'
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'tpope/vim-fugitive'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'airblade/vim-gitgutter'
Plug 'axelf4/vim-strip-trailing-whitespace'
Plug 'junegunn/fzf.vim'
Plug 'XadillaX/json-formatter.vim'
call plug#end()

let g:coc_data_home = '~/.config/nvim/coc'
let g:coc_global_extensions = [
    \'coc-json',
    \'coc-java',
    \'coc-tsserver',
    \'coc-eslint',
    \'coc-sql',
    \'coc-tslint-plugin',
    \'coc-sh',
    \'coc-angular',
\]

set encoding=UTF-8
set nocompatible
set termguicolors
set background=dark
colorscheme gruvbox
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
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
set shortmess+=c
set colorcolumn=80
set signcolumn=yes
set updatetime=300
set nobackup
set nowritebackup

filetype plugin on
syntax on

" Show number/relativenumber in help screens
autocmd FileType help setlocal nolist nospell number relativenumber | wincmd L

" Disable spellcheck underlining in terminal mode and start in insert mode
autocmd TermOpen * | setlocal nospell | startinsert

let g:colorizer_auto_filetype='css,html,js,ts,conf,xdefaults'

let NERDTreeShowHidden=1
let mapleader=' '

nnoremap j h
nnoremap k j
nnoremap l k
nnoremap ; l

nnoremap zj zh
nnoremap zk zj
nnoremap zl zk
nnoremap z; zl

"
" Window splits
"
" Use Ctrl+(arrow key) for moving splits
nnoremap <C-Left>    <C-w>H
nnoremap <C-Down>    <C-w>J
nnoremap <C-Up>      <C-w>K
nnoremap <C-Right>   <C-w>L
" Arrow keys for navigating splits
nnoremap <Left>  <C-w>h
nnoremap <Down>  <C-w>j
nnoremap <Up>    <C-w>k
nnoremap <Right> <C-w>l
" Shift+(arrow key) for resizing splits
nnoremap <S-Left>    <C-W>5<
nnoremap <S-Down>    <C-W>5-
nnoremap <S-Up>      <C-W>5+
nnoremap <S-Right>   <C-W>5>
" Open new split vertically
nnoremap <C-w>N <C-w>n<C-w>L


" Same as ~/.config/zsh/jump-list.zsh to avoid breaking Tab Completion
nnoremap <C-I> <nop>
nnoremap <C-L> <C-I>

" Disable arrow key movement
inoremap <Left> <nop>
inoremap <Down> <nop>
inoremap <Up> <nop>
inoremap <Right> <nop>

" Center the screen when searching
nnoremap n nzz
nnoremap N Nzz

" Remap command/search replay keys
nnoremap , ;
nnoremap < ,

" Exit Terminal Mode with ESC
tnoremap <leader><ESC> <C-\><C-n>

" CoC - Use Tab and Shift-Tab for completions
function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>  pumvisible() ? "\<C-n>" : <SID>check_back_space() ? "\<TAB>" : coc#refresh()
inoremap <silent><expr> <S-Tab> pumvisible() ? "\<C-p>" : <SID>check_back_space() ? "\<TAB>" : coc#refresh()


" Reset cursor on exit/suspend
autocmd VimLeave,VimSuspend * set guicursor=a:hor20

