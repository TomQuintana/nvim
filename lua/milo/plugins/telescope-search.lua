return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-tree/nvim-web-devicons",
    "nvim-telescope/telescope-ui-select.nvim",
  },

  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")
    local action_state = require("telescope.actions.state")

    telescope.setup({
      defaults = {
        sorting_strategy = "ascending",
        layout_strategy = "vertical",
        layout_config = {
          prompt_position = "top",
          vertical = {
            size = {
              width = "95%",
              height = "95%",
            },
          },
        },
        border = true,
        path_display = { "truncate" },
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-j>"] = actions.move_selection_next,
            ["<C-d>"] = function(prompt_bufnr)
              local current_picker = action_state.get_current_picker(prompt_bufnr)
              local selected_entry = action_state.get_selected_entry()
              vim.api.nvim_buf_delete(selected_entry.bufnr, { force = true })
              current_picker:refresh()
            end,
          },
          n = {
            ["<C-d>"] = function(prompt_bufnr)
              local current_picker = action_state.get_current_picker(prompt_bufnr)
              local selected_entry = action_state.get_selected_entry()
              vim.api.nvim_buf_delete(selected_entry.bufnr, { force = true })
              current_picker:refresh()
            end,
          },
        },
      },
      extensions = {},
    })

    telescope.load_extension("fzf")
    telescope.load_extension("ui-select")

    local keymap = vim.keymap
    local builtin = require("telescope.builtin")

    keymap.set("n", "<leader>fe", function()
      builtin.find_files({
        hidden = true,
        no_ignore = true,
        prompt_title = "Find .env files",
        find_command = { "rg", "--files", "--glob", "*.env*" },
      })
    end, { desc = "Find .env files" })

    keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
    keymap.set("n", "<leader>lb", "<cmd>Telescope buffers<cr>", { desc = "Fuzzy find buffers" })
    keymap.set("n", "<leader>ts", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
    keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
    keymap.set("n", "<leader>td", "<cmd>TodoTelescope<cr>", { desc = "Find all todos" })
    keymap.set("n", "<leader>tt", "<cmd>Telescope treesitter<cr>", { desc = "Find all treesitter symbols" })
    keymap.set("n", "<leader>te", "<cmd>Telescope diagnostics bufnr=0<cr>", { desc = "Show errors in buffer" })
    keymap.set("n", "<leader>tr", "<cmd>Telescope diagnostics<cr>", { desc = "Show errors in all project" })
  end,
}
