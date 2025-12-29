# 🐧 My CachyOS Dotfiles

A collection of configuration files for my Linux setup, focused on performance, aesthetics, and productivity. Built on **CachyOS (KDE Plasma)**, using **Ghostty** as the terminal, **Bash** with modern upgrades, and **LazyVim** for editing.

## 🎨 Overview

* **OS:** CachyOS (Arch-based)
* **DE:** KDE Plasma 6 (Wayland)
* **Terminal:** [Ghostty](https://mitchellh.com/ghostty) (Fast, native, GPU-accelerated)
* **Shell:** Bash + `ble.sh` (Syntax highlighting & autosuggestions) + Starship
* **Editor:** Neovim (LazyVim distribution)
* **File Manager:** Yazi (Terminal-based with image previews)
* **Multiplexer:** Tmux

---

## 📂 Structure

This repository is organized for use with [GNU Stow](https://www.gnu.org/software/stow/). Each top-level directory represents a package that can be symlinked to your home directory.

```text
.
├── bash/           # .bashrc (Optimized with ble.sh, fzf, zoxide)
├── ghostty/        # Ghostty config (Catppuccin theme, ligatures)
├── keyboard/       # KDE Global Shortcuts (ks.kksrc)
├── nvim/           # LazyVim configuration
├── starship/       # Starship prompt setup
├── tmux/           # Tmux configuration
├── XCompose/       # Custom key sequences (e.g. for typing pipes)
└── yazi/           # Yazi config, keymaps, and themes

```

---

## 🛠️ Requirements

Before applying the configurations, ensure the necessary dependencies are installed.

### 1. Core System & Terminal Tools

```bash
sudo pacman -S --needed git stow neovim starship fzf zoxide bat eza ripgrep fd wl-clipboard

```

### 2. Shell Enhancements (Ble.sh)

The Bash setup relies on `ble.sh` for syntax highlighting and autosuggestions (similar to Zsh).

```bash
# Using an AUR helper like paru or yay
paru -S blesh-git

```

### 3. Ghostty Terminal

```bash
sudo pacman -S ghostty
# Or from AUR if not in your repo:
# paru -S ghostty-git

```

### 4. Yazi & Image Preview Support

```bash
sudo pacman -S yazi ffmpeg p7zip jq poppler imagemagick

```

### 5. Fonts

These configs rely on **Nerd Fonts** for icons.

```bash
sudo pacman -S ttf-jetbrains-mono-nerd noto-fonts-emoji

```

---

## 🚀 Installation

### 1. Clone the Repository

Clone this repo into a `dotfiles` folder in your home directory:

```bash
git clone https://github.com/YOUR_USERNAME/dotfiles.git ~/dotfiles
cd ~/dotfiles

```

### 2. Apply Configs with Stow

Use `stow` to create symlinks from this folder to your `~/.config` or home directory.

**Warning:** If you already have default config files (like a `.bashrc`), delete or rename them first to avoid conflicts.

```bash
# Backup existing bashrc
mv ~/.bashrc ~/.bashrc.bak

# Stow the packages
stow bash
stow ghostty
stow nvim
stow starship
stow tmux
stow XCompose
stow yazi

# For KDE shortcuts (Optional - might need manual import in System Settings)
stow keyboard

```

---

## ✨ Configuration Highlights

### 🐚 Bash (`.bashrc`)

My Bash configuration is optimized for speed and interactivity. It features:

* **Early Exit:** Prevents loading heavy plugins during non-interactive sessions (scripts/scp).
* **Ble.sh:** Provides Zsh-like syntax highlighting and autosuggestions.
* **FZF Integration:** Fuzzy search for command history (`Ctrl+R`).
* **Zoxide:** Smarter directory navigation (replaces `cd` with `z`).
* **Starship:** A minimal, blazing fast prompt showing Git status, package versions, and more.

### 👻 Ghostty

* **Theme:** Catppuccin Mocha.
* **Font:** JetBrains Mono Nerd Font with ligatures enabled (`!=` becomes `≠`).
* **Features:** Window state saving, native Wayland support, and blur effects.

### 📝 Neovim (LazyVim)

* **Base:** [LazyVim](https://www.lazyvim.org/) default structure.
* **Plugins:** Treesitter, Telescope, WhichKey, and custom Tmux navigation.
* **Clipboard:** Synced with system clipboard via `wl-clipboard`.

### 📂 Yazi

* **Image Previews:** Enabled via Ghostty's native protocol.
* **Keymaps:** Vim-like navigation (`h/j/k/l`).

---

## ⌨️ Custom Shortcuts & Tricks

* **Typing a Pipe `|**`: If you have issues typing pipes on certain layouts, check the `.XCompose` file.
* *Shortcut:* `Compose Key` + `p` + `p` (Defined in `XCompose/.XCompose`).


* **Yazi Hidden Files:** Press `.` to toggle hidden files.
* **Tmux Navigation:** Uses `Ctrl+h/j/k/l` to move between panes (if configured in `nvim/tmux-navigator.lua`).
