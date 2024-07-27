# Neovim Config

<!-- toc -->

- [Dependencies](#dependencies)
- [Installation](#installation)
- [Feature](#feature)
- [Language Support](#language-support)
  - [Lua](#lua)
  - [Java](#java)
  - [JavaScript/TypeScript](#javascripttypescript)
- [Keymaps](#keymaps)

<!-- tocstop -->

A minimal Catppuccin neovim config built from [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim)

![Preview 1](./Preview_1.jpg)

![Preview 2](./Preview_2.jpg)

## Dependencies

1. Basic utils: git, make, unzip, C Compiler (gcc)
2. ripgrep
3. Clipboard tool (xclip/xsel/win32yank or other depending on platform)
4. A terminal supports 256-color such as [iTerm2](https://iterm2.com/index.html)
5. A [Nerd Font](https://www.nerdfonts.com/#home)
6. [Neovim](https://neovim.io)
7. [Lazygit](https://github.com/jesseduffield/lazygit)
8. Language dependencies (see [Language Support](#language-support))

## Installation

make sure to **backup your current config** before installation

```bash
git clone https://github.com/chenxin-yan/nvim.git "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim
nvim
```

## Feature

- [Neovide](https://github.com/neovide/neovide) support
- Obsidian support

## Language Support

| Language              | Lsp         | Formatter                 | Linter    | Debugger           |
| --------------------- | ----------- | ------------------------- | --------- | ------------------ |
| lua                   | ✅ luals    | ✅ stylua                 | ❌        | ❌                 |
| Java                  | ✅ jdtls    | ✅ jdtls                  | ❌        | ❌                 |
| JavaScript/TypeScript | ✅ vtsls    | ✅ Prettier               | ✅ Eslint | ✅ vscode-js-debug |
| Markdown              | ✅ marksman | ✅ Prettier, markdownlint | ❌        | ❌                 |
| html                  | ✅ html     | ✅ Prettier               | ❌        | ❌                 |
| css                   | ✅ cssls    | ✅ Prettier               | ❌        | ❌                 |
| json                  | ✅ jsonls   | ✅ Prettier               | ❌        | ❌                 |

### Lua

### Java

### JavaScript/TypeScript

## Keymaps

This config uses which-key.nvim to display available keymaps
