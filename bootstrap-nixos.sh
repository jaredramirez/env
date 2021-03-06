#!/bin/sh

PWD=`pwd`

FLAKE_CONFIG="flake.nix"
HOME_FLAKE_CONFIG="/etc/nixos/$FLAKE_CONFIG"
sudo ln -sf "$PWD/$FLAKE_CONFIG" "$HOME_FLAKE_CONFIG"

# Link Fish
mkdir -p "$HOME/.config/fish"
FISH_FUNCTIONS_INIT="functions"
HOME_FISH_FUNCTIONS="$HOME/.config/fish/$FISH_FUNCTIONS_INIT"
ln -sf "$PWD/fish/$FISH_FUNCTIONS_INIT" $HOME_FISH_FUNCTIONS

# Link Neovim
mkdir -p "$HOME/.config/nvim"
NVIM_INIT="init.vim"
HOME_NVIM="$HOME/.config/nvim/$NVIM_INIT"
ln -sf "$PWD/nvim/$NVIM_INIT" $HOME_NVIM

# Link Starship
STARSHIP_INIT="starship.toml"
HOME_STARSHIP="$HOME/.config/$STARSHIP_INIT"
ln -sf "$PWD/starship/$STARSHIP_INIT" $HOME_STARSHIP

# Link nix-direnv
DIRENV_CONFIG="direnvrc"
HOME_DIRENV_CONFIG="$HOME/.$DIRENV_CONFIG"
ln -sf "$PWD/direnv/$DIRENV_CONFIG" "$HOME_DIRENV_CONFIG"

# Link git
GIT_CONFIG="gitconfig"
HOME_GIT_CONFIG="$HOME/.$GIT_CONFIG"
ln -sf "$PWD/git/$GIT_CONFIG" "$HOME_GIT_CONFIG"

# Link Kitty
mkdir -p "$HOME/.config/kitty"
KITTY_INIT="kitty.conf"
HOME_KITTY="$HOME/.config/kitty/$KITTY_INIT"
ln -sf "$PWD/kitty/$KITTY_INIT" $HOME_KITTY

ln -sFf "$PWD/kitty/workspaces" "$HOME/.config/kitty/workspaces"
rm -f "$PWD/kitty/workspaces/workspaces"

ln -sFf "$PWD/kitty/themes" "$HOME/.config/kitty/themes"
rm -f "$PWD/kitty/themes/themes"

# Link Kakoune
mkdir -p "$HOME/.config/kak"
KAK_INIT="kakrc"
HOME_KAK="$HOME/.config/kak/$KAK_INIT"
ln -sf "$PWD/kak/$KAK_INIT" $HOME_KAK

# Link Kakoune-lsp
mkdir -p "$HOME/.config/kak-lsp"
KAK_LSP="kak-lsp.toml"
HOME_KAK_LSP="$HOME/.config/kak-lsp/$KAK_LSP"
ln -sf "$PWD/kak-lsp/$KAK_LSP" $HOME_KAK_LSP
