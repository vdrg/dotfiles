set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'gmarik/Vundle.vim' " required
Plugin 'ryanoasis/vim-devicons'
Plugin 'tpope/vim-surround'
Plugin 'bling/vim-airline'
Plugin 'easymotion/vim-easymotion'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-notes'
Plugin 'majutsushi/tagbar'
Plugin 'Raimondi/delimitMate'
Plugin 'ternjs/tern_for_vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'helino/vim-json'
Plugin 'pangloss/vim-javascript'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'rking/ag.vim'
Plugin 'chrisbra/Colorizer'
Plugin 'mxw/vim-jsx'
Plugin 'heavenshell/vim-jsdoc'
Plugin 'scrooloose/nerdcommenter'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'suan/vim-instant-markdown'
Plugin 'tpope/vim-fugitive'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

" Autocompletion
Plugin 'Shougo/deoplete.nvim'
Plugin 'Shougo/neoinclude.vim'
Plugin 'zchee/deoplete-clang'
Plugin 'zchee/deoplete-jedi'

" Style
Plugin 'mhinz/vim-startify'
Plugin 'altercation/vim-colors-solarized'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'hynek/vim-python-pep8-indent'

call vundle#end()            " required
filetype plugin indent on    " required

syntax on
set number
set relativenumber
set incsearch
set hlsearch
set showcmd
set encoding=utf-8

" Indenting
set autoindent
set shiftwidth=2
set tabstop=2
set softtabstop=0
set expandtab
set wildmenu

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

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_enable_signs = 1

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_loc_list_height = 5

let g:syntastic_javascript_checkers = ['eslint']

let g:syntastic_mode_map = {
    \ "mode": "active",
    \ "passive_filetypes": ["c"] }

" jsx
let g:jsx_ext_required = 0

" javascript
let g:javascript_conceal_arrow_function = "⇒"

let g:jsdoc_enable_es6=1
"tern
let g:tern_show_argument_hints='on_hold'
let g:tern_map_keys=1

" Markdown
let g:instant_markdown_autostart = 0

" Deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#clang#libclang_path = '/usr/lib/libclang.so'
let g:deoplete#sources#clang#clang_header = '/usr/lib/clang'
let g:deoplete#sources#clang#sort_algo = 'priority'

"indent-guides
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
let g:indent_guides_guide_size = 1
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd ctermbg=8
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=0

let g:ctrlp_max_files = 0

"nerdcommenter
let NERDSpaceDelims = 1

"ultisnips
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" Mappings
let mapleader = "," 
map <C-e> :NERDTreeToggle<CR>
map <leader>b :CtrlPBuffer<CR>

" Persistent undo
set undofile
set undodir=$HOME/.vim/undo

set undolevels=1000
set undoreload=10000
