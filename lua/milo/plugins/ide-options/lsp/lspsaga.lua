return {
  "nvimdev/lspsaga.nvim",
  commit = "1cd5bf2ae644656e673aa6754d86b140235c71db",
  config = function()
    require("lspsaga").setup({
      -- diagnostic = {
      --   -- Configuración para los diagnósticos dentro de lspsaga
      --   severity_sort = true, -- Activar el orden de severidad en los diagnósticos
      -- },
      ui = {
        code_action = "", -- Asegúrate de reemplazar 'your icon' con el icono que quieras usar
      },
    })
  end,
}
