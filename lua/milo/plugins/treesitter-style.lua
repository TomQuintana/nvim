return {
  -- Instalar nvim-treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false, -- Cargar inmediatamente
    build = ":TSUpdate", -- Actualiza los parsers de treesitter
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

        sync_install = false, -- Install parsers asynchronously (better startup)
        auto_install = true, -- Instalar parsers si faltan
        ignore_install = {}, -- No ignorar ningún parser
      })
    end,
  },
}
