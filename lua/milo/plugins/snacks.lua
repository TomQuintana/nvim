return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    picker = {
      enabled = true,
      ui_select = true,
      layout = { preset = "default" },
      win = {
        input = {
          keys = {
            ["<C-j>"] = { "list_down", mode = { "i", "n" } },
            ["<C-k>"] = { "list_up", mode = { "i", "n" } },
            ["<C-d>"] = { "bufdelete", mode = { "i", "n" } },
          },
        },
      },
    },
  },
  keys = {
    { "<leader>ff", function() Snacks.picker.files() end, desc = "Fuzzy find files in cwd" },
    {
      "<leader>fe",
      function()
        Snacks.picker.files({
          hidden = true,
          ignored = true,
          glob = "*.env*",
          title = "Find .env files",
        })
      end,
      desc = "Find .env files",
    },
    { "<leader>fb", function() Snacks.picker.explorer() end, desc = "Browse files" },
    {
      "<leader>fp",
      function() Snacks.picker.explorer({ cwd = vim.fn.expand("%:p:h") }) end,
      desc = "Browse from current file path",
    },
    { "<leader>ts", function() Snacks.picker.grep() end, desc = "Find string in cwd" },
    { "<leader>fc", function() Snacks.picker.grep_word() end, desc = "Find string under cursor in cwd" },
    { "<leader>td", function() Snacks.picker.todo_comments() end, desc = "Find all todos" },
    { "<leader>tt", function() Snacks.picker.treesitter() end, desc = "Find all treesitter symbols" },
    { "<leader>te", function() Snacks.picker.diagnostics_buffer() end, desc = "Show errors in buffer" },
    { "<leader>tr", function() Snacks.picker.diagnostics() end, desc = "Show errors in all project" },
  },
}
