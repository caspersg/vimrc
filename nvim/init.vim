set termguicolors



" space as leader
let mapleader = "\<Space>"
nnoremap <Space> <Nop>
" do not map any insert mode <leader> mappings, it will cause a pause for
" every press of the spacebar!

nnoremap <leader>w :w<cr>
nnoremap <C-s> :w<cr>
nnoremap <D-s> :w<cr>

" vimrc edits
nnoremap <leader>E :edit ~/.config/nvim/init.vim<cr>
nnoremap <leader>S :source ~/.config/nvim/init.vim<cr>

set incsearch " Preview as you type "
set ignorecase " Don't be case sensitive "
set smartcase " If you type a capital letter, be case sensitive "
nnoremap <Esc><Esc> :<C-u>nohlsearch<CR>

" Plugins (
call plug#begin('~/.config/nvim/plugged')

" general (
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-abolish'

Plug 'haya14busa/incsearch.vim'
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
Plug 'haya14busa/incsearch-fuzzy.vim'
map z/ <Plug>(incsearch-fuzzy-/)
map z? <Plug>(incsearch-fuzzy-?)

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" nnoremap <C-p> :Files<cr>
nnoremap <C-p> :FZF<CR>


Plug 'rking/ag.vim'
" general )

" go (
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'godoctor/godoctor.vim'
" go )


call plug#end()
" Plugins )
