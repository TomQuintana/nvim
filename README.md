<h1 align="center">Nvim Config — Milo</h1>

[![Neovim](https://img.shields.io/badge/Neovim-57A143?style=for-the-badge&logo=Neovim&logoColor=white&labelColor=101010)]()
[![Lua](https://img.shields.io/badge/Lua-2C2D72?style=for-the-badge&logo=Lua&logoColor=white&labelColor=101010)]()

## Philosophy

Minimalist Neovim config focused on simplicity and speed. Core principles:

- **Snacks-first** — `folke/snacks.nvim` replaces Telescope as the unified picker for files, grep, LSP navigation, buffers, and explorer
- **External git ops** — [lazygit](https://github.com/jesseduffield/lazygit) via `<leader>lg`, keeps Neovim focused on editing

## Structure

```
lua/milo/
├── core/
│   ├── keymaps.lua       ← global keymaps
│   └── options.lua       ← editor settings
├── plugins/
│   ├── snacks.lua        ← picker, explorer, diagnostics, git branches
│   ├── lsp/              ← lspconfig, mason
│   ├── git-provider/     ← gitsigns, diffview, lazygit, octo, neo-reviewer
│   └── ia/               ← copilot
└── keymaps_map.lua       ← keymap reference table (for helper window)
```

## Plugin Overview

### Foundation
| Plugin | Purpose |
|--------|---------|
| [plenary.nvim](https://github.com/nvim-lua/plenary.nvim) | Lua utilities (dependency) |
| [vim-tmux-navigator](https://github.com/christoomey/vim-tmux-navigator) | `<C-h/j/k/l>` across vim/tmux splits |
| [nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons) | File icons |

### Picker & Navigation
| Plugin | Purpose | Key Mappings |
|--------|---------|--------------|
| [snacks.nvim](https://github.com/folke/snacks.nvim) | Files, grep, LSP nav, explorer, buffers | `<leader>ff` files · `<leader>ts` grep · `<leader>fb` explorer · `gf` references · `gd` definition · `fd` definition |
| [dropbar.nvim](https://github.com/Bekaboo/dropbar.nvim) | Winbar breadcrumbs | `<leader>;` pick symbol · `[;` context start · `];` next context |

### UI
| Plugin | Purpose |
|--------|---------|
| [bufferline.nvim](https://github.com/akinsho/bufferline.nvim) | Buffer tabs (`<leader>m/s` cycle · `<leader>lb` fuzzy pick) |
| [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) | Status bar (evil_lualine theme) |
| [noice.nvim](https://github.com/folke/noice.nvim) | Better cmdline, messages, notifications |
| [indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim) | Indentation guides |
| [tiny-inline-diagnostic.nvim](https://github.com/rachartier/tiny-inline-diagnostic.nvim) | Compact inline diagnostics |
| [markview.nvim](https://github.com/OXY2DEV/markview.nvim) | Live markdown rendering |
| [image.nvim](https://github.com/3rd/image.nvim) | Image rendering in terminal (Kitty backend) |

### Color Schemes (active: gruvbox)
- [gruvbox.nvim](https://github.com/ellisonleao/gruvbox.nvim) — hard contrast, custom markdown highlighting **← active**
- [catppuccin](https://github.com/catppuccin/nvim) — mocha, configured but inactive
- [tokyonight.nvim](https://github.com/folke/tokyonight.nvim) — night style, lazy loaded
- [vscode.nvim](https://github.com/Mofiqul/vscode.nvim) — dark style, lazy loaded

### LSP & Completion
| Plugin | Purpose |
|--------|---------|
| [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) | LSP client — html, cssls, tailwindcss, lua_ls, pyright, ruff, ts_ls |
| [mason.nvim](https://github.com/williamboman/mason.nvim) | LSP/tool installer |
| [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) | Completion engine (LSP, buffer, path sources) |
| [LuaSnip](https://github.com/L3MON4D3/LuaSnip) + friendly-snippets | Snippets |
| [lspkind.nvim](https://github.com/onsails/lspkind.nvim) | VS Code-style completion icons |

### Treesitter
`nvim-treesitter` with parsers: `c lua rust python bash json html css javascript typescript markdown`

### Formatting & Linting
| Plugin | Config |
|--------|--------|
| [conform.nvim](https://github.com/stevearc/conform.nvim) | `prettier` (JS/TS) · `ruff/isort/black` (Python, project-aware) · `<leader>fa` |
| [nvim-lint](https://github.com/mfussenegger/nvim-lint) | Project-specific linters |

### Git
| Plugin | Purpose | Key |
|--------|---------|-----|
| [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) | Hunk signs, inline blame | `<leader>gn/gp` next/prev hunk |
| [diffview.nvim](https://github.com/sindrets/diffview.nvim) | Diff viewer, merge tool | — |
| [lazygit.nvim](https://github.com/kdheepak/lazygit.nvim) | LazyGit inside Neovim | `<leader>lg` |
| [octo.nvim](https://github.com/pwntester/octo.nvim) | GitHub PRs/Issues/Discussions | `<leader>op/oi/od/on` |
| [neo-reviewer](https://github.com/dglsparsons/neo-reviewer) | In-editor PR review with AI | `<leader>rr` review · `<leader>ra` approve |

### AI & Editing
| Plugin | Purpose |
|--------|---------|
| [copilot.vim](https://github.com/github/copilot.vim) | GitHub Copilot |
| [nvim-autopairs](https://github.com/windwp/nvim-autopairs) | Auto-close brackets/quotes |
| [nvim-surround](https://github.com/kylechui/nvim-surround) | Surround text with brackets/tags |
| [todo-comments.nvim](https://github.com/folke/todo-comments.nvim) | `TODO/FIXME/NOTE` highlighting |
| [auto-session](https://github.com/rmagatti/auto-session) | Auto session save/restore |

## Quick Reference

```
<leader>ff   fuzzy find files          <leader>ts   live grep
<leader>fb   file explorer             <leader>tf   symbols in file
gf           LSP references            gd           go to definition
fd           peek definition           K            hover docs
<leader>ca   code actions              <leader>rn   rename
<leader>lg   LazyGit                   <leader>op   GitHub PRs
<leader>hk   keymaps helper window
```

## Installation

All plugins auto-install on first launch via lazy.nvim.

```vim
:Lazy sync    " sync all plugins
:Lazy update  " update all plugins
```

> Extended notes, design decisions, and keymap details → [notes.md](./notes.md)
