""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" basic settings
"

filetype plugin indent on
set nocompatible
set encoding=utf-8
set fileencoding=utf-8
set ambiwidth=single
set number
set nowrap
set showcmd
set showtabline=2
set incsearch

if has('nvim')
	set inccommand=nosplit
endif


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
Plug 'dense-analysis/ale'

Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'preservim/tagbar'
Plug 'ludovicchabant/vim-gutentags'

Plug 'mhinz/vim-startify'
Plug 'itchyny/lightline.vim'
Plug 'maximbaz/lightline-ale'
Plug 'mengelbrecht/lightline-bufferline'

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
" https://github.com/junegunn/fzf/blob/master/README-VIM.md
"

"let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.5, 'highlight': 'Comment' } }
let g:fzf_layout = { 'down': '~40%' }

let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Keyword'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" itchyny/lightline related settings
" https://github.com/itchyny/lightline.vim
" https://newbilityvery.github.io/2017/08/04/switch-to-lightline/
" https://github.com/ryanoasis/vim-devicons/blob/master/doc/webdevicons.txt
"

function! MyFiletype()
	return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : WebDevIconsGetFileTypeSymbol()
endfunction

function! MyFileformat()
	return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : WebDevIconsGetFileFormatSymbol()
endfunction

function! MyGitbranch()
	return '' . ' ' . FugitiveHead()
endfunction

let g:lightline = {
  \   'colorscheme': 'nord',
  \   'active': {
  \     'left':[ [ 'mode', 'paste' ],
  \              [ 'gitbranch', 'readonly', 'filename', 'modified' ]
  \     ],
  \     'right': [[ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_infos', 'linter_ok', 'filetype', 'fileformat', 'lineinfo', ]]
  \   },
  \'tabline': { 'left': [ [ 'buffers' ] ], 'right': [ ['close'] ] },
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

let g:lightline.component_expand = {
      \  'linter_checking': 'lightline#ale#checking',
      \  'linter_infos': 'lightline#ale#infos',
      \  'linter_warnings': 'lightline#ale#warnings',
      \  'linter_errors': 'lightline#ale#errors',
      \  'linter_ok': 'lightline#ale#ok',
      \  'buffers': 'lightline#bufferline#buffers',
      \ }

let g:lightline.component_type = {
      \     'linter_checking': 'right',
      \     'linter_infos': 'right',
      \     'linter_warnings': 'warning',
      \     'linter_errors': 'error',
      \     'linter_ok': 'right',
      \	    'buffers': 'tabsel',
      \ }

let g:lightline#ale#indicator_checking="\uf110 "
let g:lightline#ale#indicator_infos="\uf129 "
let g:lightline#ale#indicator_warnings="\uf071 "
let g:lightline#ale#indicator_errors="\uf05e "
let g:lightline#ale#indicator_ok="\uf00c"

let g:lightline#bufferline#enable_devicons=1
let g:lightline#bufferline#show_number=2


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree related configuration
"

let g:NERDTreeWinPos='left'
let g:NERDTreeQuitOnOpen=0
let g:NERDTreeWinSize=50
let g:NERDTreeSortOrder=['\/$', '*', '[[extension]]']

let g:NERDTreeGitStatusIndicatorMapCustom = {
        \ 'Modified'  :'✹',
        \ 'Staged'    :'✚',
        \ 'Untracked' :'✭',
        \ 'Renamed'   :'➜',
        \ 'Unmerged'  :'═',
        \ 'Deleted'   :'✖',
        \ 'Dirty'     :'✗',
        \ 'Ignored'   :'☒',
        \ 'Clean'     :'✔︎',
        \ 'Unknown'   :'?',
\ }


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Git gutter configuration
"

let g:gitgutter_sign_added = '✚'
let g:gitgutter_sign_modified = '✹'
let g:gitgutter_sign_removed = '✖'


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ALE options
"

let g:ale_sign_column_always=1
let g:ale_sign_error="\uf05e"
let g:ale_sign_warning="\uf071"


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tagbar configuration
"

let g:tagbar_left=1
let g:tagbar_vertical=40


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" key mappings
" https://stackoverflow.com/questions/446269/
"

nnoremap <SPACE> <Nop>
let mapleader=" "

nnoremap <silent> <leader>f :Files<CR>
nnoremap <silent> <leader>t :FloatermToggle<CR>

nnoremap <f5> :NERDTreeToggle<CR> :TagbarToggle<CR> <C-w>l :vsp<CR> :vsp<CR>

nmap <Leader>1 <Plug>lightline#bufferline#go(1)
nmap <Leader>2 <Plug>lightline#bufferline#go(2)
nmap <Leader>3 <Plug>lightline#bufferline#go(3)
nmap <Leader>4 <Plug>lightline#bufferline#go(4)
nmap <Leader>5 <Plug>lightline#bufferline#go(5)
nmap <Leader>6 <Plug>lightline#bufferline#go(6)
nmap <Leader>7 <Plug>lightline#bufferline#go(7)
nmap <Leader>8 <Plug>lightline#bufferline#go(8)
nmap <Leader>9 <Plug>lightline#bufferline#go(9)
nmap <Leader>0 <Plug>lightline#bufferline#go(10)

nmap <Leader>d1 <Plug>lightline#bufferline#delete(1)
nmap <Leader>d2 <Plug>lightline#bufferline#delete(2)
nmap <Leader>d3 <Plug>lightline#bufferline#delete(3)
nmap <Leader>d4 <Plug>lightline#bufferline#delete(4)
nmap <Leader>d5 <Plug>lightline#bufferline#delete(5)
nmap <Leader>d6 <Plug>lightline#bufferline#delete(6)
nmap <Leader>d7 <Plug>lightline#bufferline#delete(7)
nmap <Leader>d8 <Plug>lightline#bufferline#delete(8)
nmap <Leader>d9 <Plug>lightline#bufferline#delete(9)
nmap <Leader>d0 <Plug>lightline#bufferline#delete(10)

