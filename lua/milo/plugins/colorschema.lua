return {
  {
    "ellisonleao/gruvbox.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("gruvbox").setup({
        contrast = "hard",
        italic = {
          strings   = true,
          emphasis  = true,
          comments  = true,
          operators = false,
          folds     = true,
        },
        bold = true,
        -- rojo → naranja retro, variables blancas → aqua/celeste retro
        palette_overrides = {
          bright_red  = "#D3869B", -- rosa/púrpura claro (reemplaza rojo brillante)
          neutral_red = "#B16286", -- púrpura retro (reemplaza rojo neutro)
        },
        overrides = {
          -- variables: de blanco/amarillo → aqua retro
          -- ["@variable"]         = { fg = "#8EC07C", italic = false },
          -- ["@variable.builtin"] = { fg = "#83A598", italic = true },
          -- Identifier            = { fg = "#8EC07C" },
          -- keywords en púrpura retro
          ["@keyword"]          = { fg = "#B16286", bold = true },
          Statement             = { fg = "#B16286", bold = true },
        },
      })
      vim.cmd("colorscheme gruvbox")
    end,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = true,
    priority = 900,
    config = function()
      require("catppuccin").setup({
        flavour = "mocha",
        color_overrides = {
          mocha = {
            base   = "#1e1e1e", -- VSCode dark background
            mantle = "#181818",
            crust  = "#141414",
            red    = "#cba6f7", -- mauve en lugar de rojo
            maroon = "#fab387", -- peach en lugar de maroon
          },
        },
      })
      --vim.cmd("colorscheme catppuccin")
    end,
  },
  {
    "folke/tokyonight.nvim",
    lazy = true,
    priority = 900,
    config = function()
      require("tokyonight").setup({
        style = "night",
        transparent = false,
        terminal_colors = true,
        styles = {
          comments = { italic = true },
          keywords = { bold = true },
          functions = {},
          variables = {},
        },
      })
      -- vim.cmd("colorscheme tokyonight")
    end,
  },
  {
    "Mofiqul/vscode.nvim",
    lazy = true,
    priority = 900,
    config = function()
      require("vscode").setup({
        style = "dark",
        transparent = false,
        italic_comments = true,
        disable_nvimtree_bg = true,
        color_overrides = {
          vscLineNumber = "#808080",
        },
        group_overrides = {
          DiagnosticSignError = { fg = "#f44747", bg = "NONE" },
          DiagnosticSignWarn  = { fg = "#ff8800", bg = "NONE" },
          DiagnosticSignInfo  = { fg = "#4fc1ff", bg = "NONE" },
          DiagnosticSignHint  = { fg = "#4ec9b0", bg = "NONE" },
          GitSignsAdd    = { fg = "#4ec9b0", bg = "NONE" },
          GitSignsChange = { fg = "#569cd6", bg = "NONE" },
          GitSignsDelete = { fg = "#f44747", bg = "NONE" },
          MatchParen = { fg = "#ffd700", bold = true, underline = true },
        },
      })
      --vim.cmd("colorscheme vscode")
    end,
  },
}
