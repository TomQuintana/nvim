<h1 align="center">Nvim Text Editor</h1>

[![Neovim](https://img.shields.io/badge/Neovim-57A143?style=for-the-badge&logo=Neovim&logoColor=white&labelColor=101010)]()
[![Lua](https://img.shields.io/badge/Lua-2C2D72?style=for-the-badge&logo=Lua&logoColor=white&labelColor=101010)]()

## Philosophy

This is a **minimalist Neovim configuration** focused on simplicity and efficiency. The setup follows these principles:

- **Minimal plugin footprint** - Only essential plugins for a productive workflow
- **External tool integration** - Uses [lazygit](https://github.com/jesseduffield/lazygit) outside of Neovim for git operations
- **Tmux-first workflow** - Designed to work seamlessly with tmux for terminal multiplexing
- **Clean separation** - Git operations handled externally, keeping Neovim focused on editing

### Workflow

- **Neovim** - Text editing and code navigation
- **Lazygit** - Git operations in a separate tmux pane/window
- **Tmux** - Session and window management

## Project Structure
``` bash
|-- lua/
|   |-- milo/ 
|       |-- core/
|           |-- colorschema.lua
|           |-- keymaps.lua
|           |-- options.lua
|       |-- plugs/
|           |-- lsp/
|           |-- code-options/
|           |-- editor-options/
|           |-- git-provider/
|           |-- other-plugs.lua
|       |--plugin-setup.lua 
|-- plugin/
|-- init.lua

```

<h2 align='center'>Configuration Overview</h2>

### Quick Start

**init.lua** - Entry point that loads all configuration modules

**lua/milo/** - Main configuration directory organized into:

### Core Settings (`core/`)

- **colorschema.lua** - Color scheme and theme settings
- **keymaps.lua** - Custom keyboard shortcuts
- **options.lua** - Editor behavior (line numbers, indentation, etc.)

### Plugins (`plugs/`)

Organized by category:
- **lsp/** - Language server configurations
- **code-options/** - Code editing enhancements
- **editor-options/** - Editor UI improvements
- **git-provider/** - Git integration (minimal, since lazygit is used externally)
- **other-plugs.lua** - Miscellaneous utilities

### Plugin Management

**plugin-setup.lua** - Defines and imports all plugins using your package manager

The config is structured to be modular and easy to customize - each file has a single responsibility.

## Plugins

This configuration uses [lazy.nvim](https://github.com/folke/lazy.nvim) as the plugin manager. All plugins are organized by category for easy maintenance.

### Core Dependencies

- **plenary.nvim** - Lua utility functions (required by many plugins)
- **nvim-web-devicons** - File icons for UI components

### Editor UI

| Plugin | Purpose | Key Features |
|--------|---------|--------------|
| [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) | Status line | Custom theme, mode indicator, git branch, diff stats |
| [bufferline.nvim](https://github.com/akinsho/bufferline.nvim) | Buffer/tab line | Visual buffer management |
| [indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim) | Indentation guides | Visual indentation markers |
| [noice.nvim](https://github.com/folke/noice.nvim) | UI enhancement | Better command line and notifications |
| [rainbow-delimiters](https://github.com/HiPhish/rainbow-delimiters.nvim) | Bracket highlighting | Color-coded matching brackets |

### Color Schemes

- [tokyonight.nvim](https://github.com/folke/tokyonight.nvim)
- [vscode.nvim](https://github.com/Mofiqul/vscode.nvim) - Active theme
- [sequoia.nvim](https://github.com/forest-nvim/sequoia.nvim)
- [dracula.nvim](https://github.com/Mofiqul/dracula.nvim)

### Fuzzy Finding & Navigation

| Plugin | Purpose | Key Mappings |
|--------|---------|--------------|
| [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) | Fuzzy finder | `<leader>ff` - Find files<br>`<leader>ts` - Live grep<br>`<leader>lb` - List buffers<br>`<leader>td` - Find todos |
| [telescope-fzf-native](https://github.com/nvim-telescope/telescope-fzf-native.nvim) | FZF algorithm | Faster fuzzy finding |
| [telescope-file-browser](https://github.com/nvim-telescope/telescope-file-browser.nvim) | File browser | `fb` - Browse files<br>`fp` - Browse from current file path |
| [telescope-ui-select](https://github.com/nvim-telescope/telescope-ui-select.nvim) | UI select | Better code action UI |

### LSP & Completion

| Plugin | Purpose | Configuration |
|--------|---------|---------------|
| [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) | LSP client | html, cssls, tailwindcss, pyright, lua_ls, ruff |
| [mason.nvim](https://github.com/williamboman/mason.nvim) | LSP installer | Auto-installs language servers |
| [mason-lspconfig](https://github.com/williamboman/mason-lspconfig.nvim) | Mason-LSP bridge | Integrates Mason with LSP config |
| [lspsaga.nvim](https://github.com/nvimdev/lspsaga.nvim) | LSP UI | Enhanced code actions, hover docs, rename |
| [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) | Completion engine | Autocompletion with multiple sources |
| [cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp) | LSP completion source | LSP-based completions |
| [cmp-buffer](https://github.com/hrsh7th/cmp-buffer) | Buffer completion | Words from current buffer |
| [cmp-path](https://github.com/hrsh7th/cmp-path) | Path completion | File system paths |
| [LuaSnip](https://github.com/L3MON4D3/LuaSnip) | Snippet engine | Snippet expansion |
| [friendly-snippets](https://github.com/rafamadriz/friendly-snippets) | Snippet collection | Pre-configured snippets |
| [lspkind.nvim](https://github.com/onsails/lspkind.nvim) | Completion icons | VS Code-like pictograms |

### Syntax & Highlighting

| Plugin | Purpose |
|--------|---------|
| [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) | Advanced syntax highlighting and parsing |

**Installed parsers:** c, lua, rust, python, bash, json, html, css, javascript, typescript

### Code Formatting & Linting

| Plugin | Purpose | Key Features |
|--------|---------|--------------|
| [conform.nvim](https://github.com/stevearc/conform.nvim) | Formatter | prettier (JS/TS), ruff/isort/black (Python)<br>`<leader>fa` - Format file |
| [nvim-lint](https://github.com/mfussenegger/nvim-lint) | Linting | Project-specific linter configuration |

### Git Integration

| Plugin | Purpose | Key Mappings |
|--------|---------|--------------|
| [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) | Git decorations | `<leader>gn` - Next hunk<br>`<leader>gp` - Previous hunk<br>Inline blame and diff views |
| [diffview.nvim](https://github.com/sindrets/diffview.nvim) | Git diff viewer | Advanced diff and merge tool |

### AI Assistants

| Plugin | Purpose |
|--------|---------|
| [copilot.vim](https://github.com/github/copilot.vim) | GitHub Copilot integration |
| [CopilotChat.nvim](https://github.com/CopilotC-Nvim/CopilotChat.nvim) | Chat interface for Copilot |
| [claude-code.nvim](https://github.com/anthropics/claude-code) | Claude AI integration |

### Editing Enhancements

| Plugin | Purpose |
|--------|---------|
| [nvim-autopairs](https://github.com/windwp/nvim-autopairs) | Auto-close brackets, quotes |
| [nvim-surround](https://github.com/kylechui/nvim-surround) | Surround text with brackets, quotes, tags |
| [todo-comments.nvim](https://github.com/folke/todo-comments.nvim) | Highlight and search TODO comments |

### Workflow

| Plugin | Purpose |
|--------|---------|
| [vim-tmux-navigator](https://github.com/christoomey/vim-tmux-navigator) | Seamless tmux/vim navigation |
| [auto-session](https://github.com/rmagatti/auto-session) | Automatic session management |

### Installation

All plugins are automatically installed on first launch via lazy.nvim. To manually sync plugins:

```vim
:Lazy sync
```

To update all plugins:

```vim
:Lazy update
```


