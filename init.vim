call plug#begin('~/.vim/plugged')
	Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
	Plug 'itchyny/lightline.vim'
	Plug 'mhinz/vim-startify'
	Plug 'neomake/neomake'
	Plug 'neoclide/coc.nvim', { 'branch': 'release' }
	Plug 'luochen1990/rainbow'
	Plug 'airblade/vim-gitgutter'
    Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }

    " Language plugins
    Plug 'octol/vim-cpp-enhanced-highlight'
	"Plug 'Yggdroot/indentLine'
    Plug 'junegunn/vim-easy-align'
call plug#end()

let g:rainbow_active = 1
let g:python3_host_skip_check = 1
let g:python3_host_prog = "$HOME/Develop/software/miniconda3/bin/python3"
let g:loaded_python_provider = 0
let g:neomake_open_list = 1

let g:gitgutter_preview_win_floating = 0
let g:gitgutter_highlight_lines = 1

let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_posix_standard = 1
let g:cpp_experimental_template_highlight = 1

"let g:indentLint_char = '|'
"let g:indentLine_enabled = 1
"let g:indentLine_color_tty_light = 7 " (default: 4)
"let g:indentLine_color_dark = 1 " (default: 2)

set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set copyindent
set nu rnu
"set paste
set autochdir
set noshowmode

autocmd BufWritePre * %s/\s\+$//e

call defx#custom#option('_', {
	\ 'winwidth': 30,
	\ 'split': 'vertical',
	\ 'direction': 'botright',
	\ 'show_ignored_files': 1,
	\ 'buffer_name': 'DEFX',
	\ 'toggle': 1,
	\ 'resume': 1
	\ })

let mapleader = "\<Space>"
noremap <leader>ft :Defx<CR>
autocmd FileType defx call s:defx_mappings()

function! s:defx_mappings() abort
  nnoremap <silent><buffer><expr> l     <SID>defx_toggle_tree()                    " 打开或者关闭文件夹，文件
  nnoremap <silent><buffer><expr> .     defx#do_action('toggle_ignored_files')     " 显示隐藏文件
  nnoremap <silent><buffer><expr> <C-r>  defx#do_action('redraw')
endfunction

function! s:defx_toggle_tree() abort
	" Open current file, or toggle directory expand/collapse
	if defx#is_directory()
		return defx#do_action('open_or_close_tree')
	endif
	return defx#do_action('multi', ['drop'])
endfunction

"nnoremap <silent><buffer><expr> <CR>
"    \ defx#is_directory() ?
"    \ defx#do_action('open_tree', 'recursive:10') : defx#do_action('preview')

let g:lightline = {
      \ 'mode_map': {
        \ 'n' : 'N',
        \ 'i' : 'I',
        \ 'R' : 'R',
        \ 'v' : 'V',
        \ 'V' : 'VL',
        \ "\<C-v>": 'VB',
        \ 'c' : 'C',
        \ 's' : 'S',
        \ 'S' : 'SL',
        \ '\<C-s>': 'SB',
        \ 't': 'T',
        \ },
      \ }


" key binding for window navigation
nnoremap <leader>wh <C-w>h
nnoremap <leader>wl <C-w>l
nnoremap <leader>wj <C-w>j
nnoremap <leader>wk <C-w>k
nnoremap <leader>w/ <C-w>v
nnoremap <leader>w- <C-w>s
nnoremap <leader>wd <C-w>q

nnoremap <silent> ]h :GitGutterNextHunk<CR>:GitGutterPreviewHunk<CR>
nnoremap <silent> [h :GitGutterPrevHunk<CR>:GitGutterPreviewHunk<CR>

inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

"" neomake configuration
"call neomake#configure#automake('nrwi', 300)

xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
