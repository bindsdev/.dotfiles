#!/bin/bash
# Instal the basic things needed for my development environment.

cd ~

info () {
  printf "\r  [ \033[00;34mINFO\033[0m ] $1\n"
}

success () {
  printf "\r\033[2K  [ \033[00;32mOK\033[0m ] $1\n"
}

fail () {
  printf "\r\033[2K  [\033[0;31mFAIL\033[0m] $1\n"
  echo ''
  exit
}

# Enter a root environment
sudo su 

# Update `pacman` and `yay` repositories
pacman -Syy
yay -Syu

install_dep_pacman() {
  info "Installing $1"
  pacman -S $1 >/dev/null && success "Installed $1" || fail "Could not install $1"
}

install_rust_bin() {
  info "Installing $1"
  cargo install --locked $1 && success "Installed $1" || fail "Could not install $1"
}

echo "Installing base dependencies"

install_dep_pacman "nushell"
install_dep_pacman "ttc-iosevka"
install_dep_pacman "helix"
install_dep_pacman "alacritty"
install_dep_pacman "rust-analyzer"

chsh -s $(which nu)

info "Installing Rust"
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh && success "Installed Rust" || fail "Could not install Rust"

install_rust_bin "zellij"

info "Installing Starship"
curl -sS https://starship.rs/install.sh | sh && success "Installed Starship" || fail "Could not install Starship"

info "Cloning bare dotfiles repository"
git clone --bare https://github.com/bindsdev/.dotfiles.git $HOME/.dotfiles && success "Cloned bare dotfiles repository" || fail "Could not clone bare dotfiles repository"

dotfiles () {
  git --git-dir=$HOME/.dotfiles --work-tree=$HOME $1
}

dotfiles pull origin master && success "Fetched dotfiles" || fail "Could not fetch dotfiles"