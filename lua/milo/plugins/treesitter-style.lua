return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",
    config = function()
      local langs = { "c", "lua", "rust", "python", "bash", "json", "html", "css", "javascript", "typescript", "markdown", "markdown_inline" }

      require("nvim-treesitter").install(langs)

      vim.api.nvim_create_autocmd("FileType", {
        pattern = langs,
        callback = function()
          pcall(vim.treesitter.start)
        end,
      })
    end,
  },
}
