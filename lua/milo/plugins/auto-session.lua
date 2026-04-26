return {
  'rmagatti/auto-session',
  config = function()
    require('auto-session').setup({
      suppressed_dirs = { '~/', '~/Projects', '~/Downloads', '/' },
      cwd_change_handling = true,
      auto_save = true,
      auto_restore = true,
      post_restore_cmds = {
        function()
          vim.schedule(function()
            -- Re-aplicar colorscheme
            --pcall(vim.cmd, "colorscheme vscode")
            -- Re-disparar filetype detection y treesitter en todos los buffers
            for _, buf in ipairs(vim.api.nvim_list_bufs()) do
              if vim.api.nvim_buf_is_loaded(buf) and vim.api.nvim_buf_get_name(buf) ~= "" then
                vim.api.nvim_buf_call(buf, function()
                  vim.cmd("filetype detect")
                  local ft = vim.bo.filetype
                  if ft and ft ~= "" then
                    pcall(vim.treesitter.start, buf, ft)
                  end
                end)
              end
            end
          end)
        end
      },
      pre_cwd_changed_cmds = {},
      post_cwd_changed_cmds = {
        function()
          require("lualine").refresh()
        end
      }
    })
  end
}
