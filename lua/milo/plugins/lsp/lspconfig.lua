
---@diagnostic disable-next-line: undefined-global
return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true },
    { "folke/neodev.nvim",                   opts = {} },
  },
  config = function()
    vim.diagnostic.config({
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = "✘",
          [vim.diagnostic.severity.WARN] = "▲",
          [vim.diagnostic.severity.INFO] = "⚑",
          [vim.diagnostic.severity.HINT] = "⚑",
        }
      }
    })

    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    -- on_attach via LspAttach autocommand (nvim 0.11+ way)
    vim.api.nvim_create_autocmd("LspAttach", {
      callback = function(args)
        local bufnr = args.buf
        vim.keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>",
          { desc = "Lspsaga Code Action", noremap = true, silent = true, buffer = bufnr })
      end,
    })

    -- Configuración para servidores estándar
    local servers = { "html", "cssls", "tailwindcss", "pyright", "lua_ls", "ruff" }
    for _, server_name in ipairs(servers) do
      vim.lsp.config(server_name, {
        capabilities = capabilities,
      })
    end
    vim.lsp.enable(servers)
  end,
}
