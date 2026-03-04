if !exists('g:ale_enabled') || g:ale_enabled == 0
	finish
endif

let g:ale_set_signs = 0
let g:ale_virtualtext_cursor = 0

let g:ale_warn_about_trailing_blank_lines = 0
let g:ale_warn_about_trailing_whitespace = 0

map <silent> ]a <Plug>(ale_next_wrap)
map <silent> [a <Plug>(ale_previous_wrap)
map <silent> ]w <Plug>(ale_next_wrap_warning)
map <silent> [w <Plug>(ale_previous_wrap_warning)
map <silent> ]e <Plug>(ale_next_wrap_error)
map <silent> [e <Plug>(ale_previous_wrap_error)

" functions to show ALE indicators in the statusline
" use :lopen to show the error list

augroup ALEProgress
    autocmd!
    autocmd User ALELintPost redrawstatus
augroup end

function! ALEStlErrors() abort
    let l:counts = ale#statusline#Count(bufnr(''))
    let l:all_errors = l:counts.error + l:counts.style_error
    return l:all_errors ? printf(' %dE ', all_errors) : ''
endfunction

function! ALEStlWarnings() abort
    let l:counts = ale#statusline#Count(bufnr(''))
    let l:all_warnings = l:counts.warning + l:counts.style_warning
    return l:all_warnings ? printf(' %dW ', all_warnings) : ''
endfunction

function! ALEStlInfos() abort
    let l:counts = ale#statusline#Count(bufnr(''))
    let l:all_infos = l:counts.info
    return l:all_infos ? printf(' %di ', all_infos) : ''
endfunction

set statusline+=%(\ %(%#ErrorStatusline#%{ALEStlErrors()}%*%)%(%#WarningStatusline#%{ALEStlWarnings()}%*%)%(%#InfoStatusline#%{ALEStlInfos()}%*%)%)

highlight link ALEInfo SpellLocal
