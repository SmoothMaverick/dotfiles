"dein Scripts-----------------------------
if &compatible
  set nocompatible
endif

set runtimepath+=/Users/jasonhoang/.config/nvim/dein.vim/repos/github.com/Shougo/dein.vim
call dein#begin('/Users/jasonhoang/.config/nvim/dein.vim')

" Let dein manage dein
call dein#add('Shougo/dein.vim')

" Add or remove your plugins here:
call dein#add('scrooloose/nerdtree')
call dein#add('godlygeek/tabular')
call dein#add('tomtom/tcomment_vim')
call dein#add('tpope/vim-surround')
call dein#add('tpope/vim-fugitive')
call dein#add('tpope/vim-obsession')
call dein#add('ctrlp.vim')
call dein#add('junegunn/fzf')
call dein#add('ervandew/supertab')
call dein#add('honza/vim-snippets')
call dein#add('garbas/vim-snipmate')
call dein#add('MarcWeber/vim-addon-mw-utils')
call dein#add('tomtom/tlib_vim')
call dein#add('Lokaltog/vim-easymotion')
call dein#add('Raimondi/delimitMate')
call dein#add('itchyny/lightline.vim')
call dein#add('szw/vim-tags')
call dein#add('t9md/vim-chef')
call dein#add('ngmy/vim-rubocop')
call dein#add('lfilho/cosco.vim')
call dein#add('fatih/vim-go')
call dein#add('whatyouhide/vim-gotham')
call dein#add('mhinz/vim-startify')
call dein#add('airblade/vim-gitgutter')
call dein#add('neomake/neomake')

call dein#local("~/.vim/plugin")

call dein#end()

filetype plugin indent on
syntax enable
"End dein Scripts-------------------------

" ================ General Config ====================

set number                      "Line numbers are good
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=1000                "Store lots of :cmdline history
set showcmd                     "Show incomplete cmds down the bottom
set noshowmode                  "unShow current mode down the bottom
set gcr=a:blinkon0              "Disable cursor blink
set visualbell                  "No sounds
set autoread                    "Reload files changed outside vim
set ignorecase
set t_Co=256
set laststatus=2
set mouse=n
set colorcolumn=80
" set cursorline
highlight CursorLine   cterm=none ctermfg=none  ctermbg=none
highlight CursorLineNr cterm=none ctermfg=11  ctermbg=none
syntax on
let mapleader=","
nnoremap ; :

" per project vim settings
" source: http://www.ilker.de/specific-vim-settings-per-project.html
set exrc   "enable per project settings with .exrc
set secure "disables from allowing exrc to execute shell commands
set hidden "allow multiple buffers to be managed

" ================ Turn Off Swap Files ==============
set noswapfile
set nobackup
set nowb

" ================ Persistent Undo ==================
if has('persistent_undo')
  silent !mkdir ~/.vim/backups > /dev/null 2>&1
  set undodir=~/.vim/backups
  set undofile
endif

" ================ Indentation ======================
set autoindent
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

filetype plugin on
filetype indent on

" Display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·

set nowrap       "Don't wrap lines
set linebreak    "Wrap lines at convenient points

" ================ Folds ============================
set foldmethod=indent   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default

" ================ Completion =======================
set wildmode=list:longest
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif

" ================ Scrolling ========================
set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

" ================ VimDiff ========================
highlight DiffAdd cterm=none ctermbg=Green gui=none guibg=Green
highlight DiffDelete cterm=none ctermbg=Red gui=none guibg=Red
highlight DiffChange cterm=none ctermbg=Blue gui=none guibg=Blue
highlight DiffText cterm=none ctermbg=Magenta gui=none guibg=Magenta

set rtp+=~/.fzf

" associate Dockerfile.* with dockerfile file type
au BufRead,BufNewFile Dockerfile.* setfiletype dockerfile

" run neomake on current file
autocmd! BufWritePost * Neomake

" show git changes quickly (default 4000)
set updatetime=200

" show quick-fix window
let g:neomake_open_list = 2

" neomake's rubocop settings
let g:neomake_ruby_rubocop_maker = {'args':['--format', 'emacs', '-l']}

" automatically use go imports
let g:go_fmt_command = "goimports"

" call neomake when writing a buffer
"call neomake#configure#automake('w')

colorscheme default
let g:lightline = {'colorscheme': 'wombat'}

set clipboard=unnamed

