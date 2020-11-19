# nvim_config


## MacOS

### Install Dependencies

* [NodeJS & npm](https://nodejs.org)
* [nerd-font](https://github.com/ryanoasis/nerd-fonts#font-installation")
* [the_silver_searcher](https://github.com/ggreer/the_silver_searcher)
* [oh-my-zsh](https://ohmyz.sh/)

### Install Neovim and Plugin Manager

* `brew install neovim`
* [vim-plugin](https://github.com/junegunn/vim-plug)

### Clone This Repo As Config

```bash
# remove the old ~/.config/nvim/ folder at first

# then clone this repo as ~/.config/nvim
cd ~/.config/
git clone git@github.com:sheldonldev/nvim_config.git nvim

# create a symbolic link as ~/.vimrc
ln -s ~/.config/nvim/.vimrc ~/.vimrc

# done
```

### Any Question?

* [READE MORE](https://doc.sheldonl.dev/working-env/vim-based-workspace/nvim-for-web-dev.md)
