-- Cambia este valor para seleccionar el tema activo:
-- "vscode" | "sequoia" | "sequoia-night" | "sequoia-rise" | "sequoia-fog" | "sequoia-ember" | "sequoia-moss"
local THEME = "sequoia"

return {
  {
    "Mofiqul/vscode.nvim",
    lazy = THEME ~= "vscode",
    priority = 1000,
    config = function()
      if THEME ~= "vscode" then return end
      require("vscode").setup({
        style = "dark",
        transparent = false,
        italic_comments = true,
        disable_nvimtree_bg = true,
        color_overrides = {
          vscLineNumber = "#808080",
        },
        group_overrides = {
          -- Signos de diagnóstico
          DiagnosticSignError = { fg = "#f44747", bg = "NONE" },
          DiagnosticSignWarn  = { fg = "#ff8800", bg = "NONE" },
          DiagnosticSignInfo  = { fg = "#4fc1ff", bg = "NONE" },
          DiagnosticSignHint  = { fg = "#4ec9b0", bg = "NONE" },
          -- Signos de git (gitsigns)
          GitSignsAdd    = { fg = "#4ec9b0", bg = "NONE" },
          GitSignsChange = { fg = "#569cd6", bg = "NONE" },
          GitSignsDelete = { fg = "#f44747", bg = "NONE" },
          -- Paréntesis emparejados
          MatchParen = { fg = "#ffd700", bold = true, underline = true },
        },
      })
      vim.cmd("colorscheme vscode")
      -- Variable color overrides (celeste/blue palette)
      vim.api.nvim_set_hl(0, "@variable",           { fg = "#7dcfff" }) -- celeste
      vim.api.nvim_set_hl(0, "@variable.builtin",   { fg = "#f78c6c" }) -- naranja cálido
      vim.api.nvim_set_hl(0, "@variable.parameter", { fg = "#82aaff" }) -- azul suave
      vim.api.nvim_set_hl(0, "@variable.member",    { fg = "#89ddff" }) -- celeste claro
      vim.api.nvim_set_hl(0, "Identifier",          { fg = "#7dcfff" }) -- celeste
      vim.api.nvim_set_hl(0, "@field",              { fg = "#89ddff" }) -- celeste claro
      vim.api.nvim_set_hl(0, "@property",           { fg = "#73daca" }) -- teal
    end,
  },
  {
    "forest-nvim/sequoia.nvim",
    lazy = not vim.tbl_contains({
      "sequoia", "sequoia-night", "sequoia-rise",
      "sequoia-fog", "sequoia-ember", "sequoia-moss",
    }, THEME),
    priority = 1000,
    config = function()
      vim.cmd("colorscheme " .. THEME)
      -- Variable color overrides (celeste/blue palette)
      vim.api.nvim_set_hl(0, "@variable",           { fg = "#7dcfff" }) -- celeste
      vim.api.nvim_set_hl(0, "@variable.builtin",   { fg = "#f78c6c" }) -- naranja cálido
      vim.api.nvim_set_hl(0, "@variable.parameter", { fg = "#82aaff" }) -- azul suave
      vim.api.nvim_set_hl(0, "@variable.member",    { fg = "#89ddff" }) -- celeste claro
      vim.api.nvim_set_hl(0, "Identifier",          { fg = "#7dcfff" }) -- celeste
      vim.api.nvim_set_hl(0, "@field",              { fg = "#89ddff" }) -- celeste claro
      vim.api.nvim_set_hl(0, "@property",           { fg = "#73daca" }) -- teal
    end,
  },
  -- Rainbow delimiters: paréntesis y corchetes con colores por nivel
  {
    "HiPhish/rainbow-delimiters.nvim",
    event = "BufReadPost",
    config = function()
      local rainbow = require("rainbow-delimiters")
      require("rainbow-delimiters.setup").setup({
        strategy = {
          [""] = rainbow.strategy["global"],
        },
        query = {
          [""] = "rainbow-delimiters",
          lua = "rainbow-blocks",
        },
        highlight = {
          "RainbowDelimiterRed",
          "RainbowDelimiterYellow",
          "RainbowDelimiterBlue",
          "RainbowDelimiterOrange",
          "RainbowDelimiterGreen",
          "RainbowDelimiterViolet",
          "RainbowDelimiterCyan",
        },
      })
    end,
  },
  -- {
  --   "folke/tokyonight.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     require("tokyonight").setup({
  --       style = "night",
  --       transparent = false,
  --       terminal_colors = true,
  --       styles = {
  --         comments = { italic = true },
  --         keywords = { italic = true },
  --         functions = {},
  --         variables = {},
  --       },
  --       on_colors = function(colors)
  --         colors.bg = "#1c1c1c"
  --         colors.bg_dark = "#1c1c1c"
  --         colors.bg_float = "#1c1c1c"
  --         colors.bg_highlight = "#222222"
  --         colors.bg_popup = "#1c1c1c"
  --         colors.bg_search = "#222222"
  --         colors.bg_sidebar = "#1c1c1c"
  --         colors.bg_statusline = "#1c1c1c"
  --       end,
  --       on_highlights = function(hl, c)
  --         hl["@variable"] = { fg = "#7dcfff" }
  --         hl["@variable.builtin"] = { fg = "#ff9e64" }
  --         hl["@variable.parameter"] = { fg = "#e0af68" }
  --         hl["@variable.member"] = { fg = "#9ece6a" }
  --         hl["Identifier"] = { fg = "#7dcfff" }
  --         hl["@parameter"] = { fg = "#e0af68" }
  --         hl["@field"] = { fg = "#9ece6a" }
  --         hl["@property"] = { fg = "#73daca" }
  --       end,
  --     })
  --     vim.cmd("colorscheme tokyonight")
  --   end,
  -- },
  -- {
  --   "catppuccin/nvim",
  --   name = "catppuccin",
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     require("catppuccin").setup({
  --       flavour = "mocha",
  --       color_overrides = {
  --         mocha = {
  --           base = "#1a1a1a",
  --           mantle = "#151515",
  --           crust = "#101010",
  --         },
  --       },
  --     })
  --   end,
  -- },
}
