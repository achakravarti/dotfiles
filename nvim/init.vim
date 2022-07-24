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
autocmd filetype sql,cpp,javascript,python,css setlocal tabstop=4 shiftwidth=4 expandtab
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
"Plug 'preservim/tagbar'
Plug 'ludovicchabant/vim-gutentags'
Plug 'wakatime/vim-wakatime'

"Plug 'mhinz/vim-startify'
"Plug 'itchyny/lightline.vim'
"Plug 'maximbaz/lightline-ale'
"Plug 'mengelbrecht/lightline-bufferline'

Plug 'arcticicestudio/nord-vim'
"Plug 'shaunsingh/nord.nvim'
"Plug 'ayu-theme/ayu-vim'
Plug 'Shatur/neovim-ayu'
"Plug 'ryanoasis/vim-devicons'
Plug 'lifepillar/pgsql.vim'
Plug 'jsborjesson/vim-uppercase-sql'

Plug 'chrisbra/unicode.vim'

Plug 'kyazdani42/nvim-web-devicons'
"Plug 'kyazdani42/nvim-tree.lua'
"Plug 'feline-nvim/feline.nvim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'goolord/alpha-nvim'
Plug 'neovim/nvim-lspconfig'
"Plug 'liuchengxu/vista.vim'
Plug 'simrat39/symbols-outline.nvim'
Plug 'folke/zen-mode.nvim'
Plug 'folke/twilight.nvim'

Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'

Plug 'MunifTanjim/nui.nvim'
Plug 'nvim-neo-tree/neo-tree.nvim'
Plug 'akinsho/bufferline.nvim'
Plug 'nvim-treesitter/nvim-treesitter'

Plug 'nanotee/sqls.nvim'


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
	let g:nord_italic = v:false
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

"let g:tagbar_right=1
"let g:tagbar_vertical=40
"let g:tagbar_map_showproto="K"


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" key mappings
" https://stackoverflow.com/questions/446269/
"

nnoremap <SPACE> <Nop>
let mapleader=" "

"nnoremap <F2> :copen<bar> :NvimTreeOpen<CR> :TagbarToggle<CR> <C-w>l :vsp<CR> :vsp<CR>
nnoremap <F2> :copen<bar> :NeoTreeShow<CR> :Vista<CR> <C-w>l :vsp<CR> :vsp<CR> :vsp<CR>

nnoremap <F9> <C-w>k <C-w>3h
"nnoremap <F10> :NvimTreeFindFile<CR>
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



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Feline
" "

lua << EOF
--require'feline'.setup {}
require('lualine').setup()
EOF

set termguicolors " this variable must be enabled for colors to be applied properly


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
lua require('plugins/nvim-lspconfig')
lua require('plugins/nvim-cmp')
"lua require('plugins/vista')
lua require('plugins/symbols-outline')


lua << EOF
require("neo-tree").setup({
        close_if_last_window = false, -- Close Neo-tree if it is the last window left in the tab
        popup_border_style = "rounded",
        enable_git_status = true,
        enable_diagnostics = true,
        default_component_configs = {
          indent = {
            indent_size = 2,
            padding = 1, -- extra padding on left hand side
            with_markers = true,
            indent_marker = "│",
            last_indent_marker = "└",
            highlight = "NeoTreeIndentMarker",
          },
          icon = {
            folder_closed = "",
            folder_open = "",
            folder_empty = "ﰊ",
            default = "*",
          },
          name = {
            trailing_slash = false,
            use_git_status_colors = true,
          },
          git_status = {
            highlight = "NeoTreeDimText", -- if you remove this the status will be colorful
          },
        },
        filesystem = {
          filters = { --These filters are applied to both browsing and searching
            show_hidden = true,
            respect_gitignore = true,
          },
          follow_current_file = true, -- This will find and focus the file in the active buffer every
                                       -- time the current file is changed while the tree is open.
          use_libuv_file_watcher = false, -- This will use the OS level file watchers
                                          -- to detect changes instead of relying on nvim autocmd events.
          hijack_netrw_behavior = -- "open_default", -- netrw disabled, opening a directory opens neo-tree
                                                  -- in whatever position is specified in window.position
                                "open_split",  -- netrw disabled, opening a directory opens within the
                                                  -- window like netrw would, regardless of window.position
                                -- "disabled",    -- netrw left alone, neo-tree does not handle opening dirs
          window = {
            position = "left",
            width = 40,
            mappings = {
              ["<2-LeftMouse>"] = "open",
              ["<cr>"] = "open",
              ["S"] = "open_split",
              ["s"] = "open_vsplit",
              ["c"] = "close_node",
              ["<bs>"] = "navigate_up",
              ["."] = "set_root",
              ["H"] = "toggle_hidden",
              ["I"] = "toggle_gitignore",
              ["R"] = "refresh",
              ["/"] = "fuzzy_finder",
              --["/"] = "filter_as_you_type", -- this was the default until v1.28
              --["/"] = "none" -- Assigning a key to "none" will remove the default mapping
              ["f"] = "filter_on_submit",
              ["<c-x>"] = "clear_filter",
              ["a"] = "add",
              ["d"] = "delete",
              ["r"] = "rename",
              ["C"] = "copy_to_clipboard",
              ["x"] = "cut_to_clipboard",
              ["p"] = "paste_from_clipboard",
              ["m"] = "move", -- takes text input for destination
              ["q"] = "close_window",
            }
          }
        },
        buffers = {
          show_unloaded = true,
          window = {
            position = "left",
            mappings = {
              ["<2-LeftMouse>"] = "open",
              ["<cr>"] = "open",
              ["S"] = "open_split",
              ["s"] = "open_vsplit",
              ["<bs>"] = "navigate_up",
              ["."] = "set_root",
              ["R"] = "refresh",
              ["a"] = "add",
              ["d"] = "delete",
              ["r"] = "rename",
              ["c"] = "copy_to_clipboard",
              ["x"] = "cut_to_clipboard",
              ["p"] = "paste_from_clipboard",
              ["bd"] = "buffer_delete",
            }
          },
        },
        git_status = {
          window = {
            position = "float",
            mappings = {
              ["<2-LeftMouse>"] = "open",
              ["<cr>"] = "open",
              ["S"] = "open_split",
              ["s"] = "open_vsplit",
              ["C"] = "close_node",
              ["R"] = "refresh",
              ["d"] = "delete",
              ["r"] = "rename",
              ["c"] = "copy_to_clipboard",
              ["x"] = "cut_to_clipboard",
              ["p"] = "paste_from_clipboard",
              ["A"]  = "git_add_all",
              ["gu"] = "git_unstage_file",
              ["ga"] = "git_add_file",
              ["gr"] = "git_revert_file",
              ["gc"] = "git_commit",
              ["gp"] = "git_push",
              ["gg"] = "git_commit_and_push",
            }
          }
        }
      })
EOF

lua << EOF
require('bufferline').setup{}
EOF

lua << EOF
require('nvim-treesitter.configs').setup {
  highlight = {
    enable = true,
  },
}
EOF

lua << EOF
  require("zen-mode").setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  }
EOF

lua << EOF
  require("twilight").setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  }
EOF

lua << EOF
	require('lspconfig').sqls.setup{
    on_attach = function(client, bufnr)
        require('sqls').on_attach(client, bufnr)
    end
}
EOF

