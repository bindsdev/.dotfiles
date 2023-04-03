# .dotfiles

This repository contains the configuration files for my development environment.

## Components of my Development Environment

My development environment is mostly powered by Rust-based tools! All of them are modern, easy to configure, intuitive, and enjoyable to use.

- **Operating System**: EndeavourOS with i3 WM (Arch Based)
- **Terminal Emulator**: Alacritty
- **Shell**: Nushell
- **Terminal Multiplexer**: Zellij
- **Terminal Prompt**: Starship
- **Editor**: Helix
- **Window Manager**: i3

## Installation

You can install the basis needed to emulate by development environment, without all the extra tools I use that another might not desire, by running:

```sh
curl -fsSL https://raw.githubusercontent.com/bindsdev/.dotfiles/master/base-install.sh | sh
```

If you want to install all the other things that I use, run:

```sh
http get https://raw.githubusercontent.com/bindsdev/.dotfiles/master/personal-install.nu | nu
```