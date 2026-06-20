# Nvim Config — Extended Notes

> Quick overview → [README.md](./README.md)

---

## Architecture Decisions

### Snacks replaces Telescope
`folke/snacks.nvim` es el picker central para todo: archivos, grep, LSP, buffers, ramas git, explorer, diagnostics. Telescope ya no está instalado excepto como dependencia de `octo.nvim`.

**Por qué:** Snacks tiene integración nativa con LSP, carga más rápido y la configuración es más simple. El layout unificado es consistente en toda la UI.

**Archivos afectados:**
- `lua/milo/plugins/snacks.lua` — configuración del picker, layout, keys
- `lua/milo/core/keymaps.lua` — keymaps LSP usan `Snacks.picker.*`

### `Snacks` como global
Cuando `require("snacks").setup(opts)` corre, el plugin registra `_G.Snacks` automáticamente. Como snacks tiene `lazy = false, priority = 1000`, siempre está disponible antes de que cualquier tecla sea presionada. Los keymaps en `keymaps.lua` usan funciones anónimas para diferir la evaluación.

### Orden de carga en init.lua
```lua
require("milo.core.options")   -- primero, sin dependencias
require("milo.core.keymaps")   -- segundo, registra keymaps (Snacks no evaluado todavía)
require("milo.lazy")           -- tercero, carga plugins (Snacks, etc.)
```

**Implicación:** keymaps que usan `Snacks.*` directamente (sin función anónima) fallarían. Todos deben estar envueltos en `function() ... end`. Los keymaps que dependen de plugins deben ir en el bloque `keys` del plugin spec, no en `keymaps.lua`.

---

## Keymap Design

### LSP Navigation
| Key | Action | Archivo |
|-----|--------|---------|
| `gf` | `Snacks.picker.lsp_references()` | `snacks.lua` (keys spec) |
| `gd` | `Snacks.picker.lsp_definitions()` | `keymaps.lua` |
| `fd` | `Snacks.picker.lsp_definitions()` | `keymaps.lua` |
| `K` | `vim.lsp.buf.hover` | `keymaps.lua` |
| `<leader>ca` | `vim.lsp.buf.code_action` | `keymaps.lua` |
| `<leader>rn` | `vim.lsp.buf.rename` | `keymaps.lua` |
| `<leader>lo` | `vim.lsp.buf.outgoing_calls` | `lspconfig.lua` (LspAttach) |

**Nota sobre `gf`:** Snacks tiene un default propio para `gf` → `lsp_definitions`. Para que `gf` → `lsp_references` funcione, el keymap debe estar en el bloque `keys` de `snacks.lua`, no en `keymaps.lua`. Si está en `keymaps.lua`, Snacks lo sobreescribe al cargar.

### LSP Diagnostics
| Key | Action |
|-----|--------|
| `[d` / `]d` | saltar al diagnóstico anterior/siguiente (con float) |
| `<leader>d` | abrir float de diagnóstico en cursor |
| `<leader>be` | diagnósticos del workspace (picker) |
| `<leader>le` | diagnósticos del buffer actual (picker) |

### Buffer & Tab Navigation
| Key | Action |
|-----|--------|
| `<leader>m` / `<leader>s` | buffer anterior / siguiente |
| `<leader>lb` | fuzzy find buffers (Snacks) |
| `<leader>bc` | cerrar todos los buffers excepto el actual |
| `<leader>bf` | pick buffer para cerrar |
| `<Tab>` / `<S-Tab>` | siguiente / anterior tab de Neovim |
| `<leader>tn` / `<leader>tx` | nuevo tab / cerrar tab |

### Picker (Snacks)
| Key | Action |
|-----|--------|
| `<leader>ff` | fuzzy find archivos (incluye hidden/ignored, excluye .venv etc.) |
| `<leader>fb` | file explorer |
| `<leader>fp` | explorer desde el path del archivo actual |
| `<leader>fe` | buscar archivos .env |
| `<leader>ts` | live grep en el proyecto |
| `<leader>fc` | grep de la palabra bajo el cursor |
| `<leader>tf` | symbols LSP en el archivo actual |
| `<leader>gb` | ramas git con acciones |
| `<leader>td` | buscar todos los TODOs |
| `<leader>tt` | symbols de treesitter |

**Keys dentro del picker:**
- `<C-j>` / `<C-k>` — moverse por la lista
- `<C-d>` — cerrar buffer desde el picker de buffers

### Git
| Key | Action | Plugin |
|-----|--------|--------|
| `<leader>lg` | LazyGit | lazygit.nvim |
| `<leader>gn` / `<leader>gp` | siguiente/anterior hunk | gitsigns |
| `<leader>op` | listar PRs de GitHub | octo.nvim |
| `<leader>oi` | listar issues de GitHub | octo.nvim |
| `<leader>od` | listar discussions | octo.nvim |
| `<leader>on` | notificaciones de GitHub | octo.nvim |
| `<leader>rr` | review PR actual | neo-reviewer |
| `<leader>ra` / `<leader>rx` | aprobar / request changes | neo-reviewer |
| `<leader>rc` | agregar comentario en review | neo-reviewer |
| `]r` / `[r` | siguiente/anterior cambio en review | neo-reviewer |

### Dropbar (breadcrumbs)
| Key | Action |
|-----|--------|
| `<leader>;` | pick symbol en la winbar |
| `[;` | ir al inicio del contexto actual |
| `];` | seleccionar próximo contexto |

### Notas Diarias
`<leader>nd` — abre un panel flotante derecho (40% del ancho) con el archivo de notas diarias de Obsidian.

---

## LSP Servers

Configurados en `lua/milo/plugins/lsp/lspconfig.lua`:

| Server | Lenguajes | Notas |
|--------|-----------|-------|
| `html` | HTML | — |
| `cssls` | CSS | — |
| `tailwindcss` | Tailwind | — |
| `lua_ls` | Lua | globals `vim` declarado |
| `pyright` | Python | `openFilesOnly`, `typeCheckingMode = basic` |
| `ruff` | Python | solo formato (lint desactivado, lo maneja nvim-lint) |
| `ts_ls` | TypeScript/JS | inlay hints activados, `single_file_support = false` |

Mason instala automáticamente: `html, cssls, tailwindcss, lua_ls, basedpyright, ruff, prettier, stylua`

---

## Formatting

`lua/milo/plugins/formatting.lua` (conform.nvim):

- **JS/TS:** `prettier` siempre
- **Python:** formateadores condicionales según archivos de config presentes en el proyecto:
  - `ruff.toml` o `pyproject.toml` → `ruff_format`
  - `.isort.cfg` o `pyproject.toml` → `isort`
  - `pyproject.toml` → `black`
- **Auto-format on save:** solo para archivos dentro de `tom-workspace/*`
- **Manual:** `<leader>fa`

---

## Markdown

Dos plugins trabajan juntos:
- **markview.nvim** — renderiza markdown con colores, headings, listas, tablas (modo hybrid: preview en normal, edición en insert)
- **image.nvim** — renderiza imágenes en la terminal (backend Kitty). Resuelve paths de imágenes relativas al vault de Obsidian en `~/workspace/tom-notes-obsidian`

Los colores de markdown (headings, links, code) están definidos en `lua/milo/plugins/colorschema.lua` como overrides de gruvbox, usando la paleta de **Tokyo Night night**.

---

## Color Scheme

**Activo: gruvbox** (`contrast = "hard"`)

Overrides notables:
- Keywords en púrpura retro (`#B16286`)
- Headings markdown H1-H6 con paleta Tokyo Night (azul, lila, naranja, cyan, verde, teal)
- Inline code: verde sobre fondo oscuro

Para cambiar de tema:
```lua
-- En colorschema.lua, descomentar la línea:
vim.cmd("colorscheme catppuccin")  -- o tokyonight, vscode
-- Y comentar:
vim.cmd("colorscheme gruvbox")
```

---

## PR Review Workflow

1. `<leader>lg` → LazyGit para context, stash, branch management
2. `<leader>op` → Octo para ver PRs de GitHub con contexto completo
3. `<leader>rr` → neo-reviewer para review inline con AI feedback
4. Conflictos de merge → diffview.nvim (`:DiffviewOpen`)

---

## Sessions

`auto-session` guarda y restaura sesiones automáticamente por directorio de trabajo. Sin configuración manual requerida.

---

## Plugins Removidos

| Plugin | Reemplazado por |
|--------|----------------|
| telescope.nvim (como picker principal) | snacks.nvim |
| lspsaga.nvim | vim built-ins + Snacks picker |
| lualine custom theme | `evil_lualine` theme integrado |
