vim-javascript-gf.vim
========

Tools to make Vim superb for developing with Node.js.  

## Tour

- Use `gf` on paths or requires to open the same file Node.js would.
- Use `gf` on `require(".")` to open `./index.js`
- Use `gf` on `require("./dir")` to open `./dir/index.js`
- Use `gf` on `require("./foo")` to open `foo.js`.
- Use `gf` on `require("./package")` and have it open package.json.
- Use `gf` on `require("module")` to open the module's main file (parsed for you from `package.json`).
- Use `gf` on `require("module/lib/utils")` and open files inside the module.

## Installing

To install using [Vundle](https://github.com/gmarik/vundle):

    " add this line to your .vimrc file
    Plugin 'feix760/vim-javascript-gf.vim'

or:

    git clone https://github.com/feix760/vim-javascript-gf.vim.git
    cp -r vim-javascript-gf.vim/* ~/.vim/

## Using

Open any JavaScript file inside a Node project and you're all set.

- Use `gf` inside `require("...")` to jump to source and module files.

