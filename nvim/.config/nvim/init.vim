let g:polyglot_disabled = ['markdown']

call plug#begin(stdpath('data') . '/plugged')

Plug 'tpope/vim-endwise'
Plug 'tpope/vim-commentary'
" Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-abolish'
Plug 'airblade/vim-gitgutter'
Plug 'zivyangll/git-blame.vim'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'godlygeek/tabular'
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'editorconfig/editorconfig-vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Plug 'flazz/vim-colorschemes'
" Plug 'morhetz/gruvbox'
" Plug 'sainnhe/sonokai'
Plug 'joshdick/onedark.vim'
Plug 'mhinz/vim-startify'
Plug 'easymotion/vim-easymotion'

Plug 'Shougo/defx.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
Plug 'kristijanhusak/defx-git'
Plug 'kristijanhusak/defx-icons'

" Plug 'liuchengxu/vim-clap'

" Plug 'scrooloose/syntastic'
Plug 'ycm-core/YouCompleteMe', { 'do': './install.py --go-completer' }
Plug 'majutsushi/tagbar'
" Auto complete
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}

Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'sheerun/vim-polyglot'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'nvie/vim-flake8'

call plug#end()

set t_Co=256
set background=dark
set termguicolors
" colorscheme solarized
colorscheme onedark
" colorscheme contrastneed
" colorscheme gruvbox
" colorscheme sonokai

set number relativenumber                                       " display line number and relative line number
set colorcolumn=80
set numberwidth=5
set incsearch                                                   " do incremental searching
set hidden
set ruler
set showcmd
set autowrite
set tabstop=2                                                   " size of a hard tabstop

set shiftwidth=2                                                " size of an "indent"
set shiftround
set softtabstop=2
set expandtab
set autoindent
set smartindent
set smartcase

set list listchars=tab:¦\ ,trail:·,nbsp:·                       " display extra whitespace
hi SpecialKey ctermfg=66 guifg=#649A9A                          " change listchars color
set cursorline                                                  " highlight current line

set mouse=a
set completeopt-=preview

set ic                                                          " ignore case sensitive search
set backspace=indent,eol,start                                  " make backspace work as expected

set conceallevel=0                                              " display quote in json files

" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" hi CursorLine   cterm=NONE ctermbg=234 ctermfg=NONE
hi CursorLine ctermbg=234 guibg=#444444
" custom mappings
"----------------------------------------------------------------
imap ;; <Esc>
let mapleader=" "

" Copy selection to clipboard in visual mode
vnoremap <leader>c "*y

" Move to end of line in insert mode
inoremap ,, <C-o>$

" find current world quickly using fzf with ripgrep
nnoremap ff :Rg <C-R><C-W><CR>
" find current selected text in visual mode quickly using fzf with ripgrep
vnoremap ff y:Rg <C-R>"<CR>

" Move to the next buffer
nnoremap <silent> <c-l> :bnext<CR>
" Move to the previous buffer
nnoremap <silent> <c-h> :bprevious<CR>
" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nmap <leader>q :bp <BAR> bd #<CR>
" Switch to previously edited buffer
nnoremap <silent> <c-y> :b#<CR>
" Toggle highlight search
nmap <leader>m :set hlsearch!<cr>
" Add a new line without entering insert mode
nmap <leader>n o<Esc>
nmap <leader>N O<Esc>
" Toggle tagbar
nmap <leader>t :TagbarToggle<CR>

nmap <leader>s :w<CR>

" see git blame for line
nnoremap <Leader>g :<C-u>call gitblame#echo()<CR>
" autocmd CursorMoved * :call gitblame#echo()

" Keep the windows position when switching between buffers
au BufLeave * let b:winview = winsaveview()
au BufEnter * if(exists('b:winview')) | call winrestview(b:winview) | endif
"----------------------------------------------------------------

" Yaml settings
" au! BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml

autocmd FileType sh setlocal shiftwidth=2 softtabstop=2 expandtab

" Auto remove whitespaces when saving file
autocmd BufWritePre * :%s/\s\+$//e

" map j to gj and k to gk, so line navigation ignores line wrap
nnoremap k gk
nnoremap j gj
nnoremap 0 g0
nnoremap $ g$
nnoremap ^ g^

" split windows easier
nnoremap <leader>w <C-W>v<C-W>l

nnoremap <A-j> :m .+1<CR>==                                     " Move current line down
nnoremap <A-k> :m .-2<CR>==                                     " Move current line up
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" retain selection after moving block
vnoremap > >gv
vnoremap < <gv

