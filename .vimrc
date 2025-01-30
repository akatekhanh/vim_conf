" Predefine vim config
set nocompatible
filetype on
filetype plugin on
filetype indent on
syntax on
set number
set encoding=UTF-8
let g:airline_powerline_fonts = 1


set cursorline
set showmode
set showcmd
set showmatch
set hlsearch
set history=1000
set wildmenu

" Set shift width to 4 spaces.
set shiftwidth=4

" Set tab width to 4 columns.
set tabstop=4

augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

" Setup vim plugin here
call plug#begin('~/.vim/plugged')
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
	Plug 'preservim/nerdtree'
	Plug 'ryanoasis/vim-devicons'
call plug#end()

nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>

nnoremap <C-f> :NERDTreeFind<CR>
nnoremap <silent> <C-f> :Files<CR>
nnoremap <silent> <Leader>F :Files<CR>
nnoremap <silent> <Leader>f :Rg<CR>

set guifont=hack_nerd_font:h25

