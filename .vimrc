set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'ryanoasis/vim-devicons'
Plugin 'gmarik/Vundle.vim' " required
Plugin 'tpope/vim-surround'
Plugin 'bling/vim-airline'
Plugin 'easymotion/vim-easymotion'
Plugin 'Valloric/YouCompleteMe'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-notes'
Plugin 'majutsushi/tagbar'
Plugin 'Raimondi/delimitMate'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'helino/vim-json'
Plugin 'pangloss/vim-javascript'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'ternjs/tern_for_vim'
Plugin 'rking/ag.vim'
Plugin 'chrisbra/Colorizer'
Plugin 'mxw/vim-jsx'

"Style
Plugin 'mhinz/vim-startify'
Plugin 'altercation/vim-colors-solarized'
Plugin 'vim-airline/vim-airline-themes'

call vundle#end()            " required
filetype plugin indent on    " required

syntax on
set number
set incsearch
set hlsearch
set showcmd
set encoding=utf-8

" Indenting
set autoindent
set tabstop=2
set shiftwidth=2
set expandtab

" Color scheme
"let base16colorspace=256
"set t_Co=256
set background=dark
colorscheme solarized

" vim-airline 
let g:airline_powerline_fonts = 1
set laststatus=2
let g:airline_theme='solarized'
let g:airline#extensions#tabline#enabled = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"
let g:airline#extensions#whitespace#enabled = 0


set autochdir


" Tags
set tags=./tags,tags;

" DelimitMate
let delimitMate_expand_cr = 1

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_javascript_checkers = ['eslint']

"jsx
let g:jsx_ext_required = 0 " Allow JSX in normal JS files"

"YCM
let g:ycm_server_python_interpreter = "/usr/bin/python3"

" Mappings
let mapleader = "," 
map <C-e> :NERDTreeToggle<CR>
