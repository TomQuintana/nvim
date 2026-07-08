vim.g.mapleader = " "
local keymap = vim.keymap

-- ================================
-- GENERAL FILE OPERATIONS
-- ================================
keymap.set("n", "<leader>w", "<cmd>w<CR>", { noremap = true })
keymap.set("n", "<leader>q", "<cmd>q<CR>", { noremap = true })
keymap.set("n", "<leader>wq", "<cmd>wq<CR>", { noremap = true })
keymap.set("n", "<leader>fw", ":w!<CR>", { noremap = true })

-- ================================
-- INSERT MODE & NAVIGATION
-- ================================
keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })
keymap.set('n', '<leader>jj', '<cmd>normal 20j<CR>')
keymap.set('n', '<leader>kk', '<cmd>normal 20k<CR>')

-- ================================
-- BUFFER MANAGEMENT
-- ================================
keymap.set("n", "<leader>ba", "<cmd>bufdo bd<CR>", { desc = "Close all buffers" })
keymap.set('n', '<leader>m', '<cmd>BufferLineCyclePrev<CR>')
keymap.set('n', '<leader>s', '<cmd>BufferLineCycleNext<CR>')

-- ================================
-- SEARCH & HIGHLIGHTS
-- ================================
keymap.set("n", "<leader>nh", "<cmd>nohl<CR>", { desc = "Clear search highlights" })

-- ================================
-- WINDOW MANAGEMENT
-- ================================
keymap.set("n", "<leader>vs", "<C-w>v") -- split window vertically
keymap.set("n", "<leader>hs", "<C-w>s") -- split window horizontally
keymap.set("n", "<leader>es", "<C-w>=") -- make split windows equal width & height
keymap.set("n", "<leader>xs", ":close<CR>") -- close current split window

-- Window resizing
keymap.set("n", "<C-Up>", ":resize +2<CR>", { desc = "Increase window height" })
keymap.set("n", "<C-Down>", ":resize -2<CR>", { desc = "Decrease window height" })
keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Decrease window width" })
keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "Increase window width" })

-- Alternative keys for window resizing
keymap.set("n", "<leader>+", ":vertical resize +5<CR>", { desc = "Increase width by 5" })
keymap.set("n", "<leader>-", ":vertical resize -5<CR>", { desc = "Decrease width by 5" })

-- Split navigation (<C-h/j/k/l>) is handled by vim-tmux-navigator plugin

-- ================================
-- PLUGIN MANAGEMENT
-- ================================
keymap.set("n", "<leader>lz", ":Lazy<CR>", { noremap = true })

-- ================================
-- LSP - CODE NAVIGATION
-- ================================
keymap.set("n", "gd", function() Snacks.picker.lsp_definitions() end, { desc = "Go to definition" })
keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover documentation" })

-- ================================
-- LSP - CODE ACTIONS & REFACTORING
-- ================================
keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Code actions" })
keymap.set("n", "<leader>rn", vim.lsp.buf.rename) -- smart rename

-- ================================
-- LSP - DIAGNOSTICS
-- ================================
keymap.set("n", "[d", function() vim.diagnostic.jump({ count = -1, float = true }) end, { desc = "Previous diagnostic" })
keymap.set("n", "]d", function() vim.diagnostic.jump({ count = 1, float = true }) end, { desc = "Next diagnostic" })
keymap.set("n", "<leader>be", function() Snacks.picker.diagnostics() end, { desc = "Show workspace diagnostics" })
keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "Show cursor diagnostics" })
keymap.set("n", "<leader>le", function() Snacks.picker.diagnostics_buffer() end, { desc = "Show buffer diagnostics" })

-- ================================
-- PICKER - SEARCH & FIND
-- ================================
keymap.set("n", "<leader>tf", function() Snacks.picker.lsp_symbols() end, { desc = "Search function or methods in file" })
keymap.set("n", "<leader>gb", function() Snacks.picker.git_branches() end, { desc = "Git branches with actions" })
--keymap.set("n", "<leader>fb", function() Snacks.picker.explorer({ cwd = vim.fn.expand("%:p:h") }) end, { desc = "Explorer (current file dir)" })
keymap.set("n", "<leader>fp", function() Snacks.picker.explorer() end, { desc = "Explorer (cwd)" })

keymap.set("n", "<leader>hk", "<cmd>lua require('milo.keymaps_window').open_keymaps_window()<CR>", { desc = "Keymaps Helper" })

vim.keymap.set('n', '<leader>nd', function()
  local buf = vim.api.nvim_create_buf(false, true)
  local width = math.floor(vim.o.columns * 0.4)
  local height = vim.o.lines - 4
  
  local opts = {
    relative = 'editor',
    width = width,
    height = height,
    col = vim.o.columns - width - 2,
    row = 1,
    style = 'minimal',
    border = 'rounded'
  }
  
  vim.api.nvim_open_win(buf, true, opts)
  vim.cmd('edit ' .. vim.fn.expand('~') .. '/Documents/Obsidian\\ Vault/Tom-Docs/Quadminds/Notas\\ del\\ dia\\ a\\ dia.md')
end, { noremap = true, silent = true })



--vim.keymap.set("n", "<C-u>", "<C-o>", { desc = "Jump anterior (reemplaza C-o)" })

-- ================================
-- TAB MANAGEMENT
-- ================================
keymap.set("n", "<leader>tn", "<cmd>tabnew<CR>",   { desc = "New tab" })
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close tab" })
keymap.set("n", "]t", "<cmd>tabnext<CR>",     { desc = "Next tab" })
keymap.set("n", "[t", "<cmd>tabprevious<CR>", { desc = "Previous tab" })

-- for i = 1, 9 do
--   keymap.set("n", "<leader>" .. i, i .. "gt", { desc = "Go to tab " .. i })
-- end
