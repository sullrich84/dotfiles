#!/bin/bash

clear;

function echo_error {
  echo "❌ $1"
}

function echo_info {
  echo "ℹ️ $1"
}

function echo_success {
  echo "✅ $1"
}

function check_installed {
  if ! command -v "$1" &> /dev/null; then
    echo_error "Please install $1 before running this script."
    exit 1
  else
    echo_success "Found $1 in $(command -v "$1")"
  fi
}

echo_info "sullrich84/dotfiles installer..."

# Check dependencies for this script 
check_installed git
check_installed brew

function install_or_upgrade {
  echo_info "Installing or upgrading $1"
  if brew ls --version "$1" >/dev/null; then
    HOMEBREW_NO_AUTO_UPDATE=1 brew upgrade "$1"
  else
    HOMEBREW_NO_AUTO_UPDATE=1 brew install "$1"
  fi
}

# Install bundle
install_or_upgrade nvim
install_or_upgrade btop
install_or_upgrade fzf
install_or_upgrade mc
install_or_upgrade taskfile
install_or_upgrade lazygit
install_or_upgrade go-task
install_or_upgrade entr
install_or_upgrade exa
install_or_upgrade zoxide