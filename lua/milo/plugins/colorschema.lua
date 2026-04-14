local THEME = "gruvbox-material"

return {
  {
    "sainnhe/gruvbox-material",
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.gruvbox_material_background           = "hard"
      vim.g.gruvbox_material_foreground           = "original" -- paleta retro original
      vim.g.gruvbox_material_enable_italic        = 1
      vim.g.gruvbox_material_enable_bold          = 1
      vim.g.gruvbox_material_transparent_background = 0
      vim.g.gruvbox_material_better_performance   = 1
      vim.cmd("colorscheme gruvbox-material")
    end,
  },
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
}
