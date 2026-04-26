return {
  "dglsparsons/neo-reviewer",
  lazy = false,
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local nr = require("neo_reviewer")

    local cli_path = "neo-reviewer"

    nr.setup({
      cli_path            = cli_path,
      signs = {
        add    = "+",
        delete = "-",
        change = "~",
      },
      wrap_navigation     = true,
      auto_expand_deletes = false,
      thread_window = {
        keys = {
          reply  = "r",
          edit   = "e",
          delete = "d",
        },
      },
      review_diff = {
        skip_noise_files = true,
        noise_files = {
          "pnpm-lock.yaml",
          "Cargo.lock",
        },
      },
      input_window = {
        keys = {
          submit = "<C-y>",
          cancel = "<C-c>",
        },
      },
    })

    local opts = { silent = true, noremap = true }
    local function map(mode, lhs, rhs, desc)
      vim.keymap.set(mode, lhs, rhs, vim.tbl_extend("force", opts, { desc = desc }))
    end

    -- Review lifecycle
    map("n", "<leader>rr", ":ReviewPR<CR>",       "Review PR")
    map("n", "<leader>rd", nr.review_diff,         "Review local diff")
    map("n", "<leader>rq", nr.done,                "Close review")
    map("n", "<leader>rs", nr.sync,                "Sync review")

    -- Navigation (vim convention: ]/[ for forward/backward)
    map("n", "]r",          nr.next_change,        "Next change")
    map("n", "[r",          nr.prev_change,        "Prev change")
    map("n", "]R",          nr.next_comment,       "Next comment")
    map("n", "[R",          nr.prev_comment,       "Prev comment")

    -- Interaction
    map("n", "<leader>rc", nr.add_comment,         "Add comment")
    map("v", "<leader>rc", ":AddComment<CR>",      "Add comment on selection")
    map("n", "<leader>rv", nr.show_comment,        "View comment thread")
    map("n", "<leader>ro", nr.toggle_prev_code,    "Toggle old code")
    map("n", "<leader>rf", nr.show_file_picker,    "File picker")

    -- AI
    map("n", "<leader>ri", nr.toggle_ai_feedback,  "Toggle AI summary")
    map("n", "<leader>rA", nr.ask,                 "Ask AI about code")

    -- Submit
    map("n", "<leader>ra", nr.approve,             "Approve PR")
    map("n", "<leader>rx", nr.request_changes,     "Request changes")
  end,
}
