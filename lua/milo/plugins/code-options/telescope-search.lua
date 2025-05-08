return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    --"nvim-tree/nvim-web-devicons",
    "nvim-telescope/telescope-file-browser.nvim",
    "nvim-telescope/telescope-ui-select.nvim",
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")

    telescope.setup({
      defaults = {
        sorting_strategy = "ascending",
        layout_strategy = "vertical",
        --layout_config = { prompt_position = "top" },
        layout_config = {
          --prompt_position = "top",
          prompt_position = "top", -- El buscador queda arriba
          --results_height = 0.3,
          vertical = {
            size = {
              width = "95%",
              height = "95%",
            },
            --preview_height = 0,
          },
        },
        border = true,
        path_display = { "truncate " },
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-j>"] = actions.move_selection_next,
            ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
          },
        },
      },
      extensions = {
        file_browser = {
          previewer = true,
          gitsigns = false,
          initial_mode = "normal",
          layout_config = {
            width = 0.9, -- Cambia el ancho del panel del file browser
            height = 0.9, -- Cambia la altura del panel del file browser
          },
          icons = {
            folder = "",
          },
        },
      },
    })

    telescope.load_extension("fzf")
    telescope.load_extension("file_browser")

    local keymap = vim.keymap

    vim.keymap.set("n", "fb", function()
      telescope.extensions.file_browser.file_browser({
        respect_gitignore = false,
        hidden = true,
        grouped = true,
        previewer = false,
        initial_mode = "normal",
        layout_config = {
          height = 30,
          prompt_position = "top",
        },
      })
    end)

    vim.keymap.set("n", "fp", function()
      telescope.extensions.file_browser.file_browser({
        path = vim.fn.expand("%:p:h"), -- Carpeta actual del archivo
        select_buffer = true, -- Selecciona el buffer actual
        previewer = false, -- Desactiva el preview
        layout_config = {
          height = 30,
          prompt_position = "top", -- El buscador queda arriba
        },
      })
    end)

    --   vim.keymap.set(
    --   "n",
    --   "<leader>fp",
    --   function()
    --     require("telescope.builtin").file_browser({
    --       path = vim.fn.expand("%:p:h"), -- Carpeta actual del archivo
    --       select_buffer = true,         -- Selecciona el buffer actual
    --       previewer = false             -- Desactiva el preview
    --     })
    --   end,
    --   { desc = "Open file browser at current file location without preview" }
    -- )

    keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
    keymap.set("n", "<leader>tb", "<cmd>Telescope buffers<cr>", { desc = "Fuzzy find files in cwd" })
    --keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
    keymap.set("n", "<leader>ts", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
    keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })

    keymap.set("n", "<leader>td", "<cmd>TodoTelescope<cr>", { desc = "Find all todos" })
    keymap.set("n", "<leader>tt", "<cmd>Telescope treesitter <cr>", { desc = "Find all todos" })
    keymap.set("n", "<leader>te", "<cmd>Telescope diagnostics bufnr=0<cr>", { desc = "Show errors in buffer" })
    keymap.set("n", "<leader>tr", "<cmd>Telescope diagnostics<cr>", { desc = "Show errors in all proyect" })
  end,
}
