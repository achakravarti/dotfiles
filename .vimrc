" load plugins
" https://github.com/VundleVim/Vundle.vim
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'junegunn/gv.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'wakatime/vim-wakatime'
Plugin 'vshih/vim-make'
Plugin 'preservim/nerdtree'
"Plugin 'vim-airline/vim-airline'
Plugin 'itchyny/lightline.vim'
Plugin 'maximbaz/lightline-ale'
Plugin 'edkolev/promptline.vim'
Plugin 'vim-scripts/taglist.vim'
Plugin 'ludovicchabant/vim-gutentags'
Plugin 'w0rp/ale'
Plugin 'arcticicestudio/nord-vim'
Plugin 'ayu-theme/ayu-vim'
Plugin 'frazrepo/vim-rainbow'
Plugin 'Shougo/deoplete.nvim'
Plugin 'roxma/nvim-yarp'
Plugin 'roxma/vim-hug-neovim-rpc'
Plugin 'deoplete-plugins/deoplete-clang'
Plugin 'mhinz/vim-startify'
Plugin 'ryanoasis/vim-devicons'
Plugin 'lifepillar/pgsql.vim'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'bling/vim-bufferline'
call vundle#end()
filetype plugin indent on

" enable UTF-8
set encoding=utf-8
set fileencoding=utf-8

" enable line numbering and automatic change of working directory
set number
set autochdir

" set line width to 80 characters, along with a marker on column 81
set nowrap
set textwidth=80
set colorcolumn=+1

" enable syntax and cursor line highlighting
syntax on
set hlsearch
set cursorline
hi CursorLine cterm=NONE ctermbg=254 ctermfg=NONE


" https://stackoverflow.com/questions/7262536/
" count selected lines
set showcmd

" set indentation for different file types
autocmd filetype c,cpp setlocal ts=8 softtabstop=8 shiftwidth=8 expandtab
autocmd filetype javascript,python,css setlocal tabstop=4 shiftwidth=4 expandtab
autocmd filetype html,htmldjango,latex setlocal tabstop=2 shiftwidth=2 expandtab

" map <SPACE> as leader
" https://stackoverflow.com/questions/446269/
nnoremap <SPACE> <Nop>
let mapleader=" "


" map <F5> key to create my favourite programming layout
" map <F12> to toggle nerdtree
" map <F2> to jump to Taglist pane in my favourite programming layout
" https://vi.stackexchange.com/questions/454/
" https://vimtricks.com/essentials/2018/08/29/grep-current-word/
nnoremap <F5> :Tlist<CR><bar>:vsp<CR><bar>:vsp<CR><bar>:botright copen<CR><bar>:vsp<CR><bar>:terminal++curwin<CR><C-w>k<bar><C-w>l
nnoremap <F12> :NERDTreeToggle<CR>
nnoremap <F2> <C-w>k<C-w>3h
nnoremap <F8> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>
map <leader>* :Ggrep <cword><CR><CR>

nnoremap <silent> <leader><SPACE> :Files<CR>


" enable gui colours in terminal 
" https://github.com/alacritty/alacritty/issues/109
" https://shuheikagawa.com/blog/2020/02/14/switching-colorschemes-of-vim-and-alacritty/
if has('termguicolors')
    set termguicolors
    execute "set t_8f=\e[38;2;%lu;%lu;%lum"
    execute "set t_8b=\e[48;2;%lu;%lu;%lum"
endif

" set ayu colour scheme during the day, and nord at night
" https://stackoverflow.com/questions/7588531/
if strftime("%H") >= 5 && strftime("%H") <= 17
	set background=light
    	let ayucolor="light"
    	colorscheme ayu
else
    	set background=dark
    	colorscheme nord
endif


" GVim specific settings
" https://github.com/ryanoasis/vim-devicons/issues/133
if has("gui_running")
	set guifont=Hack\ Nerd\ Font\ Regular\ 8
	set guioptions=ae
	autocmd FileType nerdtree setlocal ambiwidth=double
	autocmd FileType startify setlocal ambiwidth=double
endif





" automatically reload vim configuration on every save
" this allows the above colour change to occur without restarting vim
" https://vi.stackexchange.com/questions/24/
" autocmd BufWritePost * source $MYVIMRC


" enable rainbow parentheses for Lisp dialects
au FileType lisp,scheme call rainbow#load()


" allow :make to run from parent directory and prevent Make plugin closing qfix
" https://stackoverflow.com/questions/15306371/
let &makeprg = 'if [ -f Makefile ]; then make; else make -C ..; fi'
let g:Make_quickfix_always_open=1


" enable NERDTree on the right side and close on opening file
let g:NERDTreeWinPos="right"
let g:NERDTreeQuitOnOpen=1
let g:NERDTreeWinSize=60
let g:NERDTreeSortOrder=['\/$', '*', '[[extension]]']


" enable airline and integrate with ALE
" let g:powerline_pycmd="py3"
" let g:airline_powerline_fonts=1
" let g:airline#extenions#ale#enabled=1
" let g:airline#extensions#ale#enabled = 1

" set Taglist to show tags only for active buffer on the left side
let g:Tlist_Show_One_File=1
let g:Tlist_Use_Right_Window=0
let g:Tlist_WinWidth=40


" enable gitgutter plugin
let g:gitgutter_enabled=1
let g:gitgutter_signs=1
let g:gitgutter_highlight_lines=0

" ALE options
let g:ale_sign_column_always=1
let g:ale_sign_error="\uf05e"
let g:ale_sign_warning="\uf071"


" enable deoplete and deoplete plugins
" https://github.com/deoplete-plugins/deoplete-clang
let g:deoplete#enable_at_startup = 1
let g:deoplete#clang#libclang_path='/usr/lib/libclang.so'
let g:deoplete#sources#clang#libclang_path='/usr/lib/clang'

" enable pgsql plugin
let g:sql_type_default='pgsql'

let g:fzf_layout={'window': {'width': 0.9, 'height': 0.6, 'border': 'rounded'}}

" itchyny/lightline config
" https://github.com/itchyny/lightline.vim
" https://newbilityvery.github.io/2017/08/04/switch-to-lightline/
" https://github.com/ryanoasis/vim-devicons/blob/master/doc/webdevicons.txt
set laststatus=2
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
  \     'gitbranch': 'FugitiveHead',
  \     'filetype': 'MyFiletype',
  \     'fileformat': 'MyFileformat',
  \   }
  \ }

let g:lightline.separator = {
	\   'left': '', 'right': ''
  \}
let g:lightline.subseparator = {
	\   'left': '', 'right': ''
	\}

function! MyFiletype()
    return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : WebDevIconsGetFileTypeSymbol()
  endfunction

  function! MyFileformat()
    return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : WebDevIconsGetFileFormatSymbol()
  endfunction

" maximbaz/lightline-ale configuration
let g:lightline.component_expand = {
      \  'linter_checking': 'lightline#ale#checking',
      \  'linter_infos': 'lightline#ale#infos',
      \  'linter_warnings': 'lightline#ale#warnings',
      \  'linter_errors': 'lightline#ale#errors',
      \  'linter_ok': 'lightline#ale#ok',
      \ }

let g:lightline.component_type = {
      \     'linter_checking': 'right',
      \     'linter_infos': 'right',
      \     'linter_warnings': 'warning',
      \     'linter_errors': 'error',
      \     'linter_ok': 'right',
      \ }


let g:lightline#ale#indicator_checking="\uf110 "
let g:lightline#ale#indicator_infos="\uf129 "
let g:lightline#ale#indicator_warnings="\uf071 "
let g:lightline#ale#indicator_errors="\uf05e "
let g:lightline#ale#indicator_ok="\uf00c"

