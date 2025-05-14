<h1 align="center">Nvim Text Editor</h1>

[![Neovim](https://img.shields.io/badge/Neovim-57A143?style=for-the-badge&logo=Neovim&logoColor=white&labelColor=101010)]()
[![Lua](https://img.shields.io/badge/Lua-2C2D72?style=for-the-badge&logo=Lua&logoColor=white&labelColor=101010)]()



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

<h2 align='center'> How to use </h2>

**init.lua** - Is the principal file in where import all modules

**lua/milo** - This folder contain a core and plugs folder and the plugin-setup file

<h3>Core folder</h3>

```bash
|-- colorschema.lua
|-- keymaps.lua
|-- options.lua
```

**colorschema** - This folder deals with color type and color changing of any variable

**keymaps** - This folder contains the custom keyboard shortcuts

**options** - In this folder the editor options are housed, such as - the column number or the indentation. 

<h3>Plugs</h3>
This folder contains the lsp files and the other plugs

<h3>Plugin-setup</h3>
In this file all the plugins that are considered necessary are imported


