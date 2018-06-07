"*** general ***
set encoding=utf-8
set nocompatible
filetype plugin on
set regexpengine=1
set ttyfast
set ambiwidth=double
set noendofline
set noswapfile
set nowrap
inoremap <silent> jj <ESC>
nnoremap ; :
nnoremap j gj
nnoremap k gk
command! -nargs=1 -complete=file Rename f %:p:h/<args>|call delete(expand('#'))|w
command! -nargs=0 -bang MkDir !mkdir -p %:p:h
"*** appearance ***
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
set statusline=%f\ %m\ %r%h%w%=%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}\ L%l,%2c\ /\ L%L,%2{b:charLength}%8P
"****** colorscheme ***
syntax on
set background=dark
set colorcolumn=80
set cursorline
augroup highlightCharacterLengh
  au!
  au VimEnter,WinEnter * match OverMaxLength /\%>120v.\+/
augroup END
highlight ColorColumn ctermfg=darkred ctermbg=none
highlight Comment ctermfg=240
highlight CursorLine term=none cterm=none ctermbg=none ctermfg=none
highlight CursorLineNr term=underline cterm=none ctermbg=none ctermfg=228
highlight LineNr ctermbg=none ctermfg=240
highlight OverMaxLength ctermbg=darkred ctermfg=white
highlight StatusLineNC cterm=none ctermbg=240 ctermfg=16
highlight TODO cterm=underline ctermbg=none ctermfg=3
highlight VertSplit ctermbg=240 ctermfg=16
"*** indent ***
set autoindent
set expandtab
set shiftwidth=2
set smartindent
set softtabstop=2
set tabstop=2
augroup fileTypeIndent
  au!
  au BufNewFile,BufRead *.json setlocal sw=4 sts=4 ts=4 filetype=javascript
  au BufNewFile,BufRead *.md setlocal sw=4 sts=4 ts=4
  au BufNewFile,BufRead *.php setlocal sw=4 sts=4 ts=4
  au BufNewFile,BufRead *.twig setlocal sw=2 sts=2 ts=2 filetype=html
  au BufNewFile,BufRead *.yaml,*.yml setlocal sw=4 sts=4 ts=4
augroup END
"*** search ***
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
nnoremap <silent> <ESC><ESC> :nohlsearch<CR>
