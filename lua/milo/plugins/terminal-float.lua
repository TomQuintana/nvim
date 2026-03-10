return {
  'akinsho/toggleterm.nvim',
  version = "*",
  config = function()
    local normal_size = math.floor(vim.o.lines * 0.35)
    local expanded = false

    require("toggleterm").setup({
      size = function(term)
        if term.direction == "horizontal" then
          return normal_size
        end
      end,
      open_mapping = [[<c-/>]],
      hide_numbers = false,
      shade_terminals = true,
      start_in_insert = true,
      persist_size = false,
      direction = "horizontal",
      winbar = {
        enabled = true,
        name_formatter = function(term)
          return " " .. term.id .. ": " .. (term.display_name or "terminal") .. " "
        end,
      },
    })

    -- Navegar entre splits en modo terminal
    vim.keymap.set('t', '<C-h>', '<C-\\><C-n><C-w>h')
    vim.keymap.set('t', '<C-l>', '<C-\\><C-n><C-w>l')
    vim.keymap.set('t', '<C-j>', '<C-\\><C-n><C-w>j')
    vim.keymap.set('t', '<C-k>', '<C-\\><C-n><C-w>k')

    -- Salir de insert mode
    vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')

    -- Nueva terminal (como el botón + de VSCode)
    vim.keymap.set('n', '<C-.>', function()
      local count = #require("toggleterm.terminal").get_all()
      vim.cmd((count + 1) .. "ToggleTerm")
    end, { desc = "New terminal" })

    -- Cambiar entre terminales por número (<leader>t1, t2, ...)
    for i = 1, 9 do
      vim.keymap.set('n', '<leader>t' .. i, '<cmd>' .. i .. 'ToggleTerm<cr>',
        { desc = "Terminal " .. i })
    end

    -- Expandir / contraer terminal
    vim.keymap.set({ 'n', 't' }, '<leader>te', function()
      if expanded then
        vim.cmd('resize ' .. normal_size)
        expanded = false
      else
        vim.cmd('resize ' .. math.floor(vim.o.lines * 0.75))
        expanded = true
      end
    end, { desc = "Toggle expand terminal" })
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
