"Clear trailing whitespaces
nnoremap <silent> ,w :%s/\s\+$//<CR>

" Move between split windows
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <C-k> <C-w>k
nnoremap <C-j> <C-w>j

" Create window splits
nnoremap vv <C-w>v
nnoremap ss <C-w>s

" Navigate tabs
nnoremap J gT
nnoremap K gt
nnoremap H <c-b>
nnoremap L <c-f>

" Join lines (remap default)
nnoremap <leader>l J

"Clear current search highlight
nmap <silent> // :nohlsearch<CR>

" Surround a word with "double quotes"
map  ," ysiw"
vmap ," c"<C-R>""<ESC>

" Surround a word with 'single quotes'
map  ,' ysiw'
vmap ,' c'<C-R>"'<ESC>

" Surround a word with (parens)
map  ,( ysiw(
map  ,) ysiw)
vmap ,( c( <C-R>" )<ESC>
vmap ,) c(<C-R>")<ESC>

" Surround a word with [brackets]
map  ,] ysiw]
map  ,[ ysiw[
vmap ,[ c[ <C-R>" ]<ESC>
vmap ,] c[<C-R>"]<ESC>

" Surround a word with {braces}
map  ,} ysiw}
map  ,{ ysiw{
vmap ,} c{ <C-R>" }<ESC>
vmap ,{ c{<C-R>"}<ESC>

" Surround a word with `back ticks`
map ,` ysiw`

" NERDTree
nnoremap \     :NERDTreeToggle<CR>
nnoremap <C-\> :NERDTreeFind<CR>

" xclip
if filereadable('/usr/bin/xclip')
  vnoremap <C-y> :'<,'>w !xclip -selection c<CR><CR>
  nnoremap <C-y> :r !xclip -selection c -o<CR><CR>
endif
