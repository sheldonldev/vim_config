# README

```bash
# remove old one
rm -rf ~/.vim
# fork and clone
git clone git@github.com:sheldonldev/vim_config.git && mv vim_config ~/.vim
ln -s ~/.config/nvim/.vimrc ~/.vimrc

# install vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

vim ~/.vim/.vimrc
# command:`:PlugInstall`
# reopen

# To use the fzf finder, do this in your mac
brew install fzf

# (Optional)
# To install useful key bindings and fuzzy completion:
$(brew --prefix)/opt/fzf/install

brew install ripgrep

brew install --HEAD universal-ctags/universal-ctags/universal-ctags
```
