local THEME = "vscode"

return {
  {
    "Mofiqul/vscode.nvim",
    lazy = false,
    priority = 1000,
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
      vim.cmd("colorscheme vscode")
    end,
  },
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
}
