set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'gmarik/Vundle.vim' " required
Plugin 'tpope/vim-surround'
Plugin 'bling/vim-airline'
Plugin 'easymotion/vim-easymotion'
Plugin 'flazz/vim-colorschemes'
Plugin 'Shougo/neocomplete.vim'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-notes'
Plugin 'majutsushi/tagbar'
Plugin 'Raimondi/delimitMate'

call vundle#end()            " required
filetype plugin indent on    " required

syntax on
set number
set incsearch
set hlsearch
set showcmd

" Indenting
set autoindent
set tabstop=2
set shiftwidth=2
set expandtab

" Color scheme
set t_Co=256
colorscheme monokai

" vim-airline 
let g:airline_powerline_fonts = 1
set laststatus=2
let g:airline_theme='zenburn'
let g:airline#extensions#tabline#enabled = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"
let g:airline#extensions#whitespace#enabled = 0

" ntrw
function! ToggleVExplorer()
    if exists("t:expl_buf_num")
        let expl_win_num = bufwinnr(t:expl_buf_num)
        if expl_win_num != -1
            exec expl_win_num . 'wincmd w'
            close
            exec '1wincmd p'
            unlet t:expl_buf_num
        else
            unlet t:expl_buf_num
        endif
    else
        exec '1wincmd w'
        Vexplore
        let t:expl_buf_num = bufnr("%")
    endif
endfunction
let g:netrw_browse_split = 4 
let g:netrw_altv = 1
let g:netrw_liststyle=3
let g:netrw_banner = 0
let g:netrw_winsize = -28
set autochdir

" NeoComplete

" Tags
set tags=./tags,tags;

" DelimitMate
let delimitMate_expand_cr = 1

" Mappings
let mapleader = "," 
map <silent> <C-E> :call ToggleVExplorer()<CR>

