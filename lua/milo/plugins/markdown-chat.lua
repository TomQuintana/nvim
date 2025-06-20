-- This file configures the 'markview.nvim' plugin for Markdown and CodeCompanion file previews in Neovim.
return {
  "OXY2DEV/markview.nvim",
  lazy = false,
  opts = {
    preview = {
      filetypes = { "markdown", "codecompanion" },
      ignore_buftypes = {},
    },
  },
}
