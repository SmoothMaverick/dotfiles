autocmd FileType html
 \ setlocal shiftwidth=2 softtabstop=2 tabstop=2

autocmd FileType ruby
 \ setlocal shiftwidth=2 softtabstop=2 tabstop=2

autocmd FileType python
 \ setlocal shiftwidth=4 softtabstop=4 tabstop=4

autocmd FileType go
 \ setlocal shiftwidth=4 softtabstop=4 tabstop=4

" associate Dockerfile.* with dockerfile filetype
au BufRead,BufNewFile "^Dockerfile.*$" set filetype=Dockerfile

