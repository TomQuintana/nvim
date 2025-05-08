return {
  "mfussenegger/nvim-lint",
  lazy = true,
  event = { "BufReadPre", "BufNewFile" }, -- to disable, comment this out
  config = function()
    local lint = require("lint")

    local function pylint_condition()
      local files = { ".pylintrc" , "pylint.json", ".ruff.toml" }
      for _, file in ipairs(files) do
        if vim.fn.filereadable(file) == 1 then
          return true
        end
      end
      return false
    end

    local function eslint_d_conditions()
      local files = { ".eslintrc.js", ".eslintrc.cjs", ".eslintrc.json", ".eslintrc", ".eslintrc.js", }
      for _, file in ipairs(files) do
        if vim.fn.filereadable(file) == 1 then
          return true
        end
      end
      return false
    end

    lint.linters_by_ft = {
      javascript = { "eslint_d" },
      typescript = { "eslint_d" },
      javascriptreact = { "eslint_d" },
      typescriptreact = { "eslint_d" },
      python = { "ruff" },
    }

    local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
      group = lint_augroup,
      callback = function()
        -- Utiliza eslint_d_conditions para determinar si deberías correr el linter
        if eslint_d_conditions() or pylint_condition() then
          lint.try_lint()
        else
          -- No hay archivos de configuración ESLint, no ejecutes el linter
        end
      end,
    })

    vim.keymap.set("n", "<leader>l", function()
      lint.try_lint()
    end, { desc = "Trigger linting for current file" })
  end,
}
