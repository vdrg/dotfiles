set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'gmarik/Vundle.vim' " required
Plugin 'tpope/vim-surround'

call vundle#end()            " required
filetype plugin indent on    " required

syntax on
set number
set incsearch
set hlsearch
" Indenting
set autoindent
