" neoclide/coc.nvim

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

" Use Tab and Shift-Tab for completions
function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>  pumvisible() ? "\<C-n>" : <SID>check_back_space() ? "\<TAB>" : coc#refresh()
inoremap <silent><expr> <S-Tab> pumvisible() ? "\<C-p>" : <SID>check_back_space() ? "\<TAB>" : coc#refresh()

