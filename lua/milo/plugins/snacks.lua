return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    picker = {
      enabled = true,
      ui_select = true,
      layout = { preset = "default" },
      -- ocultar estos directorios/archivos en explorer, files y grep
      exclude = { ".venv", ".ruff_cache", ".DS_Store", "__pycache__" },
      sources = {
        explorer = { hidden = true, ignored = true },
      },
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
  config = function(_, opts)
    require("snacks").setup(opts)

    -- Abrir el file browser (explorer) de Snacks al iniciar Neovim
    -- cuando se abre sin archivo o sobre un directorio (no durante git commit, etc.)
    -- vim.api.nvim_create_autocmd("VimEnter", {
    --   group = vim.api.nvim_create_augroup("snacks_explorer_autostart", { clear = true }),
    --   callback = function()
    --     if vim.bo.buftype ~= "" then return end
    --     local argc = vim.fn.argc()
    --     local first = argc > 0 and vim.fn.argv(0) or ""
    --     local is_dir = first ~= "" and vim.fn.isdirectory(first) == 1
    --     if argc == 0 or is_dir then
    --       vim.schedule(function() Snacks.picker.explorer() end)
    --     end
    --   end,
    -- })
  end,
  keys = {
    { "<leader>ff", function() Snacks.picker.files({ hidden = true, ignored = true, args = { "--exclude", ".venv", "--exclude", ".ruff_cache", "--exclude", ".DS_Store", "--exclude", "__pycache__" } }) end, desc = "Fuzzy find files in cwd" },
    -- {
    --   "<leader>fe",
    --   function()
    --     Snacks.picker.files({
    --       hidden = true,
    --       ignored = true,
    --       glob = "**/.env*",
    --       title = "Find .env files",
    --     })
    --   end,
    --   desc = "Find .env files",
    -- },
    { "gf",         function() Snacks.picker.lsp_references() end,                                                                                                                                            desc = "Find references" },
    { "<leader>ts", function() Snacks.picker.grep() end,                                                                                                                                                      desc = "Find string in cwd" },
    { "<leader>fc", function() Snacks.picker.grep_word() end,                                                                                                                                                 desc = "Find string under cursor in cwd" },
    { "<leader>td", function() Snacks.picker.todo_comments() end,                                                                                                                                             desc = "Find all todos" },
    { "<leader>tt", function() Snacks.picker.treesitter() end,                                                                                                                                                desc = "Find all treesitter symbols" },
    { "<leader>te", function() Snacks.picker.diagnostics_buffer() end,                                                                                                                                        desc = "Show errors in buffer" },
    { "<leader>tr", function() Snacks.picker.diagnostics() end,                                                                                                                                               desc = "Show errors in all project" },
  },
}
