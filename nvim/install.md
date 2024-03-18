
# install

brew install neovim

brew install ripgrep

<!-- from https://gist.github.com/davidteren/898f2dcccd42d9f8680ec69a3a5d350e -->

brew tap homebrew/cask-fonts
brew install --cask font-mononoki-nerd-font

# install kickstart

git clone https://github.com/nvim-lua/kickstart.nvim.git "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim

rm .git from nvim
setup soft link in my ~/projects/vimrc

# install terminal
## kitty

brew install --cask kitty

configure kitty font

font_family Monoki Nerd Font Mono
bold_font auto
italic_font auto
bold_italic_font auto

font_size 16.0

## iterm
gone back to iterm

## windows terminal ubuntu WSL

# configure neovim


# setup git
vim-fugitive
caspersg/shell/git_aliases.sh
diffview.nvm

# TODO
- [x] better theme
-- tokyodark
- [ ] ruby_lsp
- [ ] rebuild ruby env?
- [ ] python lsp
- [ ] learn vim registers
- [ ] chatgpt


# testing

( ( hi ) )

[ { "json": "d"} ]
