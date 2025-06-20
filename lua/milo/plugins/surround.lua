return {
  "kylechui/nvim-surround",
  version = "*", -- Usa la última versión estable (*)
  event = "VeryLazy", -- Cargar de forma perezosa cuando sea necesario
  config = function()
    require("nvim-surround").setup({
      -- Configuración personalizada (si es necesario)
    })
  end,
}

