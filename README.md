tomtaylor/vim-files
==

There are many like them, but these are mine.

The Rakefile was stolen from
[mislav/vimfiles](https://github.com/mislav/vimfiles) - thanks!

The only real pain is compiling the Ruby extension for Command-T. It needs to
be compiled with the same version of Ruby as vim was compiled with. The
`command_t` task in the Rakefile should alert you to that though.

Install like so:

    git clone git@github.com:tomtaylor/vim-files.git ~/.vim
    cd ~/.vim
    rake

You'll probably want MacVim or similar installed beforehand.
