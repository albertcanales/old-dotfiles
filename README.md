A simple repository for managing my dotfiles.

Right now divided into two branches:
- master: For my current dotfiles
- arch: For a complete new system build on Arch and Ansible

Eventually, the second is going to replace the first. The rest of the README contains the information for master.

, using my own system based on GNU Stow.

Currently running Manjaro, bspwm, Polybar and my own automation system based on GNU Stow.

## Info

```
Theme         = Dracula
WM            = bspwm
Bar           = Polybar
Terminal      = kitty
Font          = Source Code Pro
Wallpapers    = on wallpapers module
Shell         = bash
Editor        = Sublime or nvim
Notifications = dunst
```

## Installation

`cd` to your cloned repository

`./postinstall.sh` to install packages

`./autostow` to apply the configuration

## Scripts

### autostow

Automates the stowing process. The dotfiles are divided into *modules* (directories in the dotfiles directory).

Each module should be added on the corresponding `autostow` array, depending on the location of the dotfiles.

When autostowing the package, the contents of the module will automatically be added to the given location, creating it if necessary.

For convenience, some usages are predefined:

- **No arguments**: Autostows all modules.

- **Modules as arguments**: Autostows only the given modules.

- **`-D` followed by modules names**: Unstows the given modules.

I also use the following aliases to automate the process:

```
alias autostow="cd ~/dotfiles && ~/dotfiles/autostow"
alias stowedit="vim ~/dotfiles/autostow && autostow"
```

Each time you add a new file to a module, remember to autostow that module.

### postinstall

Automates the downloading of all my used packages, dividing the system ones from the rest. Requires `pacman` and `yay`.

Must be run as root, and the variable `user` stores the name of the non-root user (available with `whoami`).

When executed, the program only installs the desired set of packages. For modifying the packages, use the arrays defined at the start of `postinstall.sh`.

