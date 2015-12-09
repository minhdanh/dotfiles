set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

" Plugin 'fidian/hexmode'
" Plugin 'fatih/vim-go'
" Plugin 'tmux-plugins/vim-tmux'
" Plugin 'tmux-plugins/vim-tmux-focus-events'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-commentary'
Plugin 'airblade/vim-gitgutter'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-surround'
Plugin 'kien/ctrlp.vim'
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-rails'
Plugin 'Shougo/unite.vim'
Plugin 'Shougo/vimfiler.vim'
" Plugin 'elzr/vim-json'
" Plugin 'rstacruz/sparkup'
Plugin 'Yggdroot/indentLine'
" Plugin 'christoomey/vim-tmux-navigator'
Plugin 'Raimondi/delimitMate'
" Plugin 'szw/vim-ctrlspace'
" Plugin 'mbbill/undotree'
Plugin 'Valloric/YouCompleteMe'
" Plugin 'majutsushi/tagbar'
Plugin 'tpope/vim-dispatch'
Plugin 'rking/ag.vim'
Plugin 'wincent/terminus'
" Plugin 'jscappini/material.vim'
" Plugin 'jdkanani/vim-material-theme'
Plugin 'godlygeek/tabular'
Plugin 'slim-template/vim-slim'
Plugin 'vim-ruby/vim-ruby'
" Plugin 'jeffkreeftmeijer/vim-numbertoggle'

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

set list listchars=tab:»·,trail:·,nbsp:·                        " display extra whitespace
set cursorline                                                  " highlight current line

set mouse=a
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

" Run command with <leader>r
nnoremap <leader>r :Dispatch<space>

" Copy selection to clipboard in visual mode
vnoremap <leader>c "*y

" Move to end of line in insert mode
inoremap ,, <C-o>$

" find current world quickly using Ag
nnoremap ff :Ag <C-R><C-W><CR>

" Move to the next buffer
nmap <leader>l :bnext<CR>
" Move to the previous buffer
nmap <leader>hh :bprevious<CR>
" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nmap <leader>q :bp <BAR> bd #<CR>
" Show all open buffers and their status
nmap <leader>a :ls<CR>
" Toggle highlight search
nmap <leader>p set hlsearch!<cr>
" Add a new line without entering insert mode
nmap <leader>n o<Esc>
nmap <leader>N O<Esc>
" Close syntastic location list
nmap <leader>m :lclose<cr>

" Toggle tagbar
nmap <leader>t :TagbarToggle<CR>

" Run GoDoc
nmap <leader>g :GoDoc<CR>

" Ctrl + S to save file
" If the current buffer has never been saved, it will have no name,
" call the file browser to save it, otherwise just save it.
command -nargs=0 -bar Update if &modified
\|    if empty(bufname('%'))
\|        browse confirm write
\|    else
\|        confirm write
\|    endif
\|endif
nnoremap <silent> <C-S> :<C-u>Update<CR>
inoremap <c-s> <c-o>:Update<CR>
nmap <leader>s :Update<CR>

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

" vimfiler
"----------------------------------------------------------------
let g:vimfiler_as_default_explorer = 1
let g:vimfiler_ignore_pattern = '^\%(\.git\|\.DS_Store\|\.swp\)$'
" Enable file operation commands.
call vimfiler#custom#profile('default', 'context', {
      \ 'safe' : 0,
      \ })
noremap <Leader>k :VimFilerExplorer<CR>
" autocmd VimEnter * VimFilerExplorer                           " Display vimfiler sidebar after starting Vim
"----------------------------------------------------------------

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
"----------------------------------------------------------------

" syntastic config
"----------------------------------------------------------------
set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_mode_map = {
    \ "mode": "active",
    \ "passive_filetypes": ["go"] }
"----------------------------------------------------------------

" CtrlP config
"----------------------------------------------------------------
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip                        " MacOSX/Linux
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = 'vendor/bundle'
let g:ctrlp_prompt_mappings = {
  \ 'PrtClearCache()':      ['<c-,>'],
  \ }
let g:ctrlp_use_caching = 0
"----------------------------------------------------------------

" gitgutter config
"----------------------------------------------------------------
let g:gitgutter_escape_grep = 1
let g:gitgutter_highlight_lines = 0
"----------------------------------------------------------------

" CtrlSpace config
"----------------------------------------------------------------
let g:ctrlspace_use_tabline = 1
" Colors of CtrlSpace for Solarized Dark
" (MacVim and Console Vim under iTerm2 with Solarized Dark theme)

" Based on Solarized TablineSel
hi CtrlSpaceSelected guifg=#586e75 guibg=#eee8d5 guisp=#839496 gui=reverse,bold ctermfg=10 ctermbg=7 cterm=reverse,bold
" Based on Solarized Tabline/TablineFill
" tweaked Normal with darker background in Gui
hi CtrlSpaceNormal   guifg=#839496 guibg=#021B25 guisp=#839496 gui=NONE ctermfg=12 ctermbg=0 cterm=NONE
" Based on Title
hi CtrlSpaceSearch   guifg=#cb4b16 guibg=NONE gui=bold ctermfg=9 ctermbg=NONE term=bold cterm=bold
" Based on PmenuThumb
hi CtrlSpaceStatus   guifg=#839496 guibg=#002b36 gui=reverse term=reverse cterm=reverse ctermfg=12 ctermbg=8
"----------------------------------------------------------------

" ag.vim
"----------------------------------------------------------------
let g:agprg="/usr/local/bin/ag --column"

"----------------------------------------------------------------

" vim-go
"----------------------------------------------------------------
" let g:go_fmt_autosave = 0
" let g:go_highlight_functions = 1
" let g:go_highlight_methods = 1
" let g:go_highlight_structs = 1
" let g:go_highlight_operators = 1
" let g:go_highlight_build_constraints = 1
