CONFIG="$HOME/.config"

# packages going to $HOME
HOME_PKG=(
    git
)

# packages going to $CONFIG
CONFIG_PKG=(
    kde
)

# packages going to $CONFIG/<package-name>
CONFIG_INDEP_PKG=(
    alacritty
    nvim
)

# given a value and an array, returns if contained
function contains {
  local e match="$1"
  shift
  for e; do [[ "$e" == "$match" ]] && return 0; done
  return 1
}

# given a package, returns its target directory based on the above arrays
# if it does not exist, returns -1
function get_pkg_dir {
    if [ $# -eq 1 ]; then
        if contains $1 "${HOME_PKG[@]}"; then
            target_dir=$HOME
        elif contains $1 "${CONFIG_PKG[@]}"; then
            target_dir=$CONFIG
        elif contains $1 "${CONFIG_INDEP_PKG[@]}"; then
           target_dir="$CONFIG/$1"
        else
            target_dir="ERROR"
        fi
    fi
}

# stows all packages specified on the arrays
function restow {
    for package in ${HOME_PKG[@]}; do
        stow -Rv $package -t $HOME
    done

    for package in ${CONFIG_PKG[@]}; do
        stow -Rv $package -t $CONFIG
    done

    for package in ${CONFIG_INDEP_PKG[@]}; do
        stow -Rv $package -t "$CONFIG/$package"
    done
}

if [ $# -gt 0 ]; then
    unstowing=0
    if [ $1 == -D ]; then
        unstowing=1
        shift
    fi
    while [ $# -gt 0 ]; do
        get_pkg_dir $1
        if [ $target_dir != ERROR ]; then
            if [ $unstowing -eq 1 ]; then
                stow -Dv $1 -t $target_dir
                echo "$1 unstowed from $target_dir"
            else
                stow -Rv $1 -t $target_dir
                echo "$1 stowed at $target_dir"
            fi
        else
            echo "WARNING: Package $1 not found, avoiding"
        fi
        shift
    done
else
    echo "Restowing all packages..."
    restow
fi

