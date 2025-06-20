-- Adds a comment to the function below

return {
  "olimorris/codecompanion.nvim",
  opts = {},
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    --"OXY2DEV/markview.nvim"
  },
  config = function()
    require("codecompanion").setup({
      adapters = {
        copilot_lua = { -- Corregido de 'copilot' a 'copilot_lua'
          -- No se necesita configuración específica del adaptador si se usa la configuración por defecto de copilot.lua
        },
      },
      -- Puedes añadir keymaps aquí si quieres
      -- keymaps = {
      --   { "n", "<C-g>", "<cmd>CodeCompanionToggle<CR>", desc = "Toggle Code Companion" },
      -- },
    })
  end,
}
