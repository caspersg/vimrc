set nocompatible              " be iMproved, required

" Should always have the same value for simplicity's sake "
set shiftwidth=2 tabstop=2 softtabstop=2
set expandtab
syntax on

nnoremap <leader>E :edit $MYVIMRC<cr>
nnoremap <leader>S :source $MYVIMRC<cr>

:set clipboard=unnamedplus
set go+=a               " Visual selection automatically copied to the clipboard

" show matches
:set showmatch
:set matchtime=3

" String to put at the start of lines that have been wrapped "
let &showbreak='↪ '

" Minimal number of screen lines to keep above and below the cursor "
set scrolloff=3

:set relativenumber
:set nopaste

set incsearch " Preview as you type "
set ignorecase " Don't be case sensitive "
set smartcase " If you type a capital letter, be case sensitive "

" save file whether in insert or normal mode "
inoremap <leader>s <c-o>:w<cr><esc>
nnoremap <leader>s :w<cr>

" When sourcing multiple times your vimrc file "
" clear the autocommands first instead of adding them "
augroup mygroup
    autocmd!
    autocmd FileType make setlocal noexpandtab
augroup END

" required for vundle
filetype off
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
" Plugin 'user/L9', {'name': 'newL9'}

Plugin 'mileszs/ack.vim'

Plugin 'airblade/vim-gitgutter'
Plugin 'taglist.vim'
Plugin 'majutsushi/tagbar'
nmap <F8> :TagbarToggle<CR>


" syntax highlighting
Plugin 'strogonoff/vim-coffee-script'
Bundle 'lukaszkorecki/CoffeeTags'
let g:CoffeeAutoTagIncludeVars=1

Plugin 'mustache/vim-mustache-handlebars'

Plugin 'luochen1990/rainbow'
let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle

Plugin 'terryma/vim-multiple-cursors'
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<A-n>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

Plugin 'inside/vim-search-pulse'

Plugin 'Raimondi/delimitMate'
let delimitMate_expand_inside_quotes=1
let delimitMate_quotes = "\" ' `"

Plugin 'tpope/vim-surround'
Plugin 'vim-scripts/camelcasemotion'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line



set runtimepath^=~/.vim/bundle/ctrlp.vim

" Note: Skip initialization for vim-tiny or vim-small.
if !1 | finish | endif

if has('vim_starting')
if &compatible
set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:

NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
" Refer to |:NeoBundle-examples|.
" Note: You don't set neobundle setting in .gvimrc!

call neobundle#end()

" Required:
filetype plugin indent on

NeoBundle 'mileszs/ack.vim'

NeoBundle 'Shougo/vimproc.vim', {
\ 'build' : {
\     'windows' : 'tools\\update-dll-mingw',
\     'cygwin' : 'make -f make_cygwin.mak',
\     'mac' : 'make -f make_mac.mak',
\     'linux' : 'make',
\     'unix' : 'gmake',
\    },
\ }

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

syntax on
filetype plugin indent on

if has('gui_running')
  set guifont=Ubuntu\ Mono\ 12
  set anti gfn=Ubuntu\ Mono\ 12,Inconsolata\ 12,\ Envy\ Code\ R\ 10
endif

colorscheme twilight

" hide menus
set guioptions-=m  "menu bar
set guioptions-=T  "toolbar
set guioptions-=r  "scrollbar

" silver searcher
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

set ic
set hls is

" To enable the saving and restoring of screen positions.
let g:screen_size_restore_pos = 1

" To save and restore screen for each Vim instance.
" This is useful if you routinely run more than one Vim instance.
" For all Vim to use the same settings, change this to 0.
let g:screen_size_by_vim_instance = 1

set ssop+=resize,winpos,winsize,blank,buffers,curdir,folds,help,options,tabpages


" save and restore session on exit and start
"
autocmd VIMEnter * :source ~/.session.vim
autocmd VIMLeave * :mksession! ~/.session.vim

if has("gui_running")
  function! ScreenFilename()
    if has('amiga')
      return "s:.vimsize"
    elseif has('win32')
      return $HOME.'\_vimsize'
    else
      return $HOME.'/.vimsize'
    endif
  endfunction

  function! ScreenRestore()
    " Restore window size (columns and lines) and position
    " from values stored in vimsize file.
    " Must set font first so columns and lines are based on font size.
    let f = ScreenFilename()
    if has("gui_running") && g:screen_size_restore_pos && filereadable(f)
      let vim_instance = (g:screen_size_by_vim_instance==1?(v:servername):'GVIM')
      for line in readfile(f)
        let sizepos = split(line)
        if len(sizepos) == 5 && sizepos[0] == vim_instance
          silent! execute "set columns=".sizepos[1]." lines=".sizepos[2]
          silent! execute "winpos ".sizepos[3]." ".sizepos[4]
          return
        endif
      endfor
    endif
  endfunction

  function! ScreenSave()
    " Save window size and position.
    if has("gui_running") && g:screen_size_restore_pos
      let vim_instance = (g:screen_size_by_vim_instance==1?(v:servername):'GVIM')
      let data = vim_instance . ' ' . &columns . ' ' . &lines . ' ' .
            \ (getwinposx()<0?0:getwinposx()) . ' ' .
            \ (getwinposy()<0?0:getwinposy())
      let f = ScreenFilename()
      if filereadable(f)
        let lines = readfile(f)
        call filter(lines, "v:val !~ '^" . vim_instance . "\\>'")
        call add(lines, data)
      else
        let lines = [data]
      endif
      call writefile(lines, f)
    endif
  endfunction

  if !exists('g:screen_size_restore_pos')
    let g:screen_size_restore_pos = 1
  endif
  if !exists('g:screen_size_by_vim_instance')
    let g:screen_size_by_vim_instance = 1
  endif
  autocmd VimEnter * if g:screen_size_restore_pos == 1 | call ScreenRestore() | endif
  autocmd VimLeavePre * if g:screen_size_restore_pos == 1 | call ScreenSave() | endif
endif


" ctags
"
" coffeescript
let g:tagbar_type_coffee = {
    \ 'ctagstype' : 'coffee',
    \ 'kinds'     : [
        \ 'c:classes',
        \ 'm:methods',
        \ 'f:functions',
        \ 'v:variables',
        \ 'f:fields',
    \ ]
\ }

if executable('coffeetags')
  let g:tagbar_type_coffee = {
    \ 'ctagsbin' : 'coffeetags',
    \ 'ctagsargs' : '',
    \ 'kinds' : [
      \ 'f:functions',
      \ 'o:object',
    \ ],
    \ 'sro' : ".",
    \ 'kind2scope' : {
      \ 'f' : 'object',
      \ 'o' : 'object',
    \ }
  \ }
endif

let g:tagbar_type_css = {
\ 'ctagstype' : 'Css',
    \ 'kinds'     : [
        \ 'c:classes',
        \ 's:selectors',
        \ 'i:identities'
    \ ]
\ }

let g:tagbar_type_groovy = {
    \ 'ctagstype' : 'groovy',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'c:class',
        \ 'i:interface',
        \ 'f:function',
        \ 'v:variables',
    \ ]
\ }



