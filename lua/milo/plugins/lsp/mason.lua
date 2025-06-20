return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
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
      ensure_installed = {
        "html",
        "cssls",
        "tailwindcss",
        "lua_ls",
        "pyright",
        "stylua",
        -- "tsserver", -- Descomentar después de actualizar los plugins con :Lazy update
      },
    })
  end,
}
