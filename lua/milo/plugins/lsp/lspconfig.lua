---@diagnostic disable-next-line: undefined-global
return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true },
    { "folke/lazydev.nvim",                  ft = "lua", opts = {} },
  },
  config = function()
    vim.diagnostic.config({
      virtual_text = false,
      update_in_insert = false,
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = "✘",
          [vim.diagnostic.severity.WARN] = "▲",
          [vim.diagnostic.severity.INFO] = "⚑",
          [vim.diagnostic.severity.HINT] = "⚑",
        },
      },
    })

    local lspconfig = require("lspconfig")
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    local lsp_attach_group = vim.api.nvim_create_augroup("milo_lsp_attach", { clear = true })
    vim.api.nvim_create_autocmd("LspAttach", {
      group = lsp_attach_group,
      callback = function(args)
        local bufnr = args.buf
        vim.keymap.set("n", "<leader>lo", vim.lsp.buf.outgoing_calls,
          { desc = "Outgoing calls", noremap = true, silent = true, buffer = bufnr })
      end,
    })

    -- Servidores básicos (sin config especial)
    for _, server in ipairs({ "html", "cssls", "tailwindcss" }) do
      lspconfig[server].setup({ capabilities = capabilities })
    end

    lspconfig.lua_ls.setup({
      capabilities = capabilities,
      settings = {
        Lua = {
          diagnostics = { globals = { "vim" } },
          workspace = { checkThirdParty = false },
        },
      },
    })

    lspconfig.basedpyright.setup({
      capabilities = capabilities,
      settings = {
        python = {
          analysis = {
            diagnosticMode = "openFilesOnly",
            typeCheckingMode = "basic",
            autoImportCompletions = true,
            autoSearchPaths = true,
            useLibraryCodeForTypes = true,
          },
        },
      },
    })

    lspconfig.ruff.setup({
      capabilities = capabilities,
      settings = {
        ruff = {
          lint   = { enable = false },
          format = { enable = true },
        },
      },
    })

    lspconfig.ts_ls.setup({
      capabilities = capabilities,
      root_dir = lspconfig.util.root_pattern("tsconfig.json", "jsconfig.json", "package.json", ".git"),
      single_file_support = false,
      settings = {
        typescript = {
          inlayHints = {
            includeInlayParameterNameHints = "all",
            includeInlayFunctionParameterTypeHints = true,
            includeInlayVariableTypeHints = true,
            includeInlayPropertyDeclarationTypeHints = true,
            includeInlayFunctionLikeReturnTypeHints = true,
          },
        },
        javascript = {
          inlayHints = {
            includeInlayParameterNameHints = "all",
            includeInlayFunctionParameterTypeHints = true,
            includeInlayVariableTypeHints = true,
            includeInlayPropertyDeclarationTypeHints = true,
            includeInlayFunctionLikeReturnTypeHints = true,
          },
        },
      },
    })
  end,
}
