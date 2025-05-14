return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true },
    { "folke/neodev.nvim",                   opts = {} },
  },
  config = function()
    local lspconfig = require("lspconfig")

    local mason_lspconfig = require("mason-lspconfig")

    -- import cmp-nvim-lsp plugin
    local cmp_nvim_lsp = require("cmp_nvim_lsp")

    local capabilities = cmp_nvim_lsp.default_capabilities()

    local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    mason_lspconfig.setup_handlers({
      function(server_name)
        lspconfig[server_name].setup({
          capabilities = capabilities,
        })
      end,
      ["lua_ls"] = function()
        lspconfig["lua_ls"].setup({
          capabilities = capabilities,
          settings = {
            Lua = {
              -- make the language server recognize "vim" global
              diagnostics = {
                globals = { "vim" },
              },
              completion = {
                callSnippet = "Replace",
              },
            },
          },
        })
      end,

      ["ts_ls"] = function()
        lspconfig["ts_ls"].setup({
          filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
          cmd = { "typescript-language-server", "--stdio" },
          -- on_attach = function(client, bufnr)
          --   -- Disable the code actions capability
          --   client.server_capabilities.codeActionProvider = false
          -- end,
          on_attach = function(client, bufnr)
            -- Mapeo de la función a una tecla específica solo cuando `tsserver` está adjunto
            vim.api.nvim_buf_set_keymap(
              bufnr,
              "n",
              "<leader>ca",
              "<cmd>lua show_code_actions_if_error()<CR>",
              { noremap = true, silent = true }
            )

            -- Aquí puedes agregar otras configuraciones o funcionalidades
          end,
        })
      end,

      ["pyright"] = function()
        lspconfig["pyright"].setup({
          --capabilities = capabilities,
          capabilities = capabilities,
          settings = {
            pyright = {},
            -- python = {
            --   analysis = {
            --     autoImportCompletions = true, -- Habilitar autoimportación
            --     autoSearchPaths = true,
            --     diagnosticMode = "openFilesOnly",
            --     useLibraryCodeForTypes = true
            --   },
            -- },
          },
        })
      end,
      --   ["pylsp"] = function()
      --     lspconfig["pylsp"].setup({
      --       capabilities = capabilities,
      --       settings = {
      --         pylsp = {
      --           plugins = {
      --             -- ========================
      --             -- Linters
      --             -- ========================
      --             flake8 = {
      --               enabled = true,
      --               maxLineLength = 88,
      --               ignore = {"E203", "W503", "E501"},  -- E501 lo maneja Black
      --             },
      --             pylint = {
      --               enabled = true,
      --               args = {"--rcfile=pyproject.toml"},  -- Usa tu archivo de configuración
      --             },
      --             mypy = {
      --               enabled = true,
      --               live_mode = false,  -- Se ejecuta al guardar
      --               strict = false,
      --             },
      --             -- ========================
      --             -- Formateadores
      --             -- ========================
      --             black = {
      --               enabled = true,
      --               line_length = 88,
      --             },
      --             isort = {
      --               enabled = true,
      --               profile = "black",
      --             },
      --             -- ========================
      --             -- Deshabilitar plugins redundantes
      --             -- ========================
      --             pycodestyle = { enabled = false },  -- Usamos flake8 para PEP8
      --             pyflakes = { enabled = false },    -- Lo cubre flake8
      --             mccabe = { enabled = false },      -- Complejidad ciclomática via flake8
      --             autopep8 = { enabled = false },    -- Usamos black
      --             yapf = { enabled = false },        -- Usamos black
      --             pylsp_mypy = { enabled = false },  -- Usamos el plugin directo de mypy
      --           }
      --         }
      --       },
      --       on_attach = function(client, bufnr)
      --         -- Formatear con Black al guardar
      --         vim.api.nvim_create_autocmd("BufWritePre", {
      --           buffer = bufnr,
      --           callback = function()
      --             vim.lsp.buf.format({
      --               filter = function(client)
      --                 return client.name == "pylsp"  -- Solo formatear con pylsp
      --               end,
      --               async = false
      --             })
      --           end
      --         })
      --       end
      --     })
      -- end,

      ["ruff"] = function()
        -- local util = require("lspconfig.util")
        -- local lspconfig = require("lspconfig")
        --
        -- local root_files = { "ruff.toml", "pyproject.toml" }
        -- local root_dir = util.root_pattern(unpack(root_files))(vim.fn.expand("%:p"))
        --
        -- if not root_dir then
        --   return
        -- end
        --
        -- -- Verificar si pyproject.toml tiene [tool.ruff]
        -- local has_ruff_config = false
        -- local pyproject = util.path.join(root_dir, "pyproject.toml")
        -- if vim.fn.filereadable(pyproject) == 1 then
        --   for line in io.lines(pyproject) do
        --     if line:match("%[tool%.ruff%]") then
        --       has_ruff_config = true
        --       break
        --     end
        --   end
        -- end
        --
        -- -- Saltar si no hay ruff.toml ni [tool.ruff] en pyproject
        -- if not has_ruff_config and vim.fn.filereadable(util.path.join(root_dir, "ruff.toml")) ~= 1 then
        --   return
        -- end

        lspconfig["ruff"].setup({
          capabilities = capabilities,
          on_attach = function(client, bufnr)
            -- Formatear al guardar y organizar imports
            vim.api.nvim_create_autocmd("BufWritePre", {
              buffer = bufnr,
              callback = function()
                if client.supports_method("textDocument/formatting") then
                  vim.lsp.buf.format({ async = false })
                end
                -- if client.supports_method("textDocument/codeAction") then
                --   vim.lsp.buf.code_action({
                --     context = { only = { "source.organizeImports", "source.fixAll" } },
                --     apply = true,
                --   })
                -- end
              end,
            })
          end,
          settings = {
            ruff = {
              format = {
                indentStyle = "space",
                indentWidth = 4,
                lineLength = 88,
                quoteStyle = "double",
              },
              lint = {
                select = { "E4", "E7", "E9", "F" },
                ignore = {},
                preview = true,
              },
              isort = {
                enabled = true,
                knownFirstParty = {},
                extraStandardLibrary = {},
              },
              exclude = {
                "**/.git",
                "**/.venv",
                "**/__pycache__",
                "**/build",
                "**/dist",
              },
              organizeImports = true,
            },
          },
        })
      end,

      -- ["pylsp"] = function()
      --   lspconfig["pylsp"].setup({
      --     capabilities = capabilities,
      --     settings = {
      --       pylsp = {
      --         plugins = {
      --           pyflakes = { enabled = true },  -- Detecta errores básicos (como variables no definidas)
      --           pycodestyle = { enabled = true }, -- Sugiere correcciones PEP8
      --           mccabe = { enabled = false },    -- Opcional (puede ser molesto)
      --           -- Los formateadores pueden permanecer desactivados
      --           autopep8 = { enabled = false },
      --           yapf = { enabled = false },
      --           pylsp_black = { enabled = false },
      --         },
      --       },
      --     },
      --     on_attach = function(client, bufnr)
      --       local bufopts = { noremap = true, silent = true, buffer = bufnr }
      --       vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, bufopts)
      --     end,
      --   })
      -- end,
    })
  end,

  -- require("lspconfig").ruff_lsp.setup({
  --   init_options = {
  --     settings = {
  --       -- Any extra CLI arguments for `ruff` go here.
  --       args = {},
  --     },
  --   },
  -- }),
}
