# nvim_config

- If you just want to use vim without any plugin, the only thing need to do is:

```bash
cd ~ && curl -fLo ".vimrc" https://raw.githubusercontent.com/sheldonldev/nvim_config/main/.vimrc
```

- If you want to use neovim with awesome plugins, read the followings.

## Install Dependencies

- [NodeJS & npm](https://nodejs.org) and some global npm packages:

```bash
npm i -g eslint -D  # DO NOT install any eslint-pluin-* globally
```

- [nerd-font](https://github.com/ryanoasis/nerd-fonts#font-installation")
- [the_silver_searcher](https://github.com/ggreer/the_silver_searcher)

## Install Neovim and Plugin Manager

- [Neovim](https://neovim.io)
- run `:checkhealth` in nvim to checkout more todos
- [vim-plugin](https://github.com/junegunn/vim-plug)

## Language Server Protocol

- We use [coc.nvim](https://github.com/neoclide/coc.nvim) as LSP;
- Checkout [most extentions of coc.nvim](https://github.com/neoclide);

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

- Adjust the integrated terminal settings in `init.vim`:

```bash
# find the following lines and change settings adapt to your own shell

" open terminal "
function! OpenTerminal()
split term://zsh    "change this line, default is zsh"
resize 5
endfunction
```

- Read the `.vimrc` and `init.vim` to learn the keymaps, or use `:h _search_term_` to read the manual.

## More Dependencies and Config For Specific Languages

- Default use `~/.eslintrc.json` and `~/.prettierrc.json` to lint.

### Python

- Install [ctags](http://ctags.sourceforge.net/) or run `brew install ctags` for `coc-python`
- More details in [coc-python]()

### PHP

- More details in [coc-php](https://github.com/marlonfan/coc-phpls)

### Java

- JDK
- More details in [coc-java](https://github.com/neoclide/coc-java)

### C/C++

- The C/C++ part referres to <https://ianding.io/2019/07/29/configure-coc-nvim-for-c-c++-development/>

- Install `brew install ccls` for C/C++.

- To set up a C/C++ project:
  - generate `compile_commands.json` and put it to your project root. In macOS, you can use one of the following methods;
    1. Intercepting the system calls and extracting the arguments passed to the compiler by dynamic library injection (e.g. Bear, scan-build):
      - pros: works for hard-coded compiler path;
      - cons: macOS prohibits dynamic library injection for security reasons if the the program to be injected is system software (e.g. clang from Xcode).
    2. Using a compiler wrapper (e.g. scan-build):
      - pros: doesn’t violate security policies;
      - cons: the compiler path must not be hard-coded.
  - place `.ccls` to your project root. It is a text file, in which each line is a command line argument passed to the compiler. Here is an example of .ccls:

  ```text
    -I
    ../include
    -I
    ../vendor/include
    -std=c++14
    -stdlib=libc++
    -fPIC
  ```

- If ccls cannot find your system headers…
  - If you are using macOS, then chances are ccls cannot find system headers and as a result reports a bunch of errors.
  - This is because new macOS systems moves system headers into the macOS SDK directory and no longer places them in `/usr/include`. And the reason why ccls can find the system headers previously is that `/usr/include` is hard-coded into ccls during compilation.
  - To solve this problem, you can manually adding the path of the system headers to `.ccls`. Here is how to get the path:
    - Run `g++ -E -x c++ - -v < /dev/null` in your terminal and you’ll see a list of include paths that the compiler searches. They are between `#include <...> search starts here:` and End of search list..
    - Now put them into your `.ccls` file as `-isystem` options (unlike `-I`, the errors and warnings in the header files found in `-isystem` paths are ignored by the syntax checker).
    - After manually adding these system header paths, the `.ccls` file might look like this:

    ```text
    -isystem
    /usr/local/include
    -isystem
    /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/include/c++/v1
    -isystem
    /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/clang/10.0.1/include
    -isystem
    /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/include
    -isystem
    /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.14.sdk/usr/include
    ```

## READ MORE

- [How I Build My First `.vimrc`](https://doc.sheldonl.dev/working-env/vim-based-workspace/make-vim-awesome.md)
- [How I Build My First `init.vim`](https://doc.sheldonl.dev/working-env/vim-based-workspace/nvim-for-web-dev.md)
