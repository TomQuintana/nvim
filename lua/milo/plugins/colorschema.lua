-- Configuración corregida para temas en Lazy.nvim
return {
  -- Plugin principal de VSCode theme
  {
    "Mofiqul/vscode.nvim",
    lazy = false,    -- Cargar inmediatamente
    priority = 1000, -- Alta prioridad para temas
    config = function()
      -- Configuración del tema VSCode
      require("vscode").setup({
        -- Configuraciones opcionales del tema vscode
        transparent = false,
        italic_comments = true,
        disable_nvimtree_bg = false,
      })
      
      -- Opción para usar tu tema personalizado
      local use_custom_theme = false -- Cambia a true para usar tema personalizado
      
      if use_custom_theme then
        -- Aplicar tu tema personalizado
        print("🔄 Cargando Milo Cursor Theme...")
        local ok, cursor_milo = pcall(require, "cursor_milo")
        if not ok then
          print("❌ Error: No se pudo cargar cursor_milo")
          --vim.cmd("colorscheme vscode")
        end
      else
        -- Usar el tema vscode original
        print("🔄 Cargando VSCode theme...")
        --vim.cmd("colorscheme vscode")
      end
      
      -- Configuraciones personalizadas (solo si no usas el tema personalizado)
      if not use_custom_theme then
        -- NvimTree colors
        -- vim.cmd([[highlight NvimTreeFolderIcon guifg=#E5BE30]])
        -- vim.cmd([[highlight NvimTreeFolderName guifg=#DCDFF2]])
        -- vim.cmd([[highlight NvimTreeFolderNew guifg=#DCDFF2]])
        -- vim.cmd([[highlight NvimTreeIndentMarker guifg=#E5BE30]])
        --
        -- -- Telescope colors
        -- vim.cmd([[highlight TelescopePromptTitle guifg=#ff9e64]])
        -- vim.cmd([[highlight TelescopePromptBorder guifg=#ff9e64]])
        -- vim.cmd([[highlight TelescopeBorder guifg=#D9EDBF]])
        --
        -- -- Other highlights
        -- vim.cmd([[highlight WarningMsg guifg=#8FECFC]])
        -- vim.cmd([[highlight @variable.builtin guifg=#d86fc2]])
      end
    end,
  },
  
  -- Plugin Stoics theme
  {
  "mtendekuyokwa19/stoics.nvim",
  config = function()
    --vim.cmd("colorscheme stoics")
  end
},
  
  -- Otros temas comentados (descomenta el que quieras usar)
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = true,
    config = function()
      require("catppuccin").setup({
        flavour = "mocha", -- latte, frappe, macchiato, mocha
        transparent_background = false,
        term_colors = true,
        styles = {
          comments = { "italic" },
          conditionals = { "italic" },
          loops = { "italic" },
          functions = { "italic" },
          keywords = { "italic" },
        },
        color_overrides = {
          mocha = {
            -- base = "#081101", -- Descomenta si quieres un fondo personalizado
            -- mantle = "#081101",
            -- crust = "#081101",
          },
        },
      })
    end,
  },
  
  {
    "folke/tokyonight.nvim",
    lazy = true,
    config = function()
      require("tokyonight").setup({
        style = "night", -- storm, moon, night, day
        transparent = false,
        terminal_colors = true,
        styles = {
          comments = { italic = true },
          keywords = { italic = true },
          functions = {},
          variables = {},
        },
      })
    end,
  },
  
  {
    "sainnhe/gruvbox-material",
    lazy = true,
    config = function()
      vim.g.gruvbox_material_style = "mix"
      vim.g.gruvbox_material_enable_italic = 1
      vim.g.gruvbox_material_enable_bold = 1
    end,
  },
  
  -- Tema Sequoia (CORREGIDO)
  {
    "forest-nvim/sequoia.nvim",
    lazy = false,     -- Cargar inmediatamente si quieres usarlo
    priority = 1000,  -- Alta prioridad
    config = function()
      require("sequoia").setup({
        style = "main", -- main, night, rise
        transparent = false,
        terminal_colors = true,
        styles = {
          comments = { italic = true },
          keywords = { italic = true },
          functions = {},
          variables = {},
        },
      })
      
      -- Aplicar el tema después de la configuración

       vim.cmd([[highlight @variable.python guifg=#86bbd8]])
      vim.cmd("colorscheme sequoia") -- o 'sequoia-night' / 'sequoia-rise'
    end,
  },
  
  -- Otros temas disponibles pero inactivos
  -- { "olimorris/onedarkpro.nvim", lazy = true },
  -- { "navarasu/onedark.nvim", lazy = true },
  -- { "bluz71/vim-moonfly-colors", lazy = true },
}

