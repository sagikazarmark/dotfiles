# Dotfiles

This repository contains my [dotfiles](https://wiki.archlinux.org/index.php/Dotfiles).


## Table of contents

- [How it works](#how-it-works)
- [Installation](#installation)
- [Random stuff](#random-stuff)
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


## Random stuff

### MacOS

I use [yabai](https://github.com/koekeishiya/yabai) (with [skhd](https://github.com/koekeishiya/skhd)) as a tiling window manager. If you are lazy and prefer not to move your hands (away from the keyboard) you'll like it. [Read more](#yabai) below.

[Karabiner Elements](https://karabiner-elements.pqrs.org/) is also a great tool for reducing the amount of time your hands have to spend away from the keyboard. For instance, I mapped Caps Lock to Escape/fn with other keys. Caps Lock is a useless functionality, Escape is too far away for my pinky and some keyboards doesn't have fn on the left, but all of them have Caps Lock, so my hotkeys are more portable this way.

Speaking of keyboards: checkout [this keyboard layout](https://github.com/zaki/mac-hun-keyboard) if you are tired of the degenerate macOS layout. It puts back everything where it should be (Alt+V is @, Alt+Q is \, etc). Especially useful for programming. (Note: this is a Hungarian layout)

I use [Kitty](https://sw.kovidgoyal.net/kitty) as a terminal emulator. I used iTerm for a long time, but Kitty is cross platform and it has a proper configuration file (compared to iTerm's Apple plist bullshit). I tried [Alacritty](https://github.com/alacritty/alacritty) (because Rust), but Kitty seems more active and more popular. (Fun fact: Kitty's author also created [Calibre](https://calibre-ebook.com/), another fine piece of software I use.)


## Attribution

Although I've done my own research and spend time with these configurations,
I took a lot of inspiration from other people's dotfiles as well:

- https://gitlab.com/TamasBarta/dotfiles
- https://github.com/LukeSmithxyz/voidrice
- https://github.com/craftzdog/dotfiles-public
- https://github.com/koekeishiya/dotfiles
- https://gitlab.com/waterkip/dotty
- https://github.com/xero/dotfiles
- https://gitlab.com/dwt1/dotfiles

I'm pretty sure there were others as well, so this is not an exclusive list. Many thanks to all the authors out there.


## More reading

### GNU Stow

- Project home: https://www.gnu.org/software/stow/
- https://bastian.rieck.me/blog/posts/2019/dotfiles_stow/
- https://medium.com/@waterkip/managing-my-dotfiles-with-gnu-stow-262d2540a866
- https://alexpearce.me/2016/02/managing-dotfiles-with-stow/
- http://brandon.invergo.net/news/2012-05-26-using-gnu-stow-to-manage-your-dotfiles.html
- http://letmegooglethat.com/?q=gnu+stow

### Yabai

- https://www.youtube.com/watch?v=JL1lz77YbUE
- https://www.notion.so/Yabai-8da3b829872d432fac43181b7ff628fc
- https://stevenlee090.github.io/yabai-skhd-wm/
