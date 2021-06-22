A simple repository for managing my dotfiles, using GNU Stow.

## autostow.sh

Basic script for automating the stowing process. When a package is added to the dotfiles directory,
it should be also added to the corresponding array in `autostow.sh`. The script can be used in the
following ways:

- **No arguments**: Stows all packages specified in the arrays.

- **Package names as arguments**: Stows only the given packages.

- **`-D` followed by package names**: Unstows the given packages.

I also use the following aliases to automate the process:

`
alias autostow="(cd ~/dotfiles; ~/dotfiles/autostow.sh)"
alias stowedit="vim ~/dotfiles/autostow.sh; autostow"
`
