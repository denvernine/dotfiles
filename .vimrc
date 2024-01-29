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

if has('nvim')
  " Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
  " If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
  " (see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
  if (empty($TMUX) && getenv('TERM_PROGRAM') != 'Apple_Terminal')
    if (has('nvim'))
      " For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
      let $NVIM_TUI_ENABLE_TRUE_COLOR=1
    endif

    " For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
    " Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
    " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
    if (has('termguicolors'))
      set termguicolors
    endif
  endif

  colorscheme gruvbox
endif

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

highlight over80       ctermbg=3   ctermfg=0
highlight over120      ctermbg=1   ctermfg=7
call matchadd('over80', '.\%>81v')
call matchadd('over120', '.\%>121v')

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
if has('nvim')
  """ setting for 'tani/vim-jetpack'
  """ hit `:source %` and `:JetpackSync` command
  let s:plugin_manager = stdpath('data') .. '/site/pack/jetpack/opt/vim-jetpack/plugin/jetpack.vim'
  let s:source_url = 'https://raw.githubusercontent.com/tani/vim-jetpack/master/plugin/jetpack.vim'
else
  """ setting for 'junegunn/vim-plug'
  """ hit `:source %` and `:PlugInstall` command
  let s:plugin_manager = '~/.vim/autoload/plug.vim'
  let s:source_url = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
endif

if !filereadable(glob(s:plugin_manager))
  call system(printf('curl -fsSL -o %s --create-dirs -- %s', s:plugin_manager, s:source_url))

  if has('nvim')
    autocmd VimEnter * JetpackSync | source $MYVIMRC
  else
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
  endif
endif

if has('nvim')
  packadd vim-jetpack
  call jetpack#begin()
    """ bootstrap
    Jetpack 'tani/vim-jetpack', {'opt':1}
    """ which provides support for expanding abbreviations similar to emmet.
    """ e.g.) type `ul>li*2+li>(span>a[href=https://example.com]{sample page})+button.small^div#bottom>data[value=1319898155]` and `<C-y> + ,`
    Jetpack 'mattn/emmet-vim'
    """ A simple, easy-to-use Vim alignment plugin.
    Jetpack 'junegunn/vim-easy-align'
    """ colorscheme
    Jetpack 'morhetz/gruvbox', {'opt':1}
  call jetpack#end()
else
  call plug#begin('~/.vim/plugged')
    """ which provides support for expanding abbreviations similar to emmet.
    """ e.g.) type `ul>li*2+li>(span>a[href=https://example.com]{sample page})+button.small^div#bottom>data[value=1319898155]` and `<C-y> + ,`
    Plug 'mattn/emmet-vim'
    """ A simple, easy-to-use Vim alignment plugin.
    Plug 'junegunn/vim-easy-align'
  call plug#end()
  let g:indentLine_color_term = 239
endif

xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
