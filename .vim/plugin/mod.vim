"let g:tmuxline_powerline_separators = 0

let g:git_sym = ''
let g:roy_sym = ''
let g:sep_l = ''
let g:sep_r = ''
let g:sup_l = ''
let g:sup_r = ''

let g:lightline = {
  \ 'colorscheme': 'wombat',
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ]
  \ },
  \ 'component_function': {
  \   'fugitive'     : 'MyFugitive',
  \   'readonly'     : 'MyReadonly',
  \   'modified'     : 'MyModified',
  \   'filename'     : 'MyFilename',
  \   'fileformat'   : 'MyFileformat',
  \   'filetype'     : 'MyFiletype',
  \   'fileencoding' : 'MyFileencoding',
  \   'mode'         : 'MyMode',
  \ },
  \ 'separator': { 'left': (g:sep_l), 'right': (g:sep_r) },
  \ 'subseparator': { 'left': (g:sup_l), 'right': (g:sup_r) }
\ }

function! MyModified()
  if &filetype == "help"
    return ""
  elseif &modified
    return "+"
  elseif &modifiable
    return ""
  else
    return ""
  endif
endfunction

function! MyReadonly()
  if &filetype == "help"
    return ""
  elseif &readonly
    return (g:roy_sym)
  else
    return ""
  endif
endfunction

function! MyFugitive()
  if exists("*fugitive#head")
    if winwidth(0) > 70
      let _ = fugitive#head()
      return strlen(_) ? (g:git_sym)._ : ''
    else
      return (g:git_sym)
    endif
  endif
  return ''
endfunction

function! MyFilename()
  return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
       \ ('' != expand('%:t') ? expand('%:t') : '[No Name]') .
       \ ('' != MyModified() ? ' ' . MyModified() : '')
endfunction

function! MyFileformat()
  return winwidth(0) > 85 ? &fileformat : ''
endfunction

function! MyFiletype()
  return winwidth(0) > 80 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! MyFileencoding()
  return winwidth(0) > 90 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! MyMode()
  return winwidth(0) > 60 ? lightline#mode() : ''
endfunction
