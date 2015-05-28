set nocompatible
filetype off

" Theme
"----------------------------------------------------------------
set t_Co=256
set background=dark
set term=xterm-256color
colorscheme solarized

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
" autocmd FileType python setlocal expandtab shiftwidth=4 softtabstop=4
"----------------------------------------------------------------

" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" custom mappings
"----------------------------------------------------------------
imap ;; <Esc>
let mapleader=" "
nnoremap <leader>r :Dispatch<space>
inoremap ,, <C-o>$
nnoremap ff :grep <C-R><C-W> *<CR>
" Move to the next buffer
nmap <leader>l :bnext<CR>
" Move to the previous buffer
nmap <leader>h :bprevious<CR>
" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nmap <leader>q :bp <BAR> bd #<CR>
" Show all open buffers and their status
nmap <leader>a :ls<CR>
" Toggle highlight search
nmap <leader>e set hlsearch!<cr>
" Add a new line without entering insert mode
nmap <leader>n o<Esc>
nmap <leader>N O<Esc>

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

" map j to gj and k to gk, so line navigation ignores line wrap
nnoremap k gk
nnoremap j gj
nnoremap 0 g0
nnoremap $ g$
nnoremap ^ g^

" for easier split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" split windows easier
nnoremap <leader>w <C-W>v<C-W>l

" toggle between paste and nopaste mode
" nnoremap <leader>\ :set invpaste paste?<CR>
map <leader>\ :set invpaste<CR>
set pastetoggle=<leader>\
set showmode
"----------------------------------------------------------------

" vimfiler
"----------------------------------------------------------------
let g:vimfiler_as_default_explorer = 1
let g:vimfiler_ignore_pattern = '^\%(\.git\|\.DS_Store\|\.swp\)$'
noremap <Leader>k :VimFiler<CR>
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
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
"----------------------------------------------------------------

" CtrlP config
"----------------------------------------------------------------
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip                        " MacOSX/Linux
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_prompt_mappings = {
  \ 'PrtClearCache()':      ['<c-,>'],
  \ }
let g:ctrlp_use_caching = 0
"----------------------------------------------------------------

" indent-guides config
"----------------------------------------------------------------
let g:indent_guides_auto_colors = 0
let g:indent_guides_enable_on_vim_startup = 0
hi IndentGuidesEven ctermbg=black
hi IndentGuidesOdd ctermbg=fg
"----------------------------------------------------------------

" gitgutter config
"----------------------------------------------------------------
let g:gitgutter_escape_grep = 1
let g:gitgutter_highlight_lines = 1
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

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Plugin 'fidian/hexmode'
Plugin 'fatih/vim-go'
Plugin 'tmux-plugins/vim-tmux'
Plugin 'tmux-plugins/vim-tmux-focus-events'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-surround'
Plugin 'kien/ctrlp.vim'
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-rails'
Plugin 'Shougo/unite.vim'
Plugin 'Shougo/vimfiler.vim'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'elzr/vim-json'
Plugin 'shawncplus/phpcomplete.vim'
Plugin 'rstacruz/sparkup'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tomtom/tcomment_vim'
Plugin 'reedes/vim-thematic'
Plugin 'Raimondi/delimitMate'
Plugin 'szw/vim-ctrlspace'
Plugin 'edkolev/tmuxline.vim'
Plugin 'mbbill/undotree'
Plugin 'Valloric/YouCompleteMe'
Plugin 'majutsushi/tagbar'
Plugin 'tpope/vim-dispatch'
