# tiny-vim
# 🧠 Minimal Dev Vim Setup

A **pure Vim** configuration using the native `pack/*/start` package system.

Designed for:

* 🚀 Performance
* 🧩 Simplicity
* 🐧 Linux-first environments
* 🖥️ Terminal workflows
* 🔧 Dev / Infra / DevOps usage

No external plugin managers. No bloat.

---

## 📦 Plugins

| Plugin              | Purpose                                |
| ------------------- | -------------------------------------- |
| vim-commentary      | Quick commenting (`gc`)                |
| vim-vinegar         | Improved directory browsing with `-`   |
| vim-gitgutter       | Git diff indicators in the sign column |
| fzf.vim             | Fast file and buffer search            |
| lightline.vim       | Minimal statusline                     |
| dracula             | Color scheme                           |
| vim-tmux-navigator  | Seamless Vim ↔ tmux navigation         |
| vim-highlightedyank | Visual feedback when yanking           |
| copilot.vim         | GitHub Copilot integration             |

Plugins are automatically installed if not present.

---

## 🎯 Key Features

### 🔎 Search

* `<leader>ff` → Find files (FZF)
* `<leader>fb` → List buffers

### 🎛 UI

* Dracula theme
* `termguicolors` enabled
* Minimal statusline (Lightline)
* Transparent background

### 📁 Navigation

* `-` → Explore current directory (Vinegar)
* `<leader>.` → Set working directory to current file

### 💻 Built-in Terminal

* `<leader>sh` → Open terminal below
* `ESC` → Exit terminal mode

### 🧠 Productivity

* `jj` → Exit insert mode
* `<leader><space>` → Toggle:

  * line numbers
  * cursorline
  * cursorcolumn
  * clear search highlight

---

## 🔄 Smart Backup System

Files stored in:

```
~/.vim/tmp
~/.vim/backups
~/.vim/undos
```

* Persistent undo history
* Backups enabled
* Isolated swap files

---

## 🪟 Compatibility

✔ Linux
✔ WSL (with `clip.exe` integration)
✔ macOS
✔ Works great with tmux

---

## 🛠 Requirements

* Vim 8+
* Git installed
* FZF installed (recommended)

Install FZF on Debian/Ubuntu:

```bash
sudo apt install fzf
```

---

## 🧩 Philosophy

This setup intentionally avoids:

* Heavy plugin managers
* Complex dependencies
* Over-engineered configurations

It aims to be:

* Fast
* Predictable
* Portable
* Easy to debug

---

## 🚀 Installation

```bash
git clone <your-repo> ~/.vim-config
cp ~/.vim-config/vimrc ~/.vimrc
```

Open Vim and plugins will install automatically.

---

## 🔥 Customization

Add new plugins manually in:

```
~/.vim/pack/plugins/start/
```

No `PlugInstall` required.

---

## 📌 Leader Key

Leader is set to:

```
,
```

Examples:

```
,ff
,fb
,.
```

---

## 🧑‍💻 Intended For

This configuration is ideal for developers who:

* Live in the terminal
* Work with servers and infrastructure
* Use tmux daily
* Value performance
* Prefer minimalism over frameworks

---

## 🧨 Future Improvements (Optional)

* Native LSP
* Treesitter (Neovim)
* Telescope
* Modular configuration structure

---

Minimal. Fast. Reliable.
