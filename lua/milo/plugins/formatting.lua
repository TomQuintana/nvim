return {
  "stevearc/conform.nvim",
  lazy = true,
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local conform = require("conform")
    local util = require("conform.util")

    --- Verifica si existe un archivo de configuración en el proyecto
    local function has_config(files)
      if type(files) == "string" then
        files = { files }
      end
      return util.root_file(files) ~= nil
    end

    --- Obtiene formateadores activos para un filetype
    local function get_active_formatters(ft)
      local config = conform.formatters_by_ft[ft]
      if type(config) == "function" then
        return config(0) -- Pasa el bufnr (0 para current)
      end
      return config or {}
    end

    conform.setup({
      formatters = {
        ruff_format = { -- Define ruff_format manualmente
          command = "ruff",
          args = { "format", "--stdin-filename", "$FILENAME" },
        },
      },
      formatters_by_ft = {
        javascript = { "prettier" },
        typescript = { "prettier" },
        -- ... otros lenguajes ...
        python = function(bufnr)
          local formatters = {}
          if has_config({ "ruff.toml", "pyproject.toml" }) then
            table.insert(formatters, "ruff_format")
          end
          if has_config({ ".isort.cfg", "pyproject.toml" }) then
            table.insert(formatters, "isort")
          end
          if has_config({ "pyproject.toml" }) then
            table.insert(formatters, "black")
          end
          return formatters
        end,
      },
    })

    -- Formatear al guardar (versión corregida)
    vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = "tom-workspace/*",
      callback = function(args)
        local ft = vim.bo[args.buf].filetype
        local formatters = get_active_formatters(ft)
        if #formatters > 0 then
          conform.format({
            lsp_fallback = true,
            async = false,
            timeout_ms = 1000,
          })
        end
      end,
      desc = "Autoformat on save (if formatter available)",
    })

    -- Tecla para formatear manualmente (sin cambios)
    vim.keymap.set({ "n", "v" }, "<leader>fa", function()
      conform.format({
        lsp_fallback = true,
        async = false,
        timeout_ms = 1000,
      })
    end, { desc = "Format file or range (in visual mode)" })
  end,
}
