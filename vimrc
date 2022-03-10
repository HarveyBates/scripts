call plug#begin('~/.vim/plugged')

Plug 'https://github.com/octol/vim-cpp-enhanced-highlight'
Plug 'https://github.com/preservim/nerdtree'
Plug 'https://github.com/mg979/vim-visual-multi'
Plug 'https://github.com/itchyny/lightline.vim'
Plug 'https://github.com/MaxMEllon/vim-jsx-pretty'
Plug 'lervag/vimtex'
Plug 'mattn/emmet-vim'
Plug 'jelera/vim-javascript-syntax'
Plug 'StanAngeloff/php.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'https://github.com/cohama/lexima.vim'
Plug 'zah/nim.vim'
Plug 'https://github.com/joshdick/onedark.vim'
Plug 'rust-lang/rust.vim'
Plug 'https://github.com/tpope/vim-surround'

call plug#end()

map <C-o> :NERDTreeToggle<CR>
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif

set encoding=UTF-8
set cursorline
set nocompatible
set tabstop=4
set showmatch 
set backspace=indent,eol,start
set shiftwidth=4
set expandtab
set autoindent
set noexpandtab
set ignorecase
set smartcase
set ai
set number
set hlsearch
set ruler
set relativenumber

set linebreak
set wrap " 
set t_md=
set tw=0

" set colorcolumn=80

highlight Comment ctermfg=lightgrey
highlight LineNr ctermfg=lightgrey
highlight SpellBad ctermbg=black
hi MatchParen cterm=bold ctermbg=none ctermfg=yellow
set laststatus=2

autocmd BufRead,BufNewFile *.txt setlocal spell
autocmd BufRead,BufNewFile *.md setlocal spell
autocmd BufRead,BufNewFile *.tex setlocal spell

let g:vimtex_view_general_viewer = 'evince'

let g:user_emmet_leader_key=','

set autochdir
command! MakeTags !ctags -R --exclude=.git -f ./.git/tags .
set tags=./.git/tags,tags;$HOME

filetype plugin indent on
filetype plugin on
set shell=bash\ -i

nmap <Tab> :e#<CR> " Tab to navigate between two files 

set foldmethod=expr foldexpr=getline(v:lnum)=~'^\\s*'.&commentstring[0] " folding/unfolding using za

let g:rustfmt_autosave = 1 " Format rust on save

if (has("autocmd") && !has("gui_running"))
	augroup colorset
		autocmd!
		let s:white = { "gui": "#ABB2BF", "cterm": "145", "cterm16" : "7" }
		autocmd ColorScheme * call onedark#set_highlight("Normal", { "fg": s:white }) " `bg` will not be styled since there is no `bg` setting
	augroup END
endif

" vimtex settings
let g:tex_flavor='latex'
let g:vimtex_view_method='mupdf'
let g:vimtex_quickfix_mode=0

syntax on

if has("termguicolors")
	set termguicolors
endif

set background=dark
colorscheme onedark

