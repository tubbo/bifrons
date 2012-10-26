# Bifrons, a sensible Vim distribution

This is a distribution of plug-ins and mappings for Vim, Gvim and
MacVim, loosely based off of the wonderful
[Janus](http://github.com/carlhuda/janus) distribution by Carl and
Yehuda.

It is designed to provide minimal working environment using the most
popular plug-ins and the most common mappings.

The distribution is completely customisable using a `~/.vimrc.before`
and `~/.vimrc.after` Vim RC files.

## Installation

The safest way is to clone to an arbitrary location, then bootstrap to
your **~/.vim** directory. This makes copies of your old configuration,
in case you want to return to it later.

```bash
$ git clone git://github.com/tubbo/bifrons.git ~/Code/bifrons
$ cd ~/Code/bifrons
$ rake
```

### Pre-requisites

The distribution is designed to work with Vim >= 7.3.

The distribution also requires `ack`, `ctags`, `git`, `ruby`, `bundler` and `rake`.
If you already have Rake, you can run the following command to install
all related external dependencies and the bundle:

```bash
$ rake install:dependencies
```

## Upgrading

To update to the latest version of the distribution, just run `rake`
inside your `~/.vim` directory.

## Personalization

Want to personalize it? Great! Fork the project and pull request in your awesome changes if you have them.

## Base Customizations

Bifrons ships with a number of basic customizations for Vim. They are
practically the same as Janus' customizations:

* Line numbers
* Ruler (line and column numbers)
* Word wrap to 100 columns
* Soft 2-space tabs, and default hard tabs to 2 spaces
* Show trailing whitespace as `.`
* Make searching highlighted, incremental, and case insensitive unless a
  capital letter is used
* Always show a status line
* Allow backspacing over everything (indentations, eol, and start
  characters) in insert mode
* `<C-P>` inserts the directory of the current file into a command
* Automatically resize splits when resizing the Vim window (GUI only)
* `<leader>ew` expands to `:e (directory of current file)/` (open in the
  current buffer)
* `<leader>es` expands to `:sp (directory of current file)/` (open in a
  horizontal split)
* `<leader>ev` expands to `:vsp (directory of current file)/` (open in
  a vertical split)
* `<leader>et` expands to `:tabe (directory of current file)/` (open in
  a new tab)
* `:w!!` expands to `%!sudo tee > /dev/null %`. Write to the current file
  using sudo (if you forgot to run it with sudo), it will prompt for
sudo password when writing
* `<F4>` toggles paste mode
* `<leader>fef` formats the entire file
* `<leader>u` converts the entire word to uppercace
* `<leader>l` converts the entire word to lowercase
* `<leader>U` converts the first char of a word to uppercase
* `<leader>L` converts the first char of a word to lowercase
* `<leader>cd` changes the path to the active buffer's file
* `<leader>md` creates the directory of the active buffer's file
  (For example, when editing a new file for which the path does not
exist.)
* `gw` swaps the current word with the following word
* `<leader>ul` underlines the current line with `=`
* `<leader>tw` toggles wrap
* `<leader>fc` finds the next conflict marker (tested with Git
  conflicted files)
* Remap `<Down>` and `<Up>` to `gj` and `gk` (Wrapped text is not
  considered a single long line of text.)
* `<leader>hs` toggles highlight search
* `<leader>=` adjusts viewports to the same size (`<C-w>=`)
* `<A-[` (`<D-[` on MacVim) shifts current line or selected lines
  rightwards
* `<A-]` (`<D-]` on MacVim) shifts current line or selected lines
  leftwards
* `<C-W>!` invokes kwbd plugin; it closes all open buffers in the open
  windows but keeps the windows open
* `<C-t>` invokes Command-T from inside the current tab
* `<D-t>` spawns a new tab, then invokes Command-T inside that tab.
  Thanks ST2!
* `<C-j>` jumps to the CTag definition for the current file. 

The following commands pertain only to Rails projects:

* `<C-g>m` invokes Command-T only for the files in app/models
* `<C-g>v` invokes Command-T only for the files in app/views
* `<C-g>c` invokes Command-T only for the files in app/controllers

### [Ack.vim](http://github.com/mileszs/ack.vim)

Although I don't personally use it, Ack allows you to search inside the
current directory for a pattern with the program `ack`. It's here for
historic purposes, and in case I can't use :Ggrep for some eason...

You can learn more about it with :help Ack.

**Customizations**: Janus rebinds command-shift-f (`<D-F>`) to bring up
`:Ack `, but I don't do this by default. You can re-enable it easily in
~/.vimrc by simply doing `set projectsearch="ack"`.

### [Command-T](https://github.com/wincent/Command-T)

I liked Command-T, because you could automatically filter it. So here it
is again.

**Customizations**: Here's why I'm using Command-T...`<C-g>` plus a letter 
maps to a number of different filtered fuzzy find searches. In Rails projects, 
for example, `<C-g>m` will only bring up models in `app/models`. It's also
mapped with `<C-t>` and `<D-t>` in MacVim.

### [NERDCommenter](http://github.com/ddollar/nerdcommenter)

NERDCommenter allows you to wrangle your code comments, regardless of
filetype. View `:help NERDCommenter` for all the details.

**Customizations**: Janus binds command-/ (`<D-/>`) to toggle comments.

### [NERDTree](https://github.com/scrooloose/nerdtree)

NERDTree is a file explorer plugin that provides "project drawer"
functionality to your vim projects.  You can learn more about it with
:help NERDTree. This is another plugin I don't personally use, in favor
of Alloy's fork of MacVim, which adds a project drawer similiar to [some
other graphical editors](http://github.com/textmate/textmate)

**Customizations**: Janus adds a number of customizations to the core
NERDTree:

* Use `<Leader>n` to toggle NERDTree
* Ignore compiled ruby, python, and java files
* When opening vim with vim /path, open the left NERDTree to that
  directory, set the vim pwd, and clear the right buffer
* In general, assume that there is a single NERDTree buffer on the left
  and one or more editing buffers on the right

### [SuperTab](http://github.com/ervandew/supertab)

In insert mode, start typing something and hit `<TAB>` to tab-complete
based on the current context.

### [Syntastic](https://github.com/scrooloose/syntastic/)

Syntastic is a syntax checking plugin that runs buffers through external syntax 
checkers as they are saved and opened. If syntax errors are detected, the user 
is notified and is happy because they didn't have to compile their code or 
execute their script to find them.

### [Tagbar](https://github.com/majutsushi/tagbar)

Tagbar is a vim plugin for browsing the tags of source code files.

**Customizations**: Janus binds `<Leader>rt` to toggle Tagbar, and
Bifrons rebinds this to `<C-h>` for quick home-row access to the CTags.
An example Rakefile to generate CTags from every gem in the bundle (and
for your own project) is provided in **lib/tasks/tags.rake**. Just copy
the task to your **~/.rake** dir and invoke it with `rake -g tags` to
use it in any application.

### [EasyMotion](https://github.com/Lokaltog/vim-easymotion)

EasyMotion provides a much simpler way to use some motions in vim. It
takes the <number> out of <number>w or <number>f{char} by highlighting
all possible choices and allowing you to press one key to jump directly
to the target.

When one of the available motions is triggered, all visible text
preceding or following the cursor is faded, and motion targets are
highlighted.

EasyMotion is triggered by one of the provided mappings.

check EasyMotion's [home
page](https://github.com/Lokaltog/vim-easymotion) for more information.

### [NrrwRgn](https://github.com/chrisbra/NrrwRgn)

Narrowing means focussing on a region and making the rest inaccessible.
You simply select the region, call :NarrowRegion and the selected part
will open in a new scratch buffer. The rest of the file will be
protected, so you won't accidentally modify that buffer. In the new
buffer, you can do a global replace, search or anything else to modify
that part. When you are finished, simply write that buffer (e.g. by
|:w|) and your modifications will be put in the original buffer making
it accessible again.

### Git Support ([Fugitive](http://github.com/tpope/vim-fugitive))

Fugitive adds pervasive git support to git directories in vim. For more
information, use `:help fugitive`

Use `:Gstatus` to view `git status` and type `-` on any file to stage or
unstage it. Type `p` on a file to enter `git add -p` and stage specific
hunks in the file.

Use `:Gdiff` on an open file to see what changes have been made to that
file

**customizations**:

* `<leader>gb` maps to `:Gblame<CR>`
* `<leader>gs` maps to `:Gstatus<CR>`
* `<leader>gd` maps to `:Gdiff<CR>`
* `<leader>gl` maps to `:Glog<CR>`
* `<leader>gc` maps to `:Gcommit<CR>`
* `<leader>gp` maps to `:Git push<CR>`

### [ZoomWin](http://github.com/vim-scripts/ZoomWin)

When working with split windows, ZoomWin lets you zoom into a window and
out again using `Ctrl-W o`

**Customizations**: Janus binds `<leader>zw` to `:ZoomWin`

### [BufferGator](https://github.com/jeetsukumaran/vim-buffergator)

Buffergator is a plugin for listing, navigating between, and selecting
buffers to edit. Upon invocation (using the command, `:BuffergatorOpen`
or `BuffergatorToggle`, or the provided key mapping, `<Leader>b`), a
`catalog` of listed buffers are displayed in a separate new window split
(vertical or horizontal, based on user options; default = vertical).
From this "buffer catalog", a buffer can be selected and opened in an
existing window, a new window split (vertical or horizontal), or a new
tab page.

Selected buffers can be "previewed", i.e. opened in a window or tab
page, but with focus remaining in the buffer catalog. Even better, you
can "walk" up and down the list of buffers shown in the catalog by using
`<C-N>` (or `<SPACE>`) / `<C-P>` (or `<C-SPACE>`). These keys select the
next/previous buffer in succession, respectively, opening it for preview
without leaving the buffer catalog viewer.

### [Vroom](https://github.com/skalnik/vim-vroom)

VRoom is a plugin inspired by [Gary Bernhardt's vim
config](https://github.com/garybernhardt/dotfiles/blob/69330074b7a15c67efa4594a71fa91592f1ce4f9/.vimrc#L286-342) 
for running your ruby tests/specs/features.

Imagine you're hacking on a Rails controller, when you switch to the
test or specs for the controller, you can use `<leader>r` to run all the
specs or `<leader>R` to run the closest spec, then you can jump back to
the controller hack on it and use `<leader>r` to run the last spec you
ran last time, so you don't need to open the test again.

Then benefits of this plugin are to centralize your workflow in one
window, one software to do it all, which is a huge speedup over using
`tmux` or multiple terminal tabs.

## Additional Syntaxes

Biffon ships with a few additional syntaxes:

* Markdown (bound to \*.markdown, \*.md, and \*.mk)
* Mustache (bound to \*.mustache)
* Haml (bound to \*.haml)
* Sass (bound to \*.sass)
* SCSS (bound to \*.scss)
* An improved JavaScript syntax (bound to \*.js)
* Javascript for any file having `nodejs` in the shebang.
* Map Gemfile, Rakefile, Vagrantfile, Procfile, Thorfile, config.ru and
  *.rake to Ruby.
* Git commits (set your `EDITOR` to `vim -f` or  `mvim -f` on OSX)
  `$ echo "export EDITOR='vim -f'" >> ~/.bashrc`, you can also use Git
  global config to set this if you have EDITOR set to something else
  `$ git config --global core.editor 'vim -f'`
* Chef commands for easily finding your way

## License

### This code is free to use under the terms of the MIT license.

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be included
in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
