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
  au BufNewFile *.php 0put =\"<?php declare(strict_types=1);\n\n\"|$
augroup END

" appearance
function! s:charCount()
  let l:result = strchars(getline('.'))
  return l:result
endfunction
function! s:update()
  let b:charLength = s:charCount()
endfunction
augroup charCount
  au!
  au BufNewFile,BufRead,CursorMoved,CursorMovedI * call <SID>update()
augroup END
set laststatus=2
set list
set listchars=tab:>_,trail:_,extends:>,precedes:<,nbsp:_
set matchtime=1
set number
set scrolloff=5
set showmatch
set splitbelow
set splitright
set statusline=%f\ %m\ %r%h%w%=%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}\ l\.%l,\ %1c\ /\ l\.%L,\ %1{b:charLength}%8P

"" colorscheme
syntax on
set background=dark
"set colorcolumn=81
set nocursorcolumn
set cursorline
highlight Comment      term=NONE           cterm=NONE      ctermfg=240     ctermbg=NONE
highlight Todo         term=underline      cterm=underline ctermfg=3       ctermbg=NONE
"highlight ColorColumn  term=bold           cterm=NONE      ctermfg=darkred ctermbg=NONE
highlight Cursor       term=NONE           cterm=NONE      ctermfg=NONE    ctermbg=NONE
highlight CursorColumn term=NONE           cterm=NONE      ctermfg=NONE    ctermbg=NONE
highlight CursorLine   term=NONE           cterm=NONE      ctermfg=NONE    ctermbg=233
"highlight VertSplit    term=NONE           cterm=NONE      ctermfg=0       ctermbg=240
highlight LineNr       term=NONE           cterm=NONE      ctermfg=240     ctermbg=NONE
highlight CursorLineNr term=underline      cterm=NONE      ctermfg=228     ctermbg=NONE
highlight Normal       term=NONE           cterm=NONE      ctermfg=NONE    ctermbg=NONE
highlight Pmenu        term=NONE           cterm=NONE      ctermfg=240     ctermbg=233
highlight PmenuSel     term=NONE           cterm=NONE      ctermfg=228     ctermbg=233
highlight Search       term=underline,bold cterm=reverse   ctermfg=NONE    ctermbg=NONE
highlight StatusLine   term=NONE           cterm=bold      ctermfg=0       ctermbg=yellow
highlight StatusLineNC term=NONE           cterm=NONE      ctermfg=0       ctermbg=240

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
set incsearch
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
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
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
