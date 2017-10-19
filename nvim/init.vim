set termguicolors



" space as leader
let mapleader = "\<Space>"
nnoremap <Space> <Nop>
" do not map any insert mode <leader> mappings, it will cause a pause for
" every press of the spacebar!

nnoremap <leader>w :w<cr>
nnoremap <C-s> :w<cr>
nnoremap <D-s> :w<cr>

" config edits
nnoremap <leader>E :edit ~/.config/nvim/init.vim<cr>
nnoremap <leader>S :source ~/.config/nvim/init.vim<cr>

set incsearch " Preview as you type "
set ignorecase " Don't be case sensitive "
set smartcase " If you type a capital letter, be case sensitive "
nnoremap <Esc><Esc> :<C-u>nohlsearch<CR>

" search and replace, run after an incremental search
nnoremap <leader>r :%s//
" trying to automatically insert the /c at the end
" command! -nargs=1 Replace execute "%s/" string(<q-args>) "/c"
" command! -nargs=1 FW execute "echo" string(<q-args>)
:set autoread

" font
set guifont=mononoki:h16,Ubuntu\ Mono\ 12,Inconsolata\ 12,\ Envy\ Code\ R\ 10

" Plugins (
call plug#begin('~/.config/nvim/plugged')

" general (
" tpope basic vim
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-fugitive'

" better incremental search
Plug 'haya14busa/incsearch.vim'
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

" fuzzy incremental search
Plug 'haya14busa/incsearch-fuzzy.vim'
map z/ <Plug>(incsearch-fuzzy-/)
map z? <Plug>(incsearch-fuzzy-?)

" fuzzy file search
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" " [Tags] Command to generate tags file
let g:fzf_tags_command = 'ctags -R'
" nnoremap <C-p> :Files<cr>
nnoremap <C-p> :FZF<CR>
nmap <Leader>b :Buffers<CR>
nmap <Leader>p :Files<CR>
nmap <Leader>t :Tags<CR>

" search all files
Plug 'mileszs/ack.vim'
cnoreabbrev Ack Ack!

" make parens rainbow
Plug 'luochen1990/rainbow'
let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle

" code completion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Use deoplete.
let g:deoplete#enable_at_startup = 1


" color scheme
Plug 'bluz71/vim-moonfly-colors'


" general )

" go (
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
map <C-.> :GoDef<CR>
map <C-<> :GoReferrers<CR>
map <C-,> :GoDefPop<CR>
Plug 'godoctor/godoctor.vim'
Plug 'jodosha/vim-godebug'

" deoplete for go
Plug 'zchee/deoplete-go', { 'do': 'make'}
" go )
nnoremap C-. :GoDef<cr>


call plug#end()
" Plugins )


" color scheme
colorscheme moonfly
