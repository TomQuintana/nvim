# Nvim Config — Extended Notes

> Quick overview → [README.md](./README.md)

---

## Architecture Decisions

### Snacks replaces Telescope
`folke/snacks.nvim` is the central picker for everything: files, grep, LSP, buffers, git branches, explorer, diagnostics. Telescope is no longer installed except as a dependency of `octo.nvim`.

**Why:** Snacks has native LSP integration, loads faster, and is simpler to configure. The unified layout is consistent across the entire UI.

**Affected files:**
- `lua/milo/plugins/snacks.lua` — picker config, layout, keys
- `lua/milo/core/keymaps.lua` — LSP keymaps use `Snacks.picker.*`

### `Snacks` as a global
When `require("snacks").setup(opts)` runs, the plugin automatically registers `_G.Snacks`. Since snacks has `lazy = false, priority = 1000`, it is always available before any key is pressed. Keymaps in `keymaps.lua` use anonymous functions to defer evaluation.

### Load order in init.lua
```lua
require("milo.core.options")   -- first, no dependencies
require("milo.core.keymaps")   -- second, registers keymaps (Snacks not evaluated yet)
require("milo.lazy")           -- third, loads plugins (Snacks, etc.)
```

**Implication:** keymaps that use `Snacks.*` directly (without an anonymous function) would fail. All must be wrapped in `function() ... end`. Keymaps that depend on a plugin should go in that plugin's `keys` spec, not in `keymaps.lua`.

---

## Keymap Design

### LSP Navigation
| Key | Action | File |
|-----|--------|------|
| `gf` | `Snacks.picker.lsp_references()` | `snacks.lua` (keys spec) |
| `gd` | `Snacks.picker.lsp_definitions()` | `keymaps.lua` |
| `fd` | `Snacks.picker.lsp_definitions()` | `keymaps.lua` |
| `K` | `vim.lsp.buf.hover` | `keymaps.lua` |
| `<leader>ca` | `vim.lsp.buf.code_action` | `keymaps.lua` |
| `<leader>rn` | `vim.lsp.buf.rename` | `keymaps.lua` |
| `<leader>lo` | `vim.lsp.buf.outgoing_calls` | `lspconfig.lua` (LspAttach) |

**Note on `gf`:** Snacks has its own default for `gf` → `lsp_definitions`. For `gf` → `lsp_references` to work, the keymap must be in the `keys` block of `snacks.lua`, not in `keymaps.lua`. If placed in `keymaps.lua`, Snacks overwrites it on load.

### LSP Diagnostics
| Key | Action |
|-----|--------|
| `[d` / `]d` | jump to previous/next diagnostic (with float) |
| `<leader>d` | open diagnostic float at cursor |
| `<leader>be` | workspace diagnostics (picker) |
| `<leader>le` | current buffer diagnostics (picker) |

### Buffer & Tab Navigation
| Key | Action |
|-----|--------|
| `<leader>m` / `<leader>s` | previous / next buffer |
| `<leader>lb` | fuzzy find buffers (Snacks) |
| `<leader>bc` | close all buffers except current |
| `<leader>bf` | pick buffer to close |
| `<Tab>` / `<S-Tab>` | next / previous Neovim tab |
| `<leader>tn` / `<leader>tx` | new tab / close tab |

### Picker (Snacks)
| Key | Action |
|-----|--------|
| `<leader>ff` | fuzzy find files (includes hidden/ignored, excludes .venv etc.) |
| `<leader>fb` | file explorer |
| `<leader>fp` | explorer from current file path |
| `<leader>fe` | find .env files |
| `<leader>ts` | live grep in project |
| `<leader>fc` | grep word under cursor |
| `<leader>tf` | LSP symbols in current file |
| `<leader>gb` | git branches with actions |
| `<leader>td` | find all TODOs |
| `<leader>tt` | treesitter symbols |

**Keys inside the picker:**
- `<C-j>` / `<C-k>` — move through the list
- `<C-d>` — delete buffer from buffer picker

