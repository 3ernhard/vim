set encoding=utf-8
scriptencoding utf-8

" use <Space> and \ as <Leader>
map <Space> \

set background=dark
set termguicolors
colorscheme gruvbox

set lazyredraw

set fileignorecase

" includes files from all sub-directories for find etc.
set path+=**

set fsync
set hidden
set confirm

command! RO setlocal readonly

nmap <silent> <Leader>q :cclose<Bar>lclose<CR>
vmap <silent> <Leader>q :<C-U>cclose<Bar>lclose<CR>gv

set mouse=ar

set clipboard=unnamed
noremap <silent> <Leader>y "+y
noremap <silent> <Leader>Y "+Y
noremap <silent> <Leader>p "+p
noremap <silent> <Leader>P "+P
nnoremap <silent> <Leader>* :set <C-R>=&clipboard =~# 'unnamed' ? 'clipboard-=unnamed' : 'clipboard+=unnamed'<CR> clipboard?<CR>
vnoremap <silent> <Leader>* :<C-U>set <C-R>=&clipboard =~# 'unnamed' ? 'clipboard-=unnamed' : 'clipboard+=unnamed'<CR> clipboard?<CR>gv
nnoremap <silent> <Leader>+ :set <C-R>=&clipboard =~# 'unnamedplus' ? 'clipboard-=unnamedplus' : 'clipboard+=unnamedplus'<CR> clipboard?<CR>
vnoremap <silent> <Leader>+ :<C-U>set <C-R>=&clipboard =~# 'unnamedplus' ? 'clipboard-=unnamedplus' : 'clipboard+=unnamedplus'<CR> clipboard?<CR>gv
nmap <Leader>8 \*
vmap <Leader>8 \*
nmap <Leader>= \+
vmap <Leader>= \+

set virtualedit=block
nnoremap <silent> <Leader>v :set <C-R>=&virtualedit =~# 'block' ? 'virtualedit=all' : 'virtualedit=block'<CR> virtualedit?<CR>
vnoremap <silent> <Leader>v :<C-U>set <C-R>=&virtualedit =~# 'block' ? 'virtualedit=all' : 'virtualedit=block'<CR> virtualedit?<CR>gv

set ignorecase
set smartcase
nnoremap <silent> <Leader><Space>      :nohlsearch<CR>
vnoremap <silent> <Leader><Space> :<C-U>nohlsearch<CR>gv
nnoremap <silent> <Leader>h      :set hlsearch! hlsearch?<CR>
vnoremap <silent> <Leader>h :<C-U>set hlsearch! hlsearch?<CR>gv

set nofoldenable
set foldmethod=marker

set shiftround
set noexpandtab
set tabstop=8
set shiftwidth=0
set softtabstop=0

set breakindent
set linebreak
nnoremap <silent> <Leader>w      :setlocal wrap! wrap?<CR>
vnoremap <silent> <Leader>w :<C-U>setlocal wrap! wrap?<CR>gv

set list
let &listchars = "tab:\u2192\u00a0,space:\u00b7,nbsp:\u2022,precedes:@,extends:@"
let &showbreak = "\u21b3\u00a0"
nnoremap <silent> <Leader>t      :set list! list?<CR>
vnoremap <silent> <Leader>t :<C-U>set list! list?<CR>gv

set notitle

set splitbelow
set splitright

set statusline=%<%f%(\ %m%r%)%=
set statusline+=%(\ %([%{&spell?&spl:''}]%)%([%{&fenc==?'utf-8'?'':&fenc}]%)%([%{&ff==?'unix'?'':&ff}]%)%y%)
set statusline+=\ %-14.(%l,%c%V%)\ %P

" cd to directory of current buffer
command! CD cd %:p:h

" Make wrapped movements based on visual lines, if there is no motion counter
nnoremap <expr> k      v:count == 0 ?      'gk' : 'k'
vnoremap <expr> k      v:count == 0 ?      'gk' : 'k'
nnoremap <expr> j      v:count == 0 ?      'gj' : 'j'
vnoremap <expr> j      v:count == 0 ?      'gj' : 'j'
nnoremap <expr> <Up>   v:count == 0 ?   'g<Up>' : '<Up>'
vnoremap <expr> <Up>   v:count == 0 ?   'g<Up>' : '<Up>'
nnoremap <expr> <Down> v:count == 0 ? 'g<Down>' : '<Down>'
vnoremap <expr> <Down> v:count == 0 ? 'g<Down>' : '<Down>'

set complete=.,w,b,t
set completeopt=menuone,noselect
set completefunc=syntaxcomplete#Complete
set pumheight=12
inoremap <expr> <C-Space> empty(&omnifunc) ? '<C-X><C-U>' : '<C-X><C-O>'
if !has('gui_running')
	imap <NUL> <C-Space>
endif
inoremap <expr> <Up>   pumvisible() ? '<C-P>' : '<C-O>g<Up>'
inoremap <expr> <Down> pumvisible() ? '<C-N>' : '<C-O>g<Down>'

set wildmode=longest:full,full
cnoremap <expr> <Up>   pumvisible() ? '<C-P>' : '<Up>'
cnoremap <expr> <Down> pumvisible() ? '<C-N>' : '<Down>'

set nospell
set spelllang=
nnoremap <silent> <Leader>se :set <C-R>=&spelllang =~# 'en' ? 'spelllang-=en' : 'spelllang+=en'<CR><CR>:set <C-R>=empty(&spelllang) ? 'nospell spell?' : 'spell spelllang?'<CR><CR>
vnoremap <silent> <Leader>se :<C-U>set <C-R>=&spelllang =~# 'en' ? 'spelllang-=en' : 'spelllang+=en'<CR><CR>:<C-U>set <C-R>=empty(&spelllang) ? 'nospell spell?' : 'spell spelllang?'<CR><CR>gv
nnoremap <silent> <Leader>sd :set <C-R>=&spelllang =~# 'de' ? 'spelllang-=de' : 'spelllang+=de'<CR><CR>:set <C-R>=empty(&spelllang) ? 'nospell spell?' : 'spell spelllang?'<CR><CR>
vnoremap <silent> <Leader>sd :<C-U>set <C-R>=&spelllang =~# 'de' ? 'spelllang-=de' : 'spelllang+=de'<CR><CR>:<C-U>set <C-R>=empty(&spelllang) ? 'nospell spell?' : 'spell spelllang?'<CR><CR>gv
nnoremap <silent> <Leader>ss :set nospell spelllang= spell?<CR>
vnoremap <silent> <Leader>ss :<C-U>set nospell spelllang= spell?<CR>gv

tnoremap <Esc> <C-\><C-N>
tnoremap \<Esc> <Esc>

set secure
