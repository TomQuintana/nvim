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
      -- Configurar gruvbox-material
      vim.g.gruvbox_material_style = 'mix' -- hard, medium, soft, mix
      vim.g.gruvbox_material_background = 'medium' -- hard, medium, soft
      vim.g.gruvbox_material_transparent_background = 0
      vim.g.gruvbox_material_enable_italic = 1
      vim.g.gruvbox_material_cursor = 'auto'
      vim.g.gruvbox_material_sign_column_background = 'none'
      vim.g.gruvbox_material_spell_foreground = 'none'
      vim.g.gruvbox_material_ui_contrast = 'low' -- low, high
      vim.g.gruvbox_material_show_eob = 1
      vim.g.gruvbox_material_diagnostic_text_highlight = 0
      vim.g.gruvbox_material_diagnostic_line_highlight = 0
      vim.g.gruvbox_material_diagnostic_virtual_text = 'grey'
      vim.g.gruvbox_material_current_word = 'grey background'
      vim.g.gruvbox_material_disable_terminal_colors = 0
    end,
  },

  {
    "mikesmithgh/gruvsquirrel.nvim",
    lazy = true,
    config = function()
      require("gruvsquirrel").setup({
        -- Configuraciones específicas del tema gruvsquirrel
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
    "forest-nvim/sequoia.nvim",
    lazy = false,
    priority = 1000,
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
      
      -- Aplicar el tema
      vim.cmd("colorscheme gruvbox-material")
      
      -- Personalizar colores para que coincida con VSCode
      vim.api.nvim_set_hl(0, "Normal", { bg = "#1e1e1e" }) -- Fondo VSCode
      vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#252526" }) -- Ventanas flotantes
      vim.api.nvim_set_hl(0, "StatusLine", { bg = "#007acc", fg = "#ffffff" }) -- Barra de estado
      vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "#3c3c3c", fg = "#cccccc" }) -- Barra inactiva
      vim.api.nvim_set_hl(0, "TabLine", { bg = "#2d2d30", fg = "#cccccc" })
      vim.api.nvim_set_hl(0, "TabLineFill", { bg = "#2d2d30" })
      vim.api.nvim_set_hl(0, "TabLineSel", { bg = "#1e1e1e", fg = "#ffffff" })
      
      -- Sidebar (NvimTree, etc.)
      vim.api.nvim_set_hl(0, "NvimTreeNormal", { bg = "#252526", fg = "#cccccc" })
      vim.api.nvim_set_hl(0, "NvimTreeWinSeparator", { bg = "#1e1e1e", fg = "#1e1e1e" })
      
      -- Telescope
      vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "#1e1e1e" })
      vim.api.nvim_set_hl(0, "TelescopeBorder", { bg = "#1e1e1e", fg = "#3c3c3c" })
      vim.api.nvim_set_hl(0, "TelescopePromptNormal", { bg = "#2d2d30" })
      vim.api.nvim_set_hl(0, "TelescopePromptBorder", { bg = "#2d2d30", fg = "#2d2d30" })
      vim.api.nvim_set_hl(0, "TelescopeResultsNormal", { bg = "#1e1e1e" })
      vim.api.nvim_set_hl(0, "TelescopeResultsBorder", { bg = "#1e1e1e", fg = "#1e1e1e" })
      vim.api.nvim_set_hl(0, "TelescopePreviewNormal", { bg = "#1e1e1e" })
      vim.api.nvim_set_hl(0, "TelescopePreviewBorder", { bg = "#1e1e1e", fg = "#1e1e1e" })
      
      -- Variables Python (manteniendo tu personalización)
      vim.api.nvim_set_hl(0, "@variable.python", { fg = "#86bbd8" })
      
      -- Menus y popups
      vim.api.nvim_set_hl(0, "Pmenu", { bg = "#252526", fg = "#cccccc" })
      vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#094771", fg = "#ffffff" })
      vim.api.nvim_set_hl(0, "PmenuSbar", { bg = "#3e3e42" })
      vim.api.nvim_set_hl(0, "PmenuThumb", { bg = "#535353" })
      
      -- Split windows
      vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#3c3c3c", bg = "#1e1e1e" })
    end,
  },
  -- Otros temas disponibles pero inactivos
  -- { "olimorris/onedarkpro.nvim", lazy = true },
  -- { "navarasu/onedark.nvim", lazy = true },
  -- { "bluz71/vim-moonfly-colors", lazy = true },
}

