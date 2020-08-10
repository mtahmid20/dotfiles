call plug#begin('~/.config/nvim/plugged')
Plug 'ap/vim-css-color'
Plug 'mboughaba/i3config.vim'
Plug 'morhetz/gruvbox'
Plug 'arcticicestudio/nord-vim'
Plug 'preservim/nerdtree'
call plug#end()

set mouse=a

" Theme
colorscheme gruvbox
set background=dark
set termguicolors

syntax on
set encoding=utf-8

hi! Normal ctermbg=NONE guibg=NONE
hi! Normal ctermbg=NONE guibg=NONE
set number relativenumber
"set number

" Automatically delete all trailing whitespaces on save
    autocmd BufWritePre * %s/\s\+$//e
" clipboard
    set clipboard=unnamedplus
" set tabs to 4 spaces
    set tabstop=4
    set softtabstop=4
    set shiftwidth=4
    set expandtab
    set smartindent
    set fileformat=unix
    set nowrap

" Copy selected text to system clipboard (requires gvim/nvim/vim-x11 installed):
    vnoremap <C-c> "+y
    map <C-p> "+P

" Replace all is aliased to X.
	nnoremap X :%s//g<Left><Left>

    " NERDTREE
    map <C-o> :NERDTreeToggle<CR>
    let NERDTreeShowHidden=1









