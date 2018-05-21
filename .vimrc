"*** general ***
set encoding=utf-8
set nocompatible
filetype plugin on
set regexpengine=1 "avoid slow scroll
set lazyredraw "avoid slow scroll
set ttyfast "avoid slow scroll
set ambiwidth=double
set noendofline
set noswapfile
inoremap <silent> jj <ESC>
nnoremap ; :
nnoremap j gj
nnoremap k gk
command! -nargs=1 -complete=file Rename f <args>|call delete(expand('#')) "add :Rename command. renamimng the current file (include path)
"*** appearance ***
set history=20
set laststatus=2
set list
set listchars=tab:>_,trail:_,extends:>,precedes:<,nbsp:%
set matchtime=1
set number
set ruler
set scrolloff=5
set showmatch
set splitbelow
set splitright
set statusline=%f\ %m\ %r%h%w%=%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}\ L%l,%c/%3L%8P
"****** colorscheme ***
syntax on
set background=dark
set cursorline
augroup highlightOverLengh
  au!
  au VimEnter,WinEnter *  match OverLength /\%81v.\+/
augroup END
augroup syntaxHighlightYaml
  au!
  au BufNewFile,BufRead *.yaml,*.yml so ~/.vim/yaml.vim
augroup END
highlight Comment ctermfg=240
highlight CursorLine term=none cterm=none ctermbg=none ctermfg=none
highlight CursorLineNr term=underline cterm=none ctermbg=none ctermfg=228
highlight LineNr ctermbg=none ctermfg=240
highlight OverLength ctermbg=darkred ctermfg=white
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
  au BufNewFile,BufRead *.php setlocal sw=4 sts=4 ts=4
augroup END
"*** search ***
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
