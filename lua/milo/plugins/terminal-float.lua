return {
  'akinsho/toggleterm.nvim',
  version = "*",
  config = function()
    require("toggleterm").setup({
      size = 20,
      open_mapping = [[<c-.>]],        -- Ctrl+. para abrir/cerrar
      hide_numbers = true,
      shade_terminals = true,
      start_in_insert = true,
      persist_size = true,
      direction = "float",             -- Flotante
      float_opts = {
        border = "curved",
        width = 120,
        height = 30,
      },
    })

    -- Navegar entre splits en modo terminal
    vim.keymap.set('t', '<C-h>', '<C-\\><C-n><C-w>h')
    vim.keymap.set('t', '<C-l>', '<C-\\><C-n><C-w>l')
    vim.keymap.set('t', '<C-j>', '<C-\\><C-n><C-w>j')
    vim.keymap.set('t', '<C-k>', '<C-\\><C-n><C-w>k')

    -- Salir de insert mode
    vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')
  end
}

-- return {
--   'akinsho/toggleterm.nvim',
--   version = "*",
--   config = function()
--     require("toggleterm").setup({
--       size = 20,
--       open_mapping = [[<c-.>]],
--       hide_numbers = true,
--       shade_terminals = true,
--       start_in_insert = true,
--       persist_size = true,
--       direction = "float",
--       float_opts = {
--         border = "curved",
--         width = 120,
--         height = 30,
--       },
--     })
--
--     -- Dividir terminal con toggleterm
--     vim.keymap.set('n', '<leader>ts', function()
--       vim.cmd('vsplit')
--       vim.cmd('1ToggleTerm')
--       vim.cmd('wincmd l')
--       vim.cmd('2ToggleTerm')
--     end)
--
--     -- Navegar entre splits en modo terminal
--     vim.keymap.set('t', '<C-h>', '<C-\\><C-n><C-w>h')
--     vim.keymap.set('t', '<C-l>', '<C-\\><C-n><C-w>l')
--     vim.keymap.set('t', '<C-j>', '<C-\\><C-n><C-w>j')
--     vim.keymap.set('t', '<C-k>', '<C-\\><C-n><C-w>k')
--
--     -- Salir de insert mode
--     vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')
--   end
-- }