" allow toggling between local and default mode
function TabToggle()
  if &expandtab
    set shiftwidth=8
    set softtabstop=0
    set noexpandtab
  else
    set shiftwidth=2
    set softtabstop=2
    set expandtab
  endif
endfunction
nmap <leader>] mz:execute TabToggle()<CR>'z

"----------------------------------------------------------------

" defx
noremap <leader>k :Defx -split=vertical -winwidth=50 -direction=topleft -resume -toggle -columns=mark:indent:icons:filename:type:git -ignored-files=.git,.*.sw*<CR><CR>
nnoremap vf :Defx -split=vertical -winwidth=50 -direction=topleft `escape(expand('%:p:h'), ' :')` -search=`expand('%:p')` -columns=mark:indent:icons:filename:type:git -ignored-files=.git,.*.sw*<CR><CR>

autocmd User DefxDirChanged
	\ echomsg 'defx current directory is changed'
autocmd BufWritePost * call defx#redraw()
autocmd FileType defx call s:defx_my_settings()

function! s:defx_my_settings() abort
  " Define mappings
  nnoremap <silent><buffer><expr> <CR>
  \ defx#is_directory() ?
    \ defx#do_action('open_tree', 'toggle') :
    \ defx#do_action('drop')
  nnoremap <silent><buffer><expr> c
  \ defx#do_action('copy')
  nnoremap <silent><buffer><expr> m
  \ defx#do_action('move')
  nnoremap <silent><buffer><expr> p
  \ defx#do_action('paste')
  function! CustomOpen(context) abort
    let is_directory = defx#is_directory()
    if is_directory
      call defx#call_action('open_tree')
      norm j
    else
      call defx#call_action('drop')
    endif
  endfunction
  nnoremap <silent><buffer><expr> l
    \ defx#do_action('call', 'CustomOpen')
  nnoremap <silent><buffer><expr> E
  \ defx#do_action('open', 'vsplit')
  nnoremap <silent><buffer><expr> P
  \ defx#do_action('open', 'pedit')
  nnoremap <silent><buffer><expr> o
  \ defx#do_action('open_tree', 'toggle')
  nnoremap <silent><buffer><expr> K
  \ defx#do_action('new_directory')
  nnoremap <silent><buffer><expr> N
  \ defx#do_action('new_file')
  nnoremap <silent><buffer><expr> M
  \ defx#do_action('new_multiple_files')
  nnoremap <silent><buffer><expr> C
  \ defx#do_action('toggle_columns',
  \                'mark:indent:icon:filename:type:size:time')
  nnoremap <silent><buffer><expr> S
  \ defx#do_action('toggle_sort', 'time')
  nnoremap <silent><buffer><expr> d
  \ defx#do_action('remove')
  nnoremap <silent><buffer><expr> r
  \ defx#do_action('rename')
  nnoremap <silent><buffer><expr> !
  \ defx#do_action('execute_command')
  nnoremap <silent><buffer><expr> x
  \ defx#do_action('execute_system')
  nnoremap <silent><buffer><expr> yy
  \ defx#do_action('yank_path')
  nnoremap <silent><buffer><expr> .
  \ defx#do_action('toggle_ignored_files')
  nnoremap <silent><buffer><expr> ;
  \ defx#do_action('repeat')
  nnoremap <silent><buffer><expr> h
  \ defx#do_action('close_tree')
  nnoremap <silent><buffer><expr> ~
  \ defx#do_action('cd')
  nnoremap <silent><buffer><expr> -
  \ defx#do_action('cd', ['..'])
  nnoremap <silent><buffer><expr> q
  \ defx#do_action('quit')
  nnoremap <silent><buffer><expr> 0
  \ defx#do_action('toggle_select') . 'j'
  nnoremap <silent><buffer><expr> *
  \ defx#do_action('toggle_select_all')
  nnoremap <silent><buffer><expr> j
  \ line('.') == line('$') ? 'gg' : 'j'
  nnoremap <silent><buffer><expr> k
  \ line('.') == 1 ? 'G' : 'k'
  nnoremap <silent><buffer><expr> <C-l>
  \ defx#do_action('redraw')
  nnoremap <silent><buffer><expr> <C-g>
  \ defx#do_action('print')
  nnoremap <silent><buffer><expr> cd
  \ defx#do_action('change_vim_cwd')
endfunction

let g:defx_git#raw_mode = 1
hi Defx_filename_directory guifg=#97C379

let g:defx_icons_column_length = 2

