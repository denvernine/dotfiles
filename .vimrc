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
set cursorcolumn
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX) && getenv('TERM_PROGRAM') != 'Apple_Terminal')
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif
colorscheme gruvbox

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
  "" which provides support for expanding abbreviations similar to emmet.
  "" e.g.) type `ul>li*2+li>(span>a[href=https://example.com]{sample page})+button.small^div#bottom>data[value=1319898155]` and `<C-y> + ,`
  Jetpack 'mattn/emmet-vim'
  "" A simple, easy-to-use Vim alignment plugin.
  Jetpack 'junegunn/vim-easy-align'
  "" colorscheme
  Jetpack 'morhetz/gruvbox'
call jetpack#end()
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
