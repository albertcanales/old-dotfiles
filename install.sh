CONFIG="$HOME/.config"

# files located at $HOME
HOME_PKG=(
    git
    vim
)

# files located at $CONFIG
CONFIG_PKG=(
    kde
)

# files located at $CONFIG/<package-name>
CONFIG_INDEP_PKG=(
    alacritty
    nvim
)


for package in $HOME_PKG; do
    stow -Rv $package -t $HOME
done

for package in $CONFIG_PKG; do
    stow -Rv $package -t $CONFIG
done

for package in $CONFIG_INDEP_PKG; do
    stow -Rv $package -t "$CONFIG/$package"
done


