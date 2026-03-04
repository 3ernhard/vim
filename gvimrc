augroup gvimrc
	au!
	au GuiEnter * set guioptions+=c
augroup end

set title
set guioptions=kd
set mousemodel=popup_setpos

set columns=80
set lines=24

set guifont=Source\ Code\ Pro\ 12

set background=dark
let g:gruvbox_invert_tabline = 1
colorscheme gruvbox

nnoremap <silent> <Leader>b :set <C-R>=&background =~# 'dark' ? 'background=light guioptions-=d' : 'background=dark guioptions+=d'<CR><CR>
vnoremap <silent> <Leader>b :<C-U>set <C-R>=&background =~# 'dark' ? 'background=light guioptions-=d' : 'background=dark guioptions+=d'<CR><CR>gv
