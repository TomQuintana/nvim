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
          vscLineNumber = '#FFFFFF',
        },
        
        -- Override highlight groups (see ./lua/vscode/theme.lua)
        group_overrides = {
          -- this supports the same val table as vim.api.nvim_set_hl
          -- use colors from this colorscheme by requiring vscode.colors!
          Cursor = { fg = '#FFFFFF', bg = '#FF0000', bold = true },
        }
      })
      
      -- Set the colorscheme to VSCode
      vim.cmd("colorscheme vscode")
    end,
  },
}

