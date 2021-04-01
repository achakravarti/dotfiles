""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" basic settings
"

set nocompatible
set encoding=utf-8
set fileencoding=utf-8
set ambiwidth=single
set number
set nowrap
set showcmd
filetype plugin indent on


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" indentation settings
"

set textwidth=80
set colorcolumn=+1
autocmd filetype c,cpp setlocal ts=8 softtabstop=8 shiftwidth=8 expandtab
autocmd filetype javascript,python,css setlocal tabstop=4 shiftwidth=4 expandtab
autocmd filetype html,htmldjango,latex setlocal tabstop=2 shiftwidth=2 expandtab


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" load plugins
"
call plug#begin(stdpath('data') . '/plugged')

Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
Plug 'airblade/vim-gitgutter'

Plug 'airblade/vim-rooter'
Plug 'voldikss/vim-floaterm'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'mhinz/vim-startify'
Plug 'itchyny/lightline.vim'

Plug 'arcticicestudio/nord-vim'
Plug 'ayu-theme/ayu-vim'
Plug 'ryanoasis/vim-devicons'

call plug#end()



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" colour settings
" https://github.com/alacritty/alacritty/issues/109
" https://shuheikagawa.com/blog/2020/02/14/switching-colorschemes-of-vim-and-alacritty/
" https://stackoverflow.com/questions/7588531/
"

syntax on
set hlsearch
set cursorline
hi cursorline cterm=NONE ctermbg=254 ctermfg=NONE

if has('termguicolors')
    set termguicolors
    execute "set t_8f=\e[38;2;%lu;%lu;%lum"
    execute "set t_8b=\e[48;2;%lu;%lu;%lum"
endif

if strftime("%H") >= 5 && strftime("%H") <= 17
	set background=light
    	let ayucolor="light"
    	colorscheme ayu
else
    	set background=dark
    	colorscheme nord
endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" airblade/vim-gitgutter settings
"

let g:gitgutter_enabled=1
let g:gitgutter_signs=1
let g:gitgutter_highlight_lines=0


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" junegunn/fzf.vim settings
" https://dev.to/zanets/fancy-fzf-on-neovim-41m8
"

let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.5, 'highlight': 'Comment' } }



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" itchyny/lightline settings
" https://github.com/itchyny/lightline.vim
" https://newbilityvery.github.io/2017/08/04/switch-to-lightline/
" https://github.com/ryanoasis/vim-devicons/blob/master/doc/webdevicons.txt
"

let g:lightline = {
  \   'colorscheme': 'nord',
  \   'active': {
  \     'left':[ [ 'mode', 'paste' ],
  \              [ 'gitbranch', 'readonly', 'filename', 'modified' ]
  \     ],
  \     'right': [[ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_infos', 'linter_ok', 'filetype', 'fileformat', 'lineinfo', ]]
  \   },
	\   'component': {
	\     'lineinfo': ' %3l:%-2v',
	\   },
  \   'component_function': {
  \     'gitbranch': 'MyGitbranch',
  \     'filetype': 'MyFiletype',
  \     'fileformat': 'MyFileformat',
  \   }
  \ }

let g:lightline.separator = { 'left': '', 'right': '' }
let g:lightline.subseparator = { 'left': '', 'right': '' }

function! MyFiletype()
	return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : WebDevIconsGetFileTypeSymbol()
endfunction

function! MyFileformat()
	return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : WebDevIconsGetFileFormatSymbol()
endfunction

function! MyGitbranch()
	return '' . ' ' . FugitiveHead()
endfunction


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" key mappings
" https://stackoverflow.com/questions/446269/
"

nnoremap <SPACE> <Nop>
let mapleader=" "
nnoremap <silent> <leader>f :Files<CR>