### Git
| Key | Action | Plugin |
|-----|--------|--------|
| `<leader>lg` | LazyGit | lazygit.nvim |
| `<leader>gn` / `<leader>gp` | next/previous hunk | gitsigns |
| `<leader>op` | list GitHub PRs | octo.nvim |
| `<leader>oi` | list GitHub issues | octo.nvim |
| `<leader>od` | list GitHub discussions | octo.nvim |
| `<leader>on` | GitHub notifications | octo.nvim |
| `<leader>rr` | review current PR | neo-reviewer |
| `<leader>ra` / `<leader>rx` | approve / request changes | neo-reviewer |
| `<leader>rc` | add review comment | neo-reviewer |
| `]r` / `[r` | next/previous change in review | neo-reviewer |

### Dropbar (breadcrumbs)
| Key | Action |
|-----|--------|
| `<leader>;` | pick symbol in winbar |
| `[;` | go to start of current context |
| `];` | select next context |

### Daily Notes
`<leader>nd` — opens a floating right panel (40% width) with the Obsidian daily notes file.

---

## LSP Servers

Configured in `lua/milo/plugins/lsp/lspconfig.lua`:

| Server | Languages | Notes |
|--------|-----------|-------|
| `html` | HTML | — |
| `cssls` | CSS | — |
| `tailwindcss` | Tailwind | — |
| `lua_ls` | Lua | `vim` global declared |
| `pyright` | Python | `openFilesOnly`, `typeCheckingMode = basic` |
| `ruff` | Python | format only (lint disabled, handled by nvim-lint) |
| `ts_ls` | TypeScript/JS | inlay hints enabled, `single_file_support = false` |

Mason auto-installs: `html, cssls, tailwindcss, lua_ls, basedpyright, ruff, prettier, stylua`

---

## Formatting

`lua/milo/plugins/formatting.lua` (conform.nvim):

- **JS/TS:** `prettier` always
- **Python:** conditional formatters based on config files present in the project:
  - `ruff.toml` or `pyproject.toml` → `ruff_format`
  - `.isort.cfg` or `pyproject.toml` → `isort`
  - `pyproject.toml` → `black`
- **Auto-format on save:** only for files inside `tom-workspace/*`
- **Manual:** `<leader>fa`

---

## Markdown

Two plugins work together:
- **markview.nvim** — renders markdown with colors, headings, lists, tables (hybrid mode: preview in normal, edit in insert)
- **image.nvim** — renders images in the terminal (Kitty backend). Resolves image paths relative to the Obsidian vault at `~/workspace/tom-notes-obsidian`

Markdown colors (headings, links, code) are defined in `lua/milo/plugins/colorschema.lua` as gruvbox overrides, using the **Tokyo Night night** palette.

---

## Color Scheme

**Active: gruvbox** (`contrast = "hard"`)

Notable overrides:
- Keywords in retro purple (`#B16286`)
- Markdown headings H1-H6 with Tokyo Night palette (blue, lilac, orange, cyan, green, teal)
- Inline code: green on dark background

To switch theme:
```lua
-- In colorschema.lua, uncomment:
vim.cmd("colorscheme catppuccin")  -- or tokyonight, vscode
-- And comment out:
vim.cmd("colorscheme gruvbox")
```

---

## PR Review Workflow

1. `<leader>lg` → LazyGit for context, stash, branch management
2. `<leader>op` → Octo to browse GitHub PRs with full context
3. `<leader>rr` → neo-reviewer for inline review with AI feedback
4. Merge conflicts → diffview.nvim (`:DiffviewOpen`)

---

## Sessions

`auto-session` saves and restores sessions automatically per working directory. No manual configuration required.

---

## Removed Plugins

| Plugin | Replaced by |
|--------|-------------|
| telescope.nvim (as main picker) | snacks.nvim |
| lspsaga.nvim | vim built-ins + Snacks picker |
| lualine custom theme | built-in `evil_lualine` theme |
