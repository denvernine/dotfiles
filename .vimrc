" Vim Run Control
" general
set encoding=utf-8
if version <= 740
  set regexpengine=1
endif
if version < 800 && &compatible
  set nocompatible
endif
if !has('nvim')
  set ttyfast
endif
if !has('nvim-0.5.0')
  filetype plugin on
endif
if !exists('g:vscode')
  set ambiwidth=double
endif
set backspace=indent,eol
set fixendofline
set noswapfile
set scrolloff=5
set virtualedit=block
inoremap <silent> jj <ESC>
nnoremap ; :
nnoremap j gj
nnoremap k gk

" appearance
set number
set nowrap
set laststatus=2
set list
set listchars=tab:>_,trail:_,extends:>,precedes:<,nbsp:_
set matchtime=1
set showmatch
set splitbelow
set splitright

"" colorscheme
"" ref: https://vimhelp.org/syntax.txt.html
syntax on
set background=dark
set cursorline
colorscheme base16-railscasts
highlight clear        SignColumn
highlight ColorColumn  ctermbg=237
highlight CursorLine   ctermbg=236
highlight VertSplit    ctermbg=236
highlight IncSearch    ctermbg=3   ctermfg=1
highlight LineNr       ctermbg=0   ctermfg=240
highlight CursorLineNr ctermbg=236 ctermfg=240
highlight Pmenu        ctermbg=240 ctermfg=12
highlight PmenuSel     ctermbg=3   ctermfg=1
highlight Search       ctermbg=1   ctermfg=3
highlight SpellBad     ctermbg=0   ctermfg=1
highlight StatusLine   ctermbg=240 ctermfg=12
highlight StatusLineNC ctermbg=238 ctermfg=0
highlight Visual       ctermbg=3   ctermfg=0
highlight over120      ctermbg=1   ctermfg=0
call matchadd('over120', '.\%>121v')
if has('nvim-0.9.5')
  set termguicolors
endif

" indentation
set autoindent
set expandtab
set shiftwidth=2
set smartindent
set softtabstop=2
set tabstop=2
augroup file_type_indent
  au!
  au BufNewFile,BufRead *.json setlocal filetype=javascript sw=4 sts=4 ts=4
  au BufNewFile,BufRead *.md setlocal filetype=markdown
  au BufNewFile,BufRead *.php setlocal sw=4 sts=4 ts=4
  au BufNewFile,BufRead *.ts setlocal filetype=javascript
augroup END

" search
set history=20
set hlsearch
set ignorecase
set smartcase
nnoremap # #zz
nnoremap * *zz
nnoremap g# g#zz
nnoremap g* g*zz
nnoremap n nzz
nnoremap N Nzz
vnoremap z/ <ESC>/\%V
vnoremap z? <ESC>?\%V
nnoremap <silent> <ESC><ESC> :nohlsearch<CR>

" plugin
let s:jetpackfile = stdpath('data') .. '/site/pack/jetpack/opt/vim-jetpack/plugin/jetpack.vim'
let s:jetpackurl = 'https://raw.githubusercontent.com/tani/vim-jetpack/master/plugin/jetpack.vim'
if !filereadable(s:jetpackfile)
  call system(printf('curl -fsSL -o %s --create-dirs -- %s', s:jetpackfile, s:jetpackurl))
endif
packadd vim-jetpack
call jetpack#begin()
  "" bootstrap
  Jetpack 'tani/vim-jetpack', {'opt':1}
  " which provides support for expanding abbreviations similar to emmet.
  " e.g.) type `ul>li*2+li>(span>a[href=https://example.com]{sample page})+button.small^div#bottom>data[value=1319898155]` and `<C-y> + ,`
  Jetpack 'mattn/emmet-vim'
  "" A simple, easy-to-use Vim alignment plugin.
  Jetpack 'junegunn/vim-easy-align'
call jetpack#end()
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
