-- return {
--   "nvimdev/lspsaga.nvim",
--   commit = "1cd5bf2ae644656e673aa6754d86b140235c71db",
--   config = function()
--     require("lspsaga").setup({
--       -- diagnostic = {
--       --   -- Configuración para los diagnósticos dentro de lspsaga
--       --   severity_sort = true, -- Activar el orden de severidad en los diagnósticos
--       -- },
--       ui = {
--         code_action = "", -- Asegúrate de reemplazar 'your icon' con el icono que quieras usar
--         hover = {
--           max_width = 0.9,
--           max_height = 0.8,
--         }
--       },
--       -- Configuración de keymaps específicos para hover
--       hover = {
--         max_width = 0.9,
--         max_height = 0.8,
--         open_link = "gx",
--         open_browser = "!firefox",
--       },
--       -- Keymaps globales de lspsaga
--       keys = {
--         quit = "q",
--         exec = "<CR>",
--         vsplit = "v",
--         split = "s",
--         tabe = "t",
--         tabnew = "r",
--         quit_in_show = {"q", "<ESC>"},
--       },
--       -- Scroll keymaps para ventanas flotantes
--       scroll_preview = {
--         scroll_down = "<C-f>",
--         scroll_up = "<C-b>",
--       },
--     })
--   end,
-- }

return {
  "nvimdev/lspsaga.nvim",
  config = function()
    require("lspsaga").setup({
      symbol_in_winbar = { enable = false },
      lightbulb = {
        enable = false,
      },
      --ui = { border = "single" },
    })
  end,
}
