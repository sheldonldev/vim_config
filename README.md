# nvim_config

-   If you just want to use vim without any plugin, the only thing need to do is:

    ```bash
    cd ~ && curl -fLo ".vimrc" https://raw.githubusercontent.com/sheldonldev/nvim_config/main/.vimrc
    ```

-   If you want to use neovim with awesome plugins, read the followings.

## Install Dependencies

-   [NodeJS & npm](https://nodejs.org) and some global npm packages:

    ```bash
    npm i -g eslint -D  # DO NOT install any eslint-pluin-* globally
    ```

-   [nerd-font](https://github.com/ryanoasis/nerd-fonts#font-installation")
-   [the_silver_searcher](https://github.com/ggreer/the_silver_searcher)
-   Install [ctags](http://ctags.sourceforge.net/) or run `brew install ctags`

## Install Neovim and Plugin Manager

-   [Neovim](https://neovim.io)
-   run `:checkhealth` in nvim to checkout more todos
-   [vim-plugin](https://github.com/junegunn/vim-plug)

## Clone This Repo As Config

```bash
# remove the old ~/.config/nvim/ folder at first

# then clone this repo as ~/.config/nvim
cd ~/.config/
git clone git@github.com:sheldonldev/nvim_config.git nvim

# create symbolic links
ln -s ~/.config/nvim/.vimrc ~/.vimrc
ln -s ~/.config/nvim/.prettierrc.json ~/.prettierrc.json
ls -s ~/.config/nvim/.eslintrc.json ~/.eslintrc.json
```

-   Adjust the integrated terminal settings in `init.vim`:

```bash
# find the following lines and change settings adapt to your own shell

" open terminal "
function! OpenTerminal()
    split term://zsh    "change this line, default is zsh"
    resize 5
endfunction
```

-   Read the `.vimrc` and `init.vim` to learn the keymaps, or use `:h _search_term_` to read the manual.

## READ MORE

-   [How I Build My First `.vimrc`](https://doc.sheldonl.dev/working-env/vim-based-workspace/make-vim-awesome.md)
-   [How I Build My First `init.vim`](https://doc.sheldonl.dev/working-env/vim-based-workspace/nvim-for-web-dev.md)
