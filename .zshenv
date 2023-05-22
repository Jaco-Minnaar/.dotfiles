export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:=$HOME/.config}"
export ZDOTDIR="${ZDOTDIR:=$XDG_CONFIG_HOME/zsh}"
source "$ZDOTDIR/.zshenv"

if [ -e /home/jaco/.nix-profile/etc/profile.d/nix.sh ]; then . /home/jaco/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
