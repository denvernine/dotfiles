" general
set encoding=utf-8
if &compatible
  set nocompatible
endif
filetype plugin on
set regexpengine=1
set ttyfast
set ambiwidth=double
set backspace=indent,eol
set fixendofline
set noswapfile
set nowrap
set virtualedit=block
inoremap <silent> jj <ESC>
nnoremap ; :
nnoremap j gj
nnoremap k gk
command! -nargs=1 -complete=file Rename f %:p:h/<args>|call delete(expand('#'))|w
command! -nargs=0 -bang MkDir !mkdir -p %:p:h
augroup setShebang
  au!
  au BufNewFile *.php 0put =\"<?php\n\ndeclare(strict_types=1);\n\n\"|$
augroup END

" appearance
augroup calcColumnLength
  au!

  function! s:charCount()
    let l:result = strchars(getline('.'))
    return l:result
  endfunction

  function! s:update()
    let b:charLength = s:charCount()
  endfunction

  au BufNewFile,BufRead,CursorMoved,CursorMovedI * call <SID>update()
augroup END
set laststatus=2
set list
set listchars=tab:>_,trail:_,extends:>,precedes:<,nbsp:_
set matchtime=1
set scrolloff=5
set showmatch
set splitbelow
set splitright
set statusline=%f\ %m\ %r%h%w%=%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}\ Ln\.%l,\ Col\.%1c\ %4P

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

" indent
set autoindent
set expandtab
set shiftwidth=2
set smartindent
set softtabstop=2
set tabstop=2
augroup fileTypeIndent
  au!
  au BufNewFile,BufRead *.json setlocal sw=4 sts=4 ts=4 filetype=javascript
  au BufNewFile,BufRead *.md setlocal filetype=markdown
  au BufNewFile,BufRead *.php setlocal sw=4 sts=4 ts=4
  au BufNewFile,BufRead *.twig setlocal filetype=html
  au BufNewFile,BufRead *.vue setlocal filetype=html
  au BufNewFile,BufRead *.yaml,*.yml setlocal sw=4 sts=4 ts=4
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
nnoremap N Nzz
nnoremap n nzz
vnoremap z/ <ESC>/\%V
vnoremap z? <ESC>?\%V
nnoremap <silent> <ESC><ESC> :nohlsearch<CR>

" plugin
"
" setting for 'junegunn/vim-plug'
" hit `:source %` and `:PlugInstall` command
call plug#begin('~/.vim/plugged')
  " which provides support for expanding abbreviations similar to emmet.
  " e.g.) type `ul>li*2+li>(span>a)+button.small+div#bottom` and `<C-y> + ,`
  Plug 'mattn/emmet-vim'
  " A simple, easy-to-use Vim alignment plugin.
  Plug 'junegunn/vim-easy-align'
call plug#end()
let g:indentLine_color_term = 239
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
