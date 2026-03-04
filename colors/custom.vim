let colors_name = "custom"

syntax enable
highlight clear

if &background ==# 'dark'
	highlight Comment    ctermfg=Gray                          guifg=LightGray
	highlight SpecialKey ctermfg=DarkGray                      guifg=DarkGray
	highlight NonText    ctermfg=DarkGray                      guifg=DarkGray
	highlight Pmenu      ctermfg=White       ctermbg=DarkGray  guifg=Black       guibg=DarkGray
	highlight PmenuSel   ctermfg=Black       ctermbg=White     guifg=Black       guibg=White
	highlight Folded     ctermfg=LightYellow ctermbg=DarkGray  guifg=LightYellow guibg=DarkGray
else
	highlight Comment    ctermfg=DarkGray                      guifg=DarkGray
	highlight SpecialKey ctermfg=LightGray                     guifg=LightGray
	highlight NonText    ctermfg=LightGray                     guifg=LightGray
	highlight Pmenu      ctermfg=Black       ctermbg=LightGray guifg=Black       guibg=LightGray
	highlight PmenuSel   ctermfg=White       ctermbg=Black     guifg=White       guibg=Black
	highlight Folded     ctermfg=DarkYellow  ctermbg=LightGray guifg=DarkYellow  guibg=LightGray
endif

if has('gui_running')
	highlight SpellBad   ctermbg=NONE cterm=undercurl guisp=Red
	highlight SpellCap   ctermbg=NONE cterm=undercurl guisp=Yellow
	highlight SpellLocal ctermbg=NONE cterm=undercurl guisp=LightBlue
	highlight SpellRare  ctermbg=NONE cterm=undercurl guisp=Magenta
else
	highlight SpellBad   ctermbg=NONE cterm=underline guisp=Red
	highlight SpellCap   ctermbg=NONE cterm=underline guisp=Yellow
	highlight SpellLocal ctermbg=NONE cterm=underline guisp=LightBlue
	highlight SpellRare  ctermbg=NONE cterm=underline guisp=Magenta
endif

highlight ErrorStatusline   ctermfg=Red       ctermbg=NONE cterm=inverse,bold guifg=Red       guibg=NONE gui=inverse,bold
highlight WarningStatusline ctermfg=Yellow    ctermbg=NONE cterm=inverse,bold guifg=Yellow    guibg=NONE gui=inverse,bold
highlight InfoStatusline    ctermfg=LightBlue ctermbg=NONE cterm=inverse,bold guifg=LightBlue guibg=NONE gui=inverse,bold
