# 🐧 My CachyOS Dotfiles

A collection of configuration files for my Linux setup, focused on performance, aesthetics, and productivity. Built on **CachyOS (KDE Plasma)**, using **Ghostty** as the terminal, **Zsh** (recently migrated from Bash for speed) as the shell, and **LazyVim** for editing.

## 🎨 Overview

* **OS:** CachyOS (Arch-based)
* **DE:** KDE Plasma 6 (Wayland)
* **Terminal:** [Ghostty](https://mitchellh.com/ghostty) (Fast, native, GPU-accelerated)
* **Shell:** Zsh + Native Plugins (Replaced Ble.sh for better latency) + Starship
* **Editor:** Neovim (LazyVim distribution)
* **File Manager:** Yazi (Terminal-based with image previews)
* **Multiplexer:** Tmux

---

## 📂 Structure

This repository is organized for use with [GNU Stow](https://www.gnu.org/software/stow/). Each top-level directory represents a package that can be symlinked to your home directory.

```text
.
├── ghostty/        # Ghostty config (Catppuccin theme, ligatures)
├── keyboard/       # KDE Global Shortcuts (ks.kksrc)
├── nvim/           # LazyVim configuration
├── starship/       # Starship prompt setup
├── tmux/           # Tmux configuration
├── XCompose/       # Custom key sequences (e.g. for typing pipes)
├── yazi/           # Yazi config, keymaps, and themes
└── zsh/            # .zshrc + local plugins (syntax highlighting & autosuggestions)

```

---

## 🛠️ Requirements

Before applying the configurations, ensure the necessary dependencies are installed.

### 1. Core System & Terminal Tools

```bash
sudo pacman -S --needed git stow neovim starship fzf zoxide bat eza ripgrep fd wl-clipboard

```

### 2. Z Shell (Replaces Bash)

We switched to Zsh for native performance with syntax highlighting and autosuggestions (Bash + Ble.sh was too heavy).

```bash
# Install Zsh
sudo pacman -S zsh

# Set Zsh as default shell (requires logout/login)
chsh -s $(which zsh)

```

### 3. Ghostty Terminal

```bash
sudo pacman -S ghostty
# Or from AUR if not in your repo:
# paru -S ghostty-git

```

### 4. Input Method (Fix for Ghostty Compose Key)

Ghostty (GTK4) requires an Input Method to read `.XCompose` sequences on Wayland.

```bash
# fcitx5-gtk is critical for Ghostty
sudo pacman -S fcitx5 fcitx5-gtk fcitx5-qt fcitx5-configtool

```

### 5. Yazi & Image Preview Support

```bash
sudo pacman -S yazi ffmpeg p7zip jq poppler imagemagick

```

### 6. Fonts

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

### 2. Setup Zsh Plugins

This config uses local plugins to avoid bloating the Git repo. Run this **once** to download the necessary Zsh plugins:

```bash
mkdir -p zsh/.zsh/plugins
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git zsh/.zsh/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions.git zsh/.zsh/plugins/zsh-autosuggestions

```

### 3. Apply Configs with Stow

Use `stow` to create symlinks from this folder to your `~/.config` or home directory.

**Warning:** If you already have default config files (like a `.bashrc` or `.zshrc`), delete or rename them first to avoid conflicts.

```bash
# Backup existing shells
mv ~/.bashrc ~/.bashrc.bak 2>/dev/null
mv ~/.zshrc ~/.zshrc.bak 2>/dev/null

# Stow the packages
stow zsh
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

### 🐚 Zsh (`.zshrc`)

My Zsh configuration is optimized for **latency and instant feedback**. It replaces the "clunky" Bash+Ble.sh setup with native Zsh modules:

* **Instant Syntax Highlighting:** Commands colorize as you type, but without the script overhead of Ble.sh.
* **Async Autosuggestions:** Greyed-out suggestions appear instantly without freezing the cursor.
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
* **⚠️ Ghostty Note:** Ghostty is a GTK4 app and does not read `.XCompose` natively on Wayland. You **must** have `fcitx5` installed and configured (see Requirements) for these shortcuts to work inside the terminal.


* **Yazi Hidden Files:** Press `.` to toggle hidden files.
* **Tmux Navigation:** Uses `Ctrl+h/j/k/l` to move between panes (if configured in `nvim/tmux-navigator.lua`).
