
---@diagnostic disable-next-line: undefined-global
return {
  "neovim/nvim-lspconfig",
  event = "VeryLazy", -- Cambiar a VeryLazy para evitar múltiples activaciones
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true },
    { "folke/lazydev.nvim",                  ft = "lua", opts = {} },
  },
  config = function()
    vim.diagnostic.config({
      virtual_text = false,       -- ← esto elimina los mensajes inline
      update_in_insert = false,
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = "✘",
          [vim.diagnostic.severity.WARN] = "▲",
          [vim.diagnostic.severity.INFO] = "⚑",
          [vim.diagnostic.severity.HINT] = "⚑",
        }
      }
    })

    -- Suprimir notificaciones de LSP attach/detach
    local original_notify = vim.notify
    vim.notify = function(msg, level, opts)
      if msg:match("Language server") or msg:match("LSP") or msg:match("attached") then
        return -- Silenciar mensajes de LSP
      end
      original_notify(msg, level, opts)
    end

    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    -- on_attach via LspAttach autocommand (nvim 0.11+ way)
    local lsp_attach_group = vim.api.nvim_create_augroup("milo_lsp_attach", { clear = true })
    vim.api.nvim_create_autocmd("LspAttach", {
      group = lsp_attach_group,
      callback = function(args)
        local bufnr = args.buf
        vim.keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>",
          { desc = "Lspsaga Code Action", noremap = true, silent = true, buffer = bufnr })
      end,
    })

    -- Configurar servidores básicos
    local basic_servers = { "html", "cssls", "tailwindcss", "lua_ls" }
    for _, server_name in ipairs(basic_servers) do
      vim.lsp.config(server_name, {
        capabilities = capabilities,
      })
    end

    -- Python: usar basedpyright para type checking y ruff para linting
    -- Configurar solo basedpyright (ruff se maneja via linting, no como LSP)
    -- vim.lsp.config("basedpyright", {
    --   capabilities = capabilities,
    --   root_markers = { "pyproject.toml", "setup.py", "setup.cfg", ".git" },
    --   single_file_support = false,
    --   settings = {
    --     basedpyright = {
    --       analysis = {
    --         diagnosticMode = "openFilesOnly",
    --         typeCheckingMode = "basic",
    --         -- Permitir que basedpyright maneje type checking
    --         -- Ruff se manejará via nvim-lint/conform, no como LSP
    --         autoImportCompletions = true,
    --         autoSearchPaths = true,
    --         useLibraryCodeForTypes = true,
    --       },
    --     },
    --   },
    -- })

    -- Python: basedpyright para autocompletado + ruff para linting

    -- basedpyright: autocompletado inteligente y type checking
    vim.lsp.config("basedpyright", {
      capabilities = capabilities,
      root_markers = { "pyproject.toml", "setup.py", "setup.cfg", ".git" },
      single_file_support = false,
      settings = {
        basedpyright = {
          analysis = {
            diagnosticMode = "openFilesOnly",
            typeCheckingMode = "basic",
            autoImportCompletions = true,  -- Autocompletado de imports
            autoSearchPaths = true,
            useLibraryCodeForTypes = true,
          },
        },
      },
    })

    -- Configurar ruff solo para linting/formatting (sin diagnostics duplicados)
    vim.lsp.config("ruff", {
      capabilities = capabilities,
      root_markers = { "pyproject.toml", "ruff.toml", ".ruff.toml", ".git" },
      single_file_support = false,
      settings = {
        ruff = {
          lint = {
            enable = false, -- Evitar diagnostics duplicados con basedpyright
          },
          format = {
            enable = true,  -- Solo formatting
          },
        },
      },
    })

    -- Habilitar servidores básicos + ambos Python LSPs
    local all_servers = vim.list_extend(basic_servers, { "basedpyright", "ruff" })
    vim.lsp.enable(all_servers)
  end,
}
