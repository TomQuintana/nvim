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


