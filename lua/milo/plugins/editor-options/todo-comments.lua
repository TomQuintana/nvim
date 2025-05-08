return {
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  event = { "BufReadPre", "BufNewFile" },

  config = function ()
    local todo = require("todo-comments")

    todo.setup({
      signs = true,
      sign_priority = 8,

      keywords = {
        FIX = { icon = " ", color = "error", alt = { "FIXME", "BUG", "FIXIT", "ISSUE" } },
        TODO = { icon = " ", color = "info" },
        QUESTION = { icon = " ", color = "info" },
        HACK = { icon = " ", color = "warning" },
        WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
        NOTE = { icon = " ", color = "hint", alt = { "NOTE" } },
        TEST = { icon = "󰙨 ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
        REF = { icon = " ", color = "pending", alt = { "PENDING" }},
        NOTEBOOK = { icon = "󰂺 ", color = "pending", alt = { "PENDING" }},
        WORK = { icon = " ", color = "work", alt = { "WORK" }},
        SHOP = { icon = " ", color = "test", alt = { "TEST" }},
      },

      gui_style = {
        fg = "NONE",
        bg = "BOLD",
      },

      merge_keywords = true,
      highlight = {
        multiline = true,
        multiline_pattern = "^.",
        multiline_context = 10,
        before = "",
        keyword = "wide",
        after = "fg",
        pattern = [[.*<(KEYWORDS)\s*:]],
        comments_only = true,
        max_line_len = 400,
        exclude = {},
      },

      colors = {
        error = { "DiagnosticError", "ErrorMsg", "#DC2626" },
        warning = { "DiagnosticWarn", "WarningMsg", "#FBBF24" },
        info = { "DiagnosticInfo", "#BC7AF9" },
        hint = { "DiagnosticHint", "#10B981" },
        default = { "Identifier", "#7C3AED" },
        test = { "Identifier", "#FF00FF" },
        pending = { "Pending", "#BC7AF9" },
        work = {"Work", "#FED9ED"},
      },

      search = {
        command = "rg",
        args = {
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
        },
        pattern = [[\b(KEYWORDS):]], -- ripgrep regex
      },
    })
    local keymap = vim.keymap -- for conciseness


    -- Colors of TODO comment
    vim.cmd [[highlight TodofgTODO guifg=#f9e2af ]]
    vim.cmd [[highlight TodoBgTODO gui=bold guifg=#000000 guibg=#f9e2af ]]
    vim.cmd [[highlight TodoSignTODO guifg=#f9e2af]]

    -- Colors of QUESTION comment
    vim.cmd [[highlight TodofgQUESTION guifg=#FB892F ]]
    vim.cmd [[highlight TodoBgQUESTION gui=bold guifg=#F3F3F3 guibg=#FB892F ]]
    vim.cmd [[highlight TodoSignQUESTION guifg=#FB892F]]

    vim.cmd [[highlight TodoBgREF gui=bold guifg=#F3F3F3]]

    vim.cmd [[highlight TodoBgNOTEBOOK  gui=bold guifg=#050606 guibg=#7ED7C1]]
    vim.cmd [[highlight TodoSignNOTEBOOK guifg=#7ED7C1]]

    -- Colors of NOTE comment
    vim.cmd [[highlight TodofgNOTE guifg=#9cdefe]]
    vim.cmd [[highlight TodoBgNOTE gui=bold guifg=#000000 guibg=#9cdefe ]]
    vim.cmd [[highlight TodoSignNOTE guifg=#9cdefe]]

  end,
}
