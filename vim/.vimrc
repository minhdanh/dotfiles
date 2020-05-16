set encoding=utf-8
set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=/usr/local/opt/fzf

call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

" Plugin 'mbbill/undotree'
" Plugin 'majutsushi/tagbar'

" Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-commentary'
Plugin 'airblade/vim-gitgutter'
Plugin 'zivyangll/git-blame.vim'

" Plugin 'scrooloose/syntastic'

Plugin 'tpope/vim-surround'
Plugin 'junegunn/fzf.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'Shougo/unite.vim'
Plugin 'Shougo/defx.nvim'
Plugin 'roxma/nvim-yarp'
Plugin 'roxma/vim-hug-neovim-rpc'

Plugin 'Yggdroot/indentLine'
Plugin 'Raimondi/delimitMate'
Plugin 'Valloric/YouCompleteMe'
Plugin 'godlygeek/tabular'
Plugin 'jeffkreeftmeijer/vim-numbertoggle'
Plugin 'flazz/vim-colorschemes'
Plugin 'hashivim/vim-terraform'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'stephpy/vim-yaml'
Plugin 'fatih/vim-go'

call vundle#end()            " required
filetype plugin indent on    " required

" Theme
"----------------------------------------------------------------
set t_Co=256
set background=dark
set term=xterm-256color
colorscheme solarized


set relativenumber
set number                                                      " display line number
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

" Language specific settings
"----------------------------------------------------------------
" autocmd FileType python setlocal expandtab shiftwidth=2 softtabstop=2
"----------------------------------------------------------------

" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" hi CursorLine   cterm=NONE ctermbg=234 ctermfg=NONE
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
" Show all open buffers and their status
nmap <leader>a :ls<CR>
" Switch to previously edited buffer
nnoremap <silent> <C-m> :b#<CR>
" Toggle highlight search
nmap <leader>m set hlsearch!<cr>
" Add a new line without entering insert mode
nmap <leader>n o<Esc>
nmap <leader>N O<Esc>
" Close syntastic location list
nmap <leader>m :lclose<cr>

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
au! BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml

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
"----------------------------------------------------------------

" defx
noremap <leader>k :Defx -split=vertical -winwidth=50 -direction=topleft -resume -toggle<CR>
nnoremap vf :Defx -split=vertical -winwidth=50 -direction=topleft -search=`expand('%:p')` -toggle<CR>
autocmd FileType defx call s:defx_my_settings()
function! s:defx_my_settings() abort
  " Define mappings
  nnoremap <silent><buffer><expr> <CR>
  \ defx#is_directory() ?
    \ defx#do_action('open_tree') :
    \ defx#do_action('drop')
  nnoremap <silent><buffer><expr> c
  \ defx#do_action('copy')
  nnoremap <silent><buffer><expr> m
  \ defx#do_action('move')
  nnoremap <silent><buffer><expr> p
  \ defx#do_action('paste')
  nnoremap <silent><buffer><expr> l
  \ defx#is_directory() ?
    \ defx#do_action('open_tree') :
    \ defx#do_action('drop')
  nnoremap <silent><buffer><expr> E
  \ defx#do_action('open', 'vsplit')
  nnoremap <silent><buffer><expr> P
  \ defx#do_action('open', 'pedit')
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
  \ defx#is_opened_tree() ?
    \ defx#do_action('open_tree') :
    \ defx#do_action('close_tree')
  nnoremap <silent><buffer><expr> ~
  \ defx#do_action('cd')
  nnoremap <silent><buffer><expr> q
  \ defx#do_action('quit')
  nnoremap <silent><buffer><expr> <Space>
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
let g:airline_theme = 'term_light'
"----------------------------------------------------------------

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

nnoremap <silent> <Leader>C :Colors<CR>

let $FZF_DEFAULT_COMMAND = 'rg --files --hidden'

" gitgutter config
"----------------------------------------------------------------
let g:gitgutter_escape_grep = 1
let g:gitgutter_highlight_lines = 0
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

" indentLine
"----------------------------------------------------------------
" let g:indentLine_conceallevel = 0
let g:indentLine_enabled = 1

" vim-terraform
"----------------------------------------------------------------
let g:terraform_align = 1
let g:terraform_fmt_on_save = 0
