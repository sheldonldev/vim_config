# nvim_config

- If you want to use vim without any plugin:

```bash
cd ~ && curl -fLo ".vimrc" https://raw.githubusercontent.com/sheldonldev/nvim_config/main/.vimrc
```

- If you want to use neovim with awesome plugins, read the followings.

## Features of the Neovim Configurations

> I want to keep the config powerful but still as lean as possible.

- Integrated nvim terminal;
- Theme: `gruvbox`;
- Explorer: `coc-explorer` with Nerd Font;
- Status line and tabline: `vim-aireline`;
- Fuzzy Finder: `fzf.vim` with `vim-rooter`, `FZF`, `universal-ctags`, and `ripgrep`;
- Git: `fugitive`;
- Commentary: `vim-commentary`;
- Auto-completion: `coc.nvim`;
- Syntax highlight: `vim-treesitter`, you should checkout `:TSInstallInfo` and run `:TSInstall`/`:TSUninstall`/`:TSUpdate` as needed;
- Lint: `coc-eslint`, other languages' lint depend on lint tools such as `pylint`;
- Prettier: `coc-prettier`;
- Well supported languages (highlight, lint, prettier, auto completion):
  - js/ts: `coc.nvim`, `coc-tsserver`, `coc-vue`;
  - html: `coc-emmet`;
  - css and scss: `coc-css`, `coc-tailwindcss`;
  - php: `coc-phpls`;
  - python: `coc-jedi`;
  - json: `coc-json`;
  - yaml: `coc-yaml`;
- Languages can be more featured:
  - Java: [Java in Neovim](https://www.chrisatmachine.com/Neovim/24-neovim-and-java/)
  - C++: [Configure coc.nvim for C/C++ Development](https://ianding.io/2019/07/29/configure-coc-nvim-for-c-c++-development/)
- Other languages are not considered here.

## Quick Start

### Install Dependencies

- Install [NodeJS & npm](https://nodejs.org);
- Install [Nerd Font](https://github.com/ryanoasis/nerd-fonts#font-installation");
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

## READ MORE

- [make vim awesome](https://doc.sheldonl.dev/working-env/vim-based-workspace/make-vim-awesome.md)
- [nvim fore web dev](https://doc.sheldonl.dev/working-env/vim-based-workspace/nvim-for-web-dev.md)
