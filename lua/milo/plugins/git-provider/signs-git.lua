return {
  "lewis6991/gitsigns.nvim",

  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require('gitsigns').setup()

    local keymap = vim.keymap

    keymap.set("n", "<leader>gn", "<cmd>Gitsigns next_hunk<cr>", { desc = "Fuzzy find files in cwd" })

    keymap.set("n", "<leader>gp", "<cmd>Gitsigns prev_hunk<cr>", { desc = "Fuzzy find files in cwd" })
    --keymap.set("n", "<leader>gb", "<cmd>Gitsigns toggle_current_line_blame<cr>", { desc = "Fuzzy find files in cwd" })
  end

}
