return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },
  {
    "Mofiqul/vscode.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require('vscode').setup({
        -- Alternatively set style in setup
        style = 'dark',
        
        -- Enable transparent background
        transparent = false,
        
        -- Enable italic comment
        italic_comments = true,
        
        -- Disable nvim-tree background color
        disable_nvimtree_bg = true,
        
        -- Override colors (see ./lua/vscode/colors.lua)
        color_overrides = {
          vscLineNumber = '#808080',
        },
        
        -- Override highlight groups (see ./lua/vscode/theme.lua)
        group_overrides = {
          Cursor = { fg = '#FFFFFF', bg = '#FF0000', bold = true },
        }
      })
      vim.cmd("colorscheme vscode")
    end,
  },
  {
    "forest-nvim/sequoia.nvim",
    lazy = false,
    priority = 1000,
    config = function()
    end,
  },
  {
    "Mofiqul/dracula.nvim",
    lazy = false,
    priority = 1000,
    config = function()
    end,
  },
}

