return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",


  config = function ()
    local indent = require("ibl")

    local highlight = {
      "RainbowGreen",
      "RainbowBlue",
      "RainbowYellow",
      "RainbowOrange",
      "RainbowViolet",
      "RainbowCyan",
      "RainbowRed",
    }

    local highlight_scope = {
      "RainbowOrange",
    }

    local hooks = require "ibl.hooks"
    hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
      vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
      vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
      vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
      vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
      vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
      vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
      vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
    end)

    indent.setup({
      indent = {
        char = "|" ,
        highlight = highlight
      },
      scope = {
        char = '|',
        show_exact_scope = true,
        show_start = true,
        highlight = highlight_scope
      },
    })
  end
}

