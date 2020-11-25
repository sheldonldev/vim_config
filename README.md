# nvim_config

- If you just want to use vim without any plugin, the only thing need to do is:

```bash
cd ~ && curl -fLo ".vimrc" https://raw.githubusercontent.com/sheldonldev/nvim_config/main/.vimrc
```

- If you want to use neovim with awesome plugins, read the followings.

## Quick Start

### Install Dependencies

- Install [NodeJS & npm](https://nodejs.org);
- Install [nerd-font](https://github.com/ryanoasis/nerd-fonts#font-installation");
- Install [Neovim](https://neovim.io) (HEAD version is recommended);
- Open `nvim` and run `:checkhealth` to checkout more todos;

- Awesome searching tools are needed for fuzzy finder plugins:

  - [FZF](https://github.com/junegunn/fzf.vim)
  - [ripgrep](https://github.com/BurntSushi/ripgrep)
  - [universal-ctags](https://github.com/universal-ctags/ctags)

  > You can install them in macOS with following commands:

  ```bash
  brew install fzf

  # To install useful key bindings and fuzzy completion:
  $(brew --prefix)/opt/fzf/install

  brew install ripgrep

  brew install --HEAD universal-ctags/universal-ctags/universal-ctags
  ```

### Clone This Repo As Configurations

- Backup and remove the old `~/.config/nvim/` folder if you've got one.

- Clone this repo to `~/.config/nvim`:

```bash
cd ~/.config/
git clone git@github.com:sheldonldev/nvim_config.git nvim
```

- Create a symbolic link for `~/.vimrc`, so you can use awesome settings for your `vim` also.

```bash
ln -s ~/.config/nvim/.vimrc ~/.vimrc
```

- Open `nvim`, the script will help you install `vim-plug` automatically.

- If you use `zsh`, skip this step: adjust the shell type in `init.vim`:

```bash
# find the following lines in `init.vim`

" open terminal "
function! OpenTerminal()
    split term://zsh    " change 'zsh' to any shell you use "
    resize 5
endfunction
```

- Read the `.vimrc` and `*.vim` to learn the keymaps;

- Use `:h _search_term_` to open the manual if have any question;

- How to enable lint? For example:
  - If you want to use lint in javascript project, run `:CocCommand eslint.createConfig`;
  - If you want to use python, run `pip install pylint`

## More Suggestions

- [More About Coc Extensions](https://doc.sheldonl.dev/working-env/vim-based-workspace/nvim-for-web-dev#more-about-coc-extensions)
- [More About Coc Language Suport Commands](https://doc.sheldonl.dev/working-env/vim-based-workspace/nvim-for-web-dev#more-about-coc-language-suport-commands)
- [More Support for Java](https://doc.sheldonl.dev/working-env/vim-based-workspace/nvim-for-web-dev#more-support-for-java)
- [More Support for C/C++](https://doc.sheldonl.dev/working-env/vim-based-workspace/nvim-for-web-dev#more-support-for-c-c)

## READ MORE

- [make vim awesome](https://doc.sheldonl.dev/working-env/vim-based-workspace/make-vim-awesome.md)
- [nvim fore web dev](https://doc.sheldonl.dev/working-env/vim-based-workspace/nvim-for-web-dev.md)
