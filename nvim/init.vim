set termguicolors



" space as leader
let mapleader = "\<Space>"
nnoremap <Space> <Nop>
" do not map any insert mode <leader> mappings, it will cause a pause for
" every press of the spacebar!

nnoremap <leader>w :w<cr>
nnoremap <C-s> :w<cr>

" vimrc edits
nnoremap <leader>E :edit ~/.config/nvim/init.vim<cr>
nnoremap <leader>S :source ~/.config/nvim/init.vim<cr>


" Plugins (
call plug#begin('~/.config/nvim/plugged')

" general (
Plug 'tpope/vim-sensible'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
nnoremap <C-p> :Files<cr>
" general )

" go (
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'godoctor/godoctor.vim'
" go )


call plug#end()
" Plugins )
