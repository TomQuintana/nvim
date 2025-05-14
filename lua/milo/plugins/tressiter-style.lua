return {
  -- Instalar nvim-treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate", -- Actualiza los parsers de treesitter
    config = function()
      require("nvim-treesitter.configs").setup({
        -- Asegura que los lenguajes están instalados
        ensure_installed = { "c", "lua", "rust", "python", "bash", "json", "html", "css", "javascript", "typescript" }, -- Instala todos los lenguajes mantenidos

        -- Resaltado de sintaxis con treesitter
        highlight = {
          enable = true, -- Habilita el resaltado con treesitter
          additional_vim_regex_highlighting = false, -- Usar solo treesitter
        },
        -- Soporte para la indentación
        indent = {
          enable = true, -- Habilita la indentación con treesitter
        },

        -- Nuevas configuraciones requeridas:
        -- Modules a cargar
        modules = {
          "highlight",
          "indent",
        },

        -- Instalación y sincronización automáticas
        sync_install = true, -- Instalar parsers automáticamente
        auto_install = true, -- Instalar parsers si faltan
        ignore_install = {}, -- No ignorar ningún parser
      })
    end,
  },

  -- Instalar la extensión de paréntesis
  -- {
  --   "p00f/nvim-ts-rainbow", -- Resaltado de paréntesis, corchetes y llaves
  --   after = "nvim-treesitter", -- Solo se carga después de nvim-treesitter
  --   config = function()
  --     require("nvim-treesitter.configs").setup({
  --       rainbow = {
  --         enable = true,
  --         extended_mode = true, -- Habilita el resaltado extendido (por ejemplo, para llaves en bloques largos)
  --         max_file_lines = nil, -- No limitamos la cantidad de líneas por archivo
  --         colors = {
  --           "#C5CAE9", -- Pastel azul claro
  --           "#C9E4CA", -- Pastel verde claro
  --           "#F7D2C4", -- Pastel naranja claro
  --           "#C9E4CA", -- Pastel verde claro
  --           "#F2C4CF", -- Pastel rosa claro
  --           "#E4DAC8", -- Pastel amarillo claro
  --         },
  --       },
  --       modules = {},
  --       sync_install = false,
  --       ensure_installed = {},
  --       ignore_install = {},
  --       auto_install = true,
  --     })
  --   end,
  -- },
}
