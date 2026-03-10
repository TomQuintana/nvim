return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = "nvim-tree/nvim-web-devicons",
  event = "VeryLazy",
  config = function()
    local bufferline = require("bufferline")

    bufferline.setup({
      options = {
        mode = "buffers",
        separator_style = "slant",
        diagnostics = "nvim_lsp",
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
          local s = " "
          for e, n in pairs(diagnostics_dict) do
            local sym = e == "error" and " " or (e == "warning" and " " or " ")
            s = s .. n .. sym
          end
          return s
        end,
        show_buffer_close_icons = true,
        show_close_icon = false,
        color_icons = true,
        offsets = {
          {
            filetype = "neo-tree",
            text = "Explorer",
            highlight = "Directory",
            separator = true,
          },
        },
      },
    })

    local keymap = vim.keymap

    keymap.set("n", "<leader>bc", "<cmd>BufferLineCloseOthers <CR>", { desc = "Close all buffers except current" })
    keymap.set("n", "<leader>lb", "<cmd>Telescope buffers<cr>", { desc = "Find string under cursor in cwd" })
    keymap.set("n", "<leader>bf", "<cmd>BufferLinePickClose<CR>")
  end,
}
