return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    require("mason").setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    require("mason-lspconfig").setup({
      -- automatic_enable = false: evita conflictos de habilitación automática
      -- lspconfig.lua maneja la habilitación manualmente con configuración específica
      automatic_enable = false,
      ensure_installed = {
        "html",
        "cssls",
        "tailwindcss",
        "lua_ls",
        "basedpyright", -- Para autocompletado inteligente de Python
        "ruff",         -- Para linting/formatting de Python
        "stylua",
      },
      handlers = {
        -- Handler vacío para evitar configuraciones automáticas duplicadas
        function() end,
      },
    })

    require("mason-tool-installer").setup({
      ensure_installed = {
        "prettier",
      },
    })
  end,
}
