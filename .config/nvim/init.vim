"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/home/vdrg/.vim/bundles/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/home/vdrg/.vim/bundles')
  call dein#begin('/home/vdrg/.vim/bundles')

  " Required:
  call dein#add('/home/vdrg/.vim/bundles/repos/github.com/Shougo/dein.vim')

  call dein#add('Shougo/deoplete.nvim')
  " call dein#add('Shougo/neosnippet.vim')
  " call dein#add('Shougo/neosnippet-snippets')

  call dein#add('tomlion/vim-solidity')

  call dein#add('vim-airline/vim-airline')
  call dein#add('vim-airline/vim-airline-themes')
  
  call dein#add('tpope/vim-surround')
  call dein#add('Raimondi/delimitMate')

  call dein#add('tpope/vim-fugitive')

  call dein#add('morhetz/gruvbox')

  call dein#add('SirVer/ultisnips')
  call dein#add('honza/vim-snippets')

  call dein#add('neomake/neomake')

  call dein#add('ctrlpvim/ctrlp.vim')

  call dein#add('tpope/vim-repeat')


  call dein#add('tpope/vim-jdaddy')
  call dein#add('mxw/vim-jsx')
  call dein#add('pangloss/vim-javascript')
  call dein#add('moll/vim-node')
  call dein#add('carlitux/deoplete-ternjs')
  call dein#add('jaawerth/nrun.vim')
  call dein#add('rust-lang/rust.vim')

  call dein#add('junegunn/goyo.vim')
  call dein#add('junegunn/limelight.vim')
  
  call dein#add('suan/vim-instant-markdown')

  call dein#add('scrooloose/nerdcommenter')



  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
"if dein#check_install()
"  call dein#install()
"endif

"End dein Scripts-------------------------

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

" Persistent undo
set undofile
set undodir=$HOME/.vim/undo

set undolevels=1000
set undoreload=10000

colorscheme gruvbox

set termguicolors
set background=dark

" Set root directory
function! s:setcwd()
  let cph = expand('%:p:h', 1)
  if cph =~ '^.\+://' | retu | en
  for mkr in ['.git/', '.hg/', '.svn/', '.bzr/', '_darcs/', '.vimprojects', 'truffle.js']
    let wd = call('find'.(mkr =~ '/$' ? 'dir' : 'file'), [mkr, cph.';'])
    if wd != '' | let &acd = 0 | brea | en
  endfo
  exe 'lc!' fnameescape(wd == '' ? cph : substitute(wd, mkr.'$', '.', ''))
endfunction

call s:setcwd()

" Leader
:let mapleader = ','

"let g:airline_powerline_fonts = 1
let g:vimtex_view_method = 'zathura'

" Deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#omni#input_patterns = {}

"Add extra filetypes
let g:tern#filetypes = [
                \ 'jsx',
                \ 'javascript.jsx',
                \ ]

"let g:deoplete#omni#input_patterns.tex = g:vimtex#re#deoplete

" Neomake

" Set prefixes for solc
function! SolcArgs()
  let installed_contracts = globpath('./installed_contracts/', '*', 0, 1) 
  let node_modules = globpath('./node_modules/', '*', 0, 1)
  return map(installed_contracts, {i, val -> fnamemodify(val, ':t') . '=' . fnamemodify(val, ':p') . 'contracts'}) +
       \ map(node_modules, {i, val -> fnamemodify(val, ':t') . '=' . fnamemodify(val,':p')})
endfunc

let g:neomake_solidity_solc_maker = {
      \ 'errorformat': '%f:%l:%c: %trror: %m, %f:%l:%c: %tarning: %m',
      \ }

let g:neomake_solidity_truffle_maker = {
      \ 'exe': 'truffle compile',
      \ 'args': [],
      \ 'errorformat': '%f:%l:%c: %trror: %m, %f:%l:%c: %tarning: %m',
      \ }

let g:neomake_solidity_solium_maker = {
      \ 'args': ['-R gcc --file'],
      \ 'errorformat': '%f:%l:%c %trror: %m, %f:%l:%c: %tarning: %m',
      \ }

let g:neomake_solidity_enabled_makers = ['solc'] "['solc', 'solium']
let g:neomake_tex_enabled_makers = ['pdflatex']
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_javascript_jsx_enabled_makers = ['eslint']

au BufEnter *.sol let b:neomake_solidity_solc_args = SolcArgs()
au BufEnter *.js let b:neomake_javascript_eslint_exe = nrun#Which('eslint')
"au BufEnter *.js let b:neomake_javascript_jsx_eslint_exe = nrun#Which('eslint')
au BufEnter *.tex silent! lcd %:p:h

autocmd! BufWritePost * Neomake

" Snippets
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" JSX
let g:jsx_ext_required = 0 " Allow JSX in normal JS files

" Prettier JS (yarn add global prettier)
autocmd FileType javascript set formatprg=prettier\ --stdin

" CtrlP

" let g:ctrlp_root_markers = ['truffle.js']

" NERD Commenter

let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDCustomDelimiters = { 'solidity': { 'left': '//', 'leftAlt': '/*', 'rightAlt': '*/' }}



