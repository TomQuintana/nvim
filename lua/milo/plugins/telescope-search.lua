return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-tree/nvim-web-devicons",
    "nvim-telescope/telescope-file-browser.nvim", -- Eliminar o comentar esta línea
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
      extensions = {
        -- Eliminar todo el bloque file_browser si no lo vas a usar
        -- file_browser = {
        --   previewer = true,
        --   gitsigns = false,
        --   initial_mode = "normal",
        --   layout_config = {
        --     width = 0.9,
        --     height = 0.9,
        --   },
        --   icons = {
        --     folder = "",
        --   },
        -- },
      },
    })

    telescope.load_extension("fzf")
    -- Eliminar esta línea si no vas a usar file_browser
    -- telescope.load_extension("file_browser")
    telescope.load_extension("ui-select")

    local keymap = vim.keymap

    -- Eliminar estos keymaps si no vas a usar file_browser
    keymap.set("n", "fb", function()
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

    local builtin = require("telescope.builtin")

    keymap.set("n", "fp", function()
      telescope.extensions.file_browser.file_browser({
        path = vim.fn.expand("%:p:h"),
        select_buffer = true,
        previewer = false,
        layout_config = {
          height = 30,
          prompt_position = "top",
        },
      })
    end)
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

-- return {
--   "nvim-telescope/telescope.nvim",
--   branch = "0.1.x",
--   dependencies = {
--     "nvim-lua/plenary.nvim",
--     { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
--     "nvim-tree/nvim-web-devicons",
--     "nvim-telescope/telescope-file-browser.nvim",
--     "nvim-telescope/telescope-ui-select.nvim",
--   },
--   config = function()
--     local telescope = require("telescope")
--     local actions = require("telescope.actions")
--     local action_state = require("telescope.actions.state")
--
--     telescope.setup({
--       defaults = {
--         sorting_strategy = "ascending",
--         layout_strategy = "vertical",
--         layout_config = {
--           prompt_position = "top",
--           vertical = {
--             size = {
--               width = "95%",
--               height = "95%",
--             },
--           },
--         },
--         border = true,
--         path_display = { "truncate" },
--
--         -- Ignorar archivos excepto .env
--         file_ignore_patterns = {
--           "node_modules/.*",
--           "%.git/.*",
--           -- NO incluir "%.env" aquí para que sea visible
--         },
--
--         mappings = {
--           i = {
--             ["<C-k>"] = actions.move_selection_previous,
--             ["<C-j>"] = actions.move_selection_next,
--             ["<C-d>"] = function(prompt_bufnr)
--               local current_picker = action_state.get_current_picker(prompt_bufnr)
--               local selected_entry = action_state.get_selected_entry()
--               vim.api.nvim_buf_delete(selected_entry.bufnr, { force = true })
--               current_picker:refresh()
--             end,
--           },
--           n = {
--             ["<C-d>"] = function(prompt_bufnr)
--               local current_picker = action_state.get_current_picker(prompt_bufnr)
--               local selected_entry = action_state.get_selected_entry()
--               vim.api.nvim_buf_delete(selected_entry.bufnr, { force = true })
--               current_picker:refresh()
--             end,
--           },
--         },
--       },
--       extensions = {
--         file_browser = {
--           previewer = true,
--           gitsigns = false,
--           initial_mode = "normal",
--           layout_config = {
--             width = 0.9,
--             height = 0.9,
--           },
--           icons = {
--             folder = "",
--           },
--         },
--       },
--     })
--
--     telescope.load_extension("fzf")
--     telescope.load_extension("file_browser")
--     telescope.load_extension("ui-select")
--
--     local keymap = vim.keymap
--     local builtin = require("telescope.builtin")
--
--     -- Find files SIN respetar .gitignore (encuentra .env)
--     keymap.set("n", "<leader>ff", function()
--       builtin.find_files({
--         hidden = true,           -- Mostrar archivos ocultos
--         no_ignore = true,        -- NO respetar .gitignore
--         no_ignore_parent = true, -- NO respetar .gitignore del padre
--       })
--     end, { desc = "Fuzzy find files (includes .env)" })
--
--     -- OPCIONAL: Comando específico SOLO para .env
--     keymap.set("n", "<leader>fe", function()
--       builtin.find_files({
--         hidden = true,
--         no_ignore = true,
--         prompt_title = "Find .env files",
--         find_command = { "rg", "--files", "--glob", "*.env*" },
--       })
--     end, { desc = "Find .env files" })
--
--     -- OPCIONAL: Buscar respetando .gitignore (comportamiento normal)
--     keymap.set("n", "<leader>fg", function()
--       builtin.find_files({
--         hidden = true,
--         no_ignore = false,  -- SÍ respetar .gitignore
--       })
--     end, { desc = "Fuzzy find files (respects .gitignore)" })
--
--     keymap.set("n", "fb", function()
--       telescope.extensions.file_browser.file_browser({
--         respect_gitignore = false,
--         hidden = true,
--         grouped = true,
--         previewer = false,
--         initial_mode = "normal",
--         layout_config = {
--           height = 30,
--           prompt_position = "top",
--         },
--       })
--     end)
--
--     keymap.set("n", "fp", function()
--       telescope.extensions.file_browser.file_browser({
--         path = vim.fn.expand("%:p:h"),
--         select_buffer = true,
--         previewer = false,
--         layout_config = {
--           height = 30,
--           prompt_position = "top",
--         },
--       })
--     end)
--
--
--     keymap.set("n", "<leader>lb", "<cmd>Telescope buffers<cr>", { desc = "Fuzzy find buffers" })
--     keymap.set("n", "<leader>ts", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
--     keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
--     keymap.set("n", "<leader>td", "<cmd>TodoTelescope<cr>", { desc = "Find all todos" })
--     keymap.set("n", "<leader>tt", "<cmd>Telescope treesitter<cr>", { desc = "Find all treesitter symbols" })
--     keymap.set("n", "<leader>te", "<cmd>Telescope diagnostics bufnr=0<cr>", { desc = "Show errors in buffer" })
--     keymap.set("n", "<leader>tr", "<cmd>Telescope diagnostics<cr>", { desc = "Show errors in all project" })
--   end,
-- }
