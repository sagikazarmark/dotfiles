# Dotfiles

This repository contains my [dotfiles](https://wiki.archlinux.org/index.php/Dotfiles).


## Table of contents

- [How it works](#how-it-works)
- [Installation](#installation)
- [Attribution](#attribution)
- [More reading](#more-reading)


## How it works

This repo comes with a set of (platform dependent) install scripts that install the necessary packages using the platform's default package manager.

The more interesting part is how configuration for each package is managed. I use a tool called (GNU) [stow](https://www.gnu.org/software/stow/) that symlinks my config files from my dotfiles repo to my home directory. [Read more](#gnu-stow) about stow by following the links below.

Previously I preferred relocating config files to the dotfile repo using environment variables (when it was possible), but this is more compatible with other users' environments and more straightforward overall.

Another important guideline for my dotfiles is that I try to keep my home directory clean. I prefer following the [XDG Base directory standard](https://wiki.archlinux.org/index.php/XDG_Base_Directory) and put everything in those directories whenever possible.


## Installation

**⚠️ Warning ⚠️**
I don't recommend using my dotfiles directly. Pick the parts you like and copy them to your dotfiles. That is the way.

### Linux

WIP

### MacOS

Make sure `git` is installed:

```shell
xcode-select --install
```

Clone this repository:

```shell
git clone git@github.com:sagikazarmark/dotfiles.git $HOME/.dotfiles
```

Run the install script:

```shell
cd $HOME/.dotfiles
./install-mac.sh
```

> You'll probably have to grant permissions to tons of apps.

Optionally, install development stuff (but probably open the installed terminal emulator first):

```shell
./install-dev.sh
```


## Attribution

Although I've done my own research and spend time with these configurations,
I took a lot of inspiration from other people's dotfiles as well:

- https://gitlab.com/TamasBarta/dotfiles
- https://github.com/LukeSmithxyz/voidrice
- https://github.com/craftzdog/dotfiles-public
- https://github.com/koekeishiya/dotfiles
- https://gitlab.com/waterkip/dotty
- https://github.com/xero/dotfiles

I'm pretty sure there were others as well, so this is not an exclusive list. Many thanks to all the authors out there.


## More reading

### GNU Stow

- Project home: https://www.gnu.org/software/stow/
- https://medium.com/@waterkip/managing-my-dotfiles-with-gnu-stow-262d2540a866
- https://alexpearce.me/2016/02/managing-dotfiles-with-stow/
- http://brandon.invergo.net/news/2012-05-26-using-gnu-stow-to-manage-your-dotfiles.html
- http://letmegooglethat.com/?q=gnu+stow