" custom commands
"----------------------------------------------------------------
"----------------------------------------------------------------

" airline config
"----------------------------------------------------------------
set laststatus=2
set encoding=utf-8
set ttimeoutlen=50
let g:airline_powerline_fonts = 1
let g:airline_exclude_preview = 1
let g:airline#extensions#tabline#enabled = 1                    " Enable the list of buffers
let g:airline#extensions#tabline#fnamemod = ':t'                " Show just the filename
" let g:airline_theme = 'term_light'
" let g:airline_theme = 'lucius'
let g:airline_theme = 'onedark'
"----------------------------------------------------------------
let g:lightline = {
  \ 'colorscheme': 'onedark',
  \ }

" syntastic config
"----------------------------------------------------------------
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

" let g:syntastic_always_populate_loc_list = 0
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0
" let g:syntastic_mode_map = {
"     \ "mode": "active",
"     \ "passive_filetypes": ["go"] }
"----------------------------------------------------------------

" fzf
"
" Open files in horizontal split
nnoremap <silent> <c-p> :GFiles<CR>

" Open files in vertical horizontal split
nnoremap <silent> <c-k> :call fzf#run({
\   'right': winwidth('.') / 2,
\   'sink':  'e' })<CR>

" Open buffers
nnoremap <silent> <c-n> :Buffers<CR>

" nnoremap <silent> <c-g> :Rg<CR>

nnoremap <silent> <Leader>C :Colors<CR>
nnoremap <silent> <Leader>f :Rg<CR>

let $FZF_DEFAULT_COMMAND = 'rg --files --hidden'

" gitgutter config
"----------------------------------------------------------------
let g:gitgutter_escape_grep = 1
let g:gitgutter_highlight_lines = 0
highlight clear SignColumn
"----------------------------------------------------------------

" vim-go
"----------------------------------------------------------------
let g:go_fmt_autosave = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
"----------------------------------------------------------------

" vim-terraform
"----------------------------------------------------------------
let g:terraform_align = 1
let g:terraform_fmt_on_save = 1

" vim-numbertoggle
"----------------------------------------------------------------
highlight CursorLineNr ctermbg=0 cterm=none

" rainbow
"----------------------------------------------------------------
let g:rainbow_active = 1

" vim-markdown
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_conceal = 0

" sonokai theme
let g:sonokai_style = 'andromeda'
let g:sonokai_enable_italic = 1
let g:sonokai_disable_italic_comment = 1

" semshi
" hi semshiLocal           ctermfg=209 guifg=#ff875f
" hi semshiGlobal          ctermfg=214 guifg=#ffaf00
" hi semshiImported        ctermfg=214 guifg=#ffaf00 cterm=bold gui=bold
" hi semshiParameter       ctermfg=75  guifg=#5fafff
" hi semshiParameterUnused ctermfg=117 guifg=#87d7ff cterm=underline gui=underline
" hi semshiFree            ctermfg=218 guifg=#ffafd7
" hi semshiBuiltin         ctermfg=207 guifg=#ff5fff
" hi semshiAttribute       ctermfg=49  guifg=#00ffaf
" hi semshiSelf            ctermfg=249 guifg=#b2b2b2
" hi semshiUnresolved      ctermfg=226 guifg=#ffff00 cterm=underline gui=underline
" hi semshiSelected        ctermfg=231 guifg=#ffffff ctermbg=161 guibg=#d7005f

" hi semshiErrorSign       ctermfg=231 guifg=#ffffff ctermbg=160 guibg=#d70000
" hi semshiErrorChr       ctermfg=231 guifg=#ffffff ctermbg=160 guibg=#d70000
" sign define semshiError text=E> texthl=semshiErrorSigna

" deoplete.
" let g:deoplete#enable_at_startup = 1

" coc
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.

let g:coc_global_extensions = ['coc-json', 'coc-git',]

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" indent-blankline.nvim
lua <<EOF
local highlight = {
    "RainbowRed",
    "RainbowYellow",
    "RainbowBlue",
    "RainbowOrange",
    "RainbowGreen",
    "RainbowViolet",
    "RainbowCyan",
}

local hooks = require "ibl.hooks"
-- create the highlight groups in the highlight setup hook, so they are reset
-- every time the colorscheme changes
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
    vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#7e1b23" })
    vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#815c18" })
    vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#0f558a" })
    vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#754b24" })
    vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#486930" })
    vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#651e7b" })
    vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#296770" })
end)

require("ibl").setup { indent = { highlight = highlight, char = "╎" } }
EOF
