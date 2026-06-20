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
      float = { source = true },
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = "✘",
          [vim.diagnostic.severity.WARN] = "▲",
          [vim.diagnostic.severity.INFO] = "⚑",
          [vim.diagnostic.severity.HINT] = "⚑",
        },
      },
    })

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

    vim.lsp.config("*", { capabilities = capabilities })

    vim.lsp.config("lua_ls", {
      settings = {
        Lua = {
          diagnostics = { globals = { "vim" } },
          workspace = { checkThirdParty = false },
        },
      },
    })

    vim.lsp.config("pyright", {
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

    vim.lsp.config("ruff", {
      settings = {
        ruff = {
          lint   = { enable = false },
          format = { enable = true },
        },
      },
    })

    vim.lsp.config("ts_ls", {
      root_markers = { "tsconfig.json", "jsconfig.json", "package.json", ".git" },
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

    vim.lsp.enable({ "html", "cssls", "tailwindcss", "lua_ls", "pyright", "ruff", "ts_ls" })
  end,
}
