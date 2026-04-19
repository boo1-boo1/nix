# Nix Configuration

My personal nix-darwin/NixOS/Home Manager configuration and development environment templates.

## 💻 nix-darwin

Manages my macOS configuration including:

- [Homebrew](https://brew.sh/) casks
- Apps from the App Store using [`mas`](https://github.com/mas-cli/mas)
- [Aerospace](https://nikitabobko.github.io/AeroSpace/guide): The tiling window manager for macOS
- [a-bar](https://www.jeantinland.com/toolbox/a-bar/): macOS menu bar replacement with support for Aerospace

## NixOS

- A bare minimum NixOS setup for work
- Uses the KDE Plasma Desktop environment

## 🏠 Home Configuration

Managed via Home Manager. Core settings are in `home/core.nix`, with specialized configs for:

- Zsh ([`zshell.nix`](./home/zshell.nix)) + [Starship](https://starship.rs/)
- [Kitty](https://sw.kovidgoyal.net/kitty/) ([`kitty.nix`](./home/kitty.nix))
- [Tmux](https://github.com/tmux/tmux/wiki) ([`tmux.nix`](./home/tmux.nix))
- [Neovim](https://neovim.io/) ([`neovim.nix](./home/neovim.nix))
  - Uses the [Lazyvim](https://github.com/LazyVim/LazyVim) distro
  - Powered by the bleeding-edge [lazyvim-nix](https://github.com/pfassina/lazyvim-nix) flake

## 🛠️ Dev Templates

Reusable environment templates for different languages located in `templates/`:

- **Python**: Python 3 + uv
- **Rust**: cargo
- **NodeJS**: bun

## 🚀 Quick Start

To use a dev template:

1. Navigate to your project.
2. Initialize the template with `nix flake init -t github:boo1-boo1/nix#python` (replace with the language you want).
3. Use `nix develop`.
