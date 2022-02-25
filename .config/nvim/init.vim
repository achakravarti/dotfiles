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

set autoindent
set smartindent
set textwidth=80
set colorcolumn=+1
autocmd filetype c setlocal ts=8 softtabstop=8 shiftwidth=8 expandtab
autocmd filetype cpp,javascript,python,css setlocal tabstop=4 shiftwidth=4 expandtab
autocmd filetype cucumber,html,htmldjango,latex,tex,plaintex setlocal tabstop=2 shiftwidth=2 expandtab


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" load plugins
"
call plug#begin(stdpath('data') . '/plugged')

Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
Plug 'airblade/vim-gitgutter'

Plug 'airblade/vim-rooter'
Plug 'voldikss/vim-floaterm'
"Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
"Plug 'junegunn/fzf.vim'
Plug 'dense-analysis/ale'

"Plug 'preservim/nerdtree'
"Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'preservim/tagbar'
Plug 'ludovicchabant/vim-gutentags'
Plug 'wakatime/vim-wakatime'

"Plug 'mhinz/vim-startify'
"Plug 'itchyny/lightline.vim'
"Plug 'maximbaz/lightline-ale'
"Plug 'mengelbrecht/lightline-bufferline'

Plug 'arcticicestudio/nord-vim'
Plug 'ayu-theme/ayu-vim'
"Plug 'ryanoasis/vim-devicons'
Plug 'lifepillar/pgsql.vim'

Plug 'chrisbra/unicode.vim'

Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'feline-nvim/feline.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'goolord/alpha-nvim'
Plug 'neovim/nvim-lspconfig'

Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'


call plug#end()



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" colour settings
" https://github.com/alacritty/alacritty/issues/109
" https://shuheikagawa.com/blog/2020/02/14/switching-colorschemes-of-vim-and-alacritty/
" https://stackoverflow.com/questions/7588531/
" https://vi.stackexchange.com/questions/2222/                                                                                                                                                                                                                                                                             
"

syntax on
set hlsearch
set cursorline
hi cursorline cterm=NONE ctermbg=254 ctermfg=NONE

let g:sql_type_default = 'pgsql'

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
  
syn match Low /\v(.+)\n(\1\n)/                                                                                                                                                                                                                                                                                             
syn match Medium /\v(.+)\n(\1\n){2,4}/                                                                                                                                                                                                                                                                                    
syn match Critical /\v(.+)\n(\1\n){5,}/                                                                                                                                                                                                                                                                                    
hi Critical ctermfg=red                                                                                                                                                                                                                                                                                                    
hi Medium ctermfg=yellow                                                                                                                                                                                                                                                                                                   
hi Low ctermfg=green                                                                                                                                                                                                                                                                                                       
                                             



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
"let g:fzf_layout = { 'down': '~40%' }

"let g:fzf_colors =
"\ { 'fg':      ['fg', 'Normal'],
  "\ 'bg':      ['bg', 'Normal'],
  "\ 'hl':      ['fg', 'Comment'],
  "\ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  "\ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  "\ 'hl+':     ['fg', 'Statement'],
  "\ 'info':    ['fg', 'PreProc'],
  "\ 'border':  ['fg', 'Keyword'],
  "\ 'prompt':  ['fg', 'Conditional'],
  "\ 'pointer': ['fg', 'Exception'],
  "\ 'marker':  ['fg', 'Keyword'],
  "\ 'spinner': ['fg', 'Label'],
  "\ 'header':  ['fg', 'Comment'] }



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" itchyny/lightline related settings
" https://github.com/itchyny/lightline.vim
" https://newbilityvery.github.io/2017/08/04/switch-to-lightline/
" https://github.com/ryanoasis/vim-devicons/blob/master/doc/webdevicons.txt
"

"function! MyFiletype()
	"return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : WebDevIconsGetFileTypeSymbol()
"endfunction
"
"function! MyFileformat()
	"return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : WebDevIconsGetFileFormatSymbol()
"endfunction
"
"function! MyGitbranch()
	"return '' . ' ' . FugitiveHead()
"endfunction
"
"let g:lightline = {
  "\   'colorscheme': 'nord',
  "\   'active': {
  "\     'left':[ [ 'mode', 'paste' ],
  "\              [ 'gitbranch', 'readonly', 'filename', 'modified' ]
  "\     ],
  "\     'right': [[ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_infos', 'linter_ok', 'filetype', 'fileformat', 'lineinfo', ]]
  "\   },
  "\'tabline': { 'left': [ [ 'buffers' ] ], 'right': [ ['close'] ] },
	"\   'component': {
	"\     'lineinfo': ' %3l:%-2v',
	"\   },
  "\   'component_function': {
  "\     'gitbranch': 'MyGitbranch',
  "\     'filetype': 'MyFiletype',
  "\     'fileformat': 'MyFileformat',
  "\   }
  "\ }
"
"let g:lightline.separator = { 'left': '', 'right': '' }
"let g:lightline.subseparator = { 'left': '', 'right': '' }
"
"let g:lightline.component_expand = {
      "\  'linter_checking': 'lightline#ale#checking',
      "\  'linter_infos': 'lightline#ale#infos',
      "\  'linter_warnings': 'lightline#ale#warnings',
      "\  'linter_errors': 'lightline#ale#errors',
      "\  'linter_ok': 'lightline#ale#ok',
      "\  'buffers': 'lightline#bufferline#buffers',
      "\ }
"
"let g:lightline.component_type = {
      "\     'linter_checking': 'right',
      "\     'linter_infos': 'right',
      "\     'linter_warnings': 'warning',
      "\     'linter_errors': 'error',
      "\     'linter_ok': 'right',
      "\	    'buffers': 'tabsel',
      "\ }
"
"let g:lightline#bufferline#enable_devicons=1
"let g:lightline#bufferline#show_number=2


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree related configuration
"

"let g:NERDTreeWinPos='left'
"let g:NERDTreeQuitOnOpen=0
"let g:NERDTreeWinSize=50
"let g:NERDTreeSortOrder=['\/$', '*', '[[extension]]']
"let NERDTreeIgnore=['\.o$', '\~$', '\.gcno$', '\.gcda$']
"let g:NERDTreeGitStatusIndicatorMapCustom = {
        "\ 'Modified'  :'✹',
        "\ 'Staged'    :'✚',
        "\ 'Untracked' :'✭',
        "\ 'Renamed'   :'➜',
        "\ 'Unmerged'  :'═',
        "\ 'Deleted'   :'✖',
        "\ 'Dirty'     :'✗',
        "\ 'Ignored'   :'☒',
        "\ 'Clean'     :'✔︎',
        "\ 'Unknown'   :'?',
"\ }


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Git gutter configuration
"

let g:gitgutter_sign_added='✚'
let g:gitgutter_sign_modified='✹'
let g:gitgutter_sign_removed='✗'


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ALE options
"

let g:ale_set_quickfix=1
let g:ale_sign_column_always=1
let g:ale_sign_error="\uf05e"
let g:ale_sign_warning="\uf071"

"let g:lightline#ale#indicator_checking="\uf110 "
"let g:lightline#ale#indicator_infos="\uf129 "
"let g:lightline#ale#indicator_warnings="\uf071 "
"let g:lightline#ale#indicator_errors="\uf05e "
"let g:lightline#ale#indicator_ok="\uf00c"


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tagbar configuration
"

let g:tagbar_left=1
let g:tagbar_vertical=40
let g:tagbar_map_showproto="K"


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" key mappings
" https://stackoverflow.com/questions/446269/
"

nnoremap <SPACE> <Nop>
let mapleader=" "

nnoremap <F2> :copen<bar> :NvimTreeOpen<CR> :TagbarToggle<CR> <C-w>l :vsp<CR> :vsp<CR>

nnoremap <F9> <C-w>k <C-w>3h
nnoremap <F10> :NvimTreeFindFile<CR>
nnoremap <F11> <C-w>3l <C-w>j

nmap <leader><TAB> <C-w>w
nmap <leader>1 <C-w>k <C-w>3h <C-w>k <C-w>l
nmap <leader>2 <C-w>k <C-w>3h <C-w>k <C-w>2l
nmap <leader>3 <C-w>k <C-w>3h <C-w>k <C-w>3l
nmap <leader>q <C-w>k <C-w>3h <C-w>k
nmap <leader>w :NvimTreeFindFile<CR>
nmap <leader>e <C-w>k <C-w>3h <C-w>k <C-w>3l <C-w>j

nmap <leader>b<TAB> :bnext<CR>
"nmap <leader>b1 <Plug>lightline#bufferline#go(1)
"nmap <leader>b2 <Plug>lightline#bufferline#go(2)
"nmap <leader>b3 <Plug>lightline#bufferline#go(3)
"nmap <leader>b4 <Plug>lightline#bufferline#go(4)
"nmap <leader>b5 <Plug>lightline#bufferline#go(5)
"nmap <leader>b6 <Plug>lightline#bufferline#go(6)
"nmap <leader>b7 <Plug>lightline#bufferline#go(7)
"nmap <leader>b8 <Plug>lightline#bufferline#go(8)
"nmap <leader>b9 <Plug>lightline#bufferline#go(9)
"nmap <leader>b0 <Plug>lightline#bufferline#go(10)

"nmap <leader>d1 <Plug>lightline#bufferline#delete(1)
"nmap <leader>d2 <Plug>lightline#bufferline#delete(2)
"nmap <leader>d3 <Plug>lightline#bufferline#delete(3)
"nmap <leader>d4 <Plug>lightline#bufferline#delete(4)
"nmap <leader>d5 <Plug>lightline#bufferline#delete(5)
"nmap <leader>d6 <Plug>lightline#bufferline#delete(6)
"nmap <leader>d7 <Plug>lightline#bufferline#delete(7)
"nmap <leader>d8 <Plug>lightline#bufferline#delete(8)
"nmap <leader>d9 <Plug>lightline#bufferline#delete(9)
"nmap <leader>d0 <Plug>lightline#bufferline#delete(10)

nnoremap <silent> <leader><SPACE> :FloatermToggle<CR>

"nnoremap <silent> <leader>c :Buffers<CR>
"nnoremap <silent> <leader>c :BCommits<CR>
"nnoremap <silent> <leader>cc :Commits<CR>
"nnoremap <silent> <leader>f :Files<CR>
"nnoremap <silent> <leader>ff :Files ~<CR>
"nnoremap <silent> <leader>rg :Rg<CR>
"nnoremap <silent> <leader>s :GFiles?<CR>
"nnoremap <silent> <leader>S :GFiles<CR>

noremap <silent> <leader>g :Git<CR>
noremap <silent> <leader>gp :Git push<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Nvim Web Devicons
" "

lua << EOF
require'nvim-web-devicons'.setup {
 -- your personnal icons can go here (to override)
 -- you can specify color or cterm_color instead of specifying both of them
 -- DevIcon will be appended to `name`
 override = {
  zsh = {
    icon = "",
    color = "#428850",
    cterm_color = "65",
    name = "Zsh"
  }
 };
 -- globally enable default icons (default to false)
 -- will get overriden by `get_icons` option
 default = true;
}
EOF


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Feline
" "

lua << EOF
require'feline'.setup {}
EOF


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Nvim Tree
" "

" vimrc
let g:nvim_tree_indent_markers = 1 "0 by default, this option shows indent markers when folders are open
let g:nvim_tree_git_hl = 1 "0 by default, will enable file highlight for git attributes (can be used without the icons).
let g:nvim_tree_highlight_opened_files = 1 "0 by default, will enable folder and file icon highlight for opened files/directories.
let g:nvim_tree_root_folder_modifier = ':~' "This is the default. See :help filename-modifiers for more options
let g:nvim_tree_add_trailing = 1 "0 by default, append a trailing slash to folder names
let g:nvim_tree_group_empty = 1 " 0 by default, compact folders that only contain a single folder into one node in the file tree
let g:nvim_tree_icon_padding = ' ' "one space by default, used for rendering the space between the icon and the filename. Use with caution, it could break rendering if you set an empty string depending on your font.
let g:nvim_tree_symlink_arrow = ' >> ' " defaults to ' ➛ '. used as a separator between symlinks' source and target.
let g:nvim_tree_respect_buf_cwd = 1 "0 by default, will change cwd of nvim-tree to that of new buffer's when opening nvim-tree.
let g:nvim_tree_create_in_closed_folder = 1 "0 by default, When creating files, sets the path of a file when cursor is on a closed folder to the parent folder when 0, and inside the folder when 1.
let g:nvim_tree_special_files = { 'README.md': 1, 'Makefile': 1, 'MAKEFILE': 1 } " List of filenames that gets highlighted with NvimTreeSpecialFile
let g:nvim_tree_show_icons = {
    \ 'git': 1,
    \ 'folders': 1,
    \ 'files': 1,
    \ 'folder_arrows': 1,
    \ }
"If 0, do not show the icons for one of 'git' 'folder' and 'files'
"1 by default, notice that if 'files' is 1, it will only display
"if nvim-web-devicons is installed and on your runtimepath.
"if folder is 1, you can also tell folder_arrows 1 to show small arrows next to the folder icons.
"but this will not work when you set indent_markers (because of UI conflict)

" default will show icon by default if no icon is provided
" default shows no icon by default
let g:nvim_tree_icons = {
    \ 'default': '',
    \ 'symlink': '',
    \ 'git': {
    \   'unstaged': "✗",
    \   'staged': "✓",
    \   'unmerged': "",
    \   'renamed': "➜",
    \   'untracked': "★",
    \   'deleted': "",
    \   'ignored': "◌"
    \   },
    \ 'folder': {
    \   'arrow_open': "",
    \   'arrow_closed': "",
    \   'default': "",
    \   'open': "",
    \   'empty': "",
    \   'empty_open': "",
    \   'symlink': "",
    \   'symlink_open': "",
    \   }
    \ }

nnoremap <C-n> :NvimTreeToggle<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>
nnoremap <leader>n :NvimTreeFindFile<CR>
" NvimTreeOpen, NvimTreeClose, NvimTreeFocus, NvimTreeFindFileToggle, and NvimTreeResize are also available if you need them

set termguicolors " this variable must be enabled for colors to be applied properly

" a list of groups can be found at `:help nvim_tree_highlight`
highlight NvimTreeFolderIcon guibg=blue


""
"" Telescope

nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
lua << EOF
require('telescope').setup{
}
EOF


lua require('plugins/alpha-nvim')
lua require('plugins/nvim-tree')
lua require('plugins/nvim-lspconfig')
lua require('plugins/nvim-cmp')

