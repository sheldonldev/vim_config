# README                                                                                                                                                                                                                                                                              1
## Dependencies

- `hexokinase` depends on golang

```bash
wget -c https://dl.google.com/go/go1.17.3.linux-amd64.tar.gz -O - | sudo tar -xz -C /usr/local
export PATH=$PATH:/usr/local/go/bin
go version

# make hexokinase
cd ~/.vim/plugged/hexokinase
make hexokinase
```

- `coc.nvim` depends on node

```bash
cd ~ && git clone https://github.com/nvm-sh/nvm.git .nvm
git checkout v0.38.0  # check out latest version

# ~/.bashrc
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# install and run nodejs
nvm ls-remote
nvm install 14.5.3
nvm exec 14.5.3 node --version # use specific version
```

## Basic Setup

```bash
# if you want to backup old one
mv ~/.vim ~/.vim.backup

# clone this repo to ~/.vim and soft link the .vimrc to ~
cd ~ && git clone https://github.com/sheldonldev/vim_config.git .vim
ln -s ~/.vim/.vimrc ~/.vimrc

# install vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

vim ~/.vim/.vimrc
# command:`:PlugInstall`
# reopen
```

## Enable fzf

### MacOS

```bash
# To use the fzf finder, do this in your mac
brew install fzf

# To install useful key bindings and fuzzy completion:
$(brew --prefix)/opt/fzf/install # Optional

brew install ripgrep

brew install --HEAD universal-ctags/universal-ctags/universal-ctags
```

### Linux

```bash
sudo apt install fzf
```
