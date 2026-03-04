set encoding=utf-8
scriptencoding utf-8

" DEFAULTS based on nvim-defaults

if has('autocmd')
	filetype plugin indent on
endif
if has('syntax') && !exists('g:syntax_on')
	syntax enable
endif

set autoindent
set autoread
set background=dark
set backspace=indent,eol,start
set backupdir=~/.local/state/vim/backup,.
set belloff=all
set comments+=fb:•
let &commentstring = ""
set nocompatible
set complete-=i
let &define = ""
set directory=~/.local/state/vim/swap//,.
set display=lastline
set encoding=utf-8
set fillchars=vert:│,fold:·,foldsep:│
set formatoptions=tcqj
let &grepprg = "rg --vimgrep -uu"
set hidden
set history=10000
set hlsearch
let &include = ""
set incsearch
set nojoinspaces
set langnoremap
set nolangremap
set laststatus=2
set listchars=tab:>\ ,trail:-,nbsp:+
set mouse=nvi
set mousemodel=popup_setpos
set nrformats=bin,hex
set path=.,,
set ruler
set sessionoptions+=unix,slash
set sessionoptions-=options
set shortmess+=CF
set shortmess-=S
set showcmd
set sidescroll=1
set smarttab
set nostartofline
set switchbuf=uselast
set tabpagemax=50
set tags=./tags;,tags
set ttimeout
set ttimeoutlen=50
set ttyfast
set undodir=~/.local/state/vim/undo,.
set viewoptions+=unix,slash
set viewoptions-=options
set viminfo+=!
set wildmenu
set wildoptions=pum,tagfile

" nvim term cursor
if &term =~ "xterm\\|rxvt"
	let &t_SI .= "\<Esc>[6 q"
	let &t_EI .= "\<Esc>[2 q"
	let &t_SR .= "\<Esc>[4 q"
endif
" 1 -> blinking block
" 2 -> solid block
" 3 -> blinking underscore
" 4 -> solid underscore
" 5 -> blinking vertical bar
" 6 -> solid vertical bar

" Load matchit.vim, if a newer version isn't already installed.
" Neovim includes matchit.vim as a regular plug-in.
if !exists("g:loaded_matchit") && findfile("plugin/matchit.vim", &runtimepath) ==# ""
	runtime! macros/matchit.vim
endif
" when starting from GUI:
"   - change directory to the initially opened file
"   - disable CTRL-Z suspend
if $SHLVL == 0
	silent! cd %:p:h
	noremap <C-Z> <Nop>
endif
