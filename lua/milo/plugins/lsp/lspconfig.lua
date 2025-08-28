
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
    -- Corrijo el nombre de los servidores en ensure_installed

    -- local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
    -- for type, icon in pairs(signs) do
    --   local hl = "DiagnosticSign" .. type
    --   vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    -- end
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

    local on_attach = function(client, bufnr)
      local keymap = vim.keymap
      local opts = { noremap = true, silent = true, buffer = bufnr }

      -- keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
      -- --keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
      -- keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
      -- keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
      -- keymap.set("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
      -- keymap.set("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
      -- keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
      -- Agrego keymap para usar las acciones de código de lspsaga
      keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>",
        { desc = "Lspsaga Code Action", noremap = true, silent = true, buffer = bufnr })
    end

    local capabilities = require("cmp_nvim_lsp").default_capabilities()
    local lspconfig = require("lspconfig")

    -- Configuración para servidores estándar
    local servers = { "html", "cssls", "tailwindcss", "pyright", "lua_ls", "ruff" }
    for _, server_name in ipairs(servers) do
      lspconfig[server_name].setup({
        on_attach = on_attach,
        capabilities = capabilities,
      })
    end

    -- Corrijo la configuración condicional para ruff_lsp
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "python",
      callback = function()
        local util = require("lspconfig.util")
        local root_dir = util.root_pattern("ruff.toml", "pyproject.toml")(vim.api.nvim_buf_get_name(0))
        if not root_dir then
          return
        end

        local has_ruff_config = false
        local pyproject_path = util.path.join(root_dir, "pyproject.toml")
        if vim.fn.filereadable(pyproject_path) == 1 then
          for line in io.lines(pyproject_path) do
            if line:match("%[tool%.ruff%]") then
              has_ruff_config = true
              break
            end
          end
        end

        if has_ruff_config or vim.fn.filereadable(util.path.join(root_dir, "ruff.toml")) == 1 then
          if lspconfig.ruff then
            lspconfig.ruff.setup({
              on_attach = on_attach,
              capabilities = capabilities,
            })
          else
            vim.notify("ruff no está disponible", vim.log.levels.ERROR)
          end
        end
      end,
    })
  end,
}
