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
keymap.set("n", "<leader>cb", "<cmd>bufdo bd<CR>", { desc = "Clear search highlights" })
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

-- ================================
-- TMUX INTEGRATION
-- ================================
keymap.set("n", "<C-m>", "<cmd>TmuxNavigateRight<cr>", { noremap = true })

-- ================================
-- PLUGIN MANAGEMENT
-- ================================
keymap.set("n", "<leader>lz", ":Lazy<CR>", { noremap = true })

-- ================================
-- LSP - CODE NAVIGATION
-- ================================
keymap.set("n", "fd", "<cmd>Lspsaga peek_definition<CR>", { desc = "Peek definition" })
keymap.set("n", "gf", "<cmd>Lspsaga finder<CR>", { desc = "Find references and definitions" })
keymap.set("n", "gd", "<cmd>Lspsaga goto_definition<CR>", { desc = "Go to definition" })
keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>") -- show documentation for what is under cursor

-- ================================
-- LSP - CODE ACTIONS & REFACTORING
-- ================================
keymap.set({ "n", "v" }, "<leader>ca", "<cmd>Lspsaga code_action<CR>") -- see available code actions, in visual mode will apply to selection
keymap.set("n", "<leader>rn", vim.lsp.buf.rename) -- smart rename

-- ================================
-- LSP - DIAGNOSTICS
-- ================================
keymap.set("n", "[d", vim.diagnostic.goto_prev) -- jump to previous diagnostic in buffer
keymap.set("n", "]d", vim.diagnostic.goto_next) -- jump to next diagnostic in buffer
keymap.set("n", "<leader>be", "<cmd>Lspsaga show_workspace_diagnostics<CR>", { desc = "Show workspace diagnostics" })
--keymap.set("n", "<leader>le", "<cmd>Lspsaga show_buf_diagnostics<CR>", { desc = "Show buffer diagnostics" })
keymap.set("n", "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", { desc = "Show cursor diagnostics" })
keymap.set("n", "<leader>le", "<cmd>Telescope diagnostics bufnr=0<CR>", { desc = "Show cursor diagnostics" })

-- ================================
-- TELESCOPE - SEARCH & FIND
-- ================================
keymap.set("n", "<leader>tf", "<cmd>Telescope lsp_document_symbols<CR>", { desc = "Search function or methods in file" })
keymap.set("n", "<leader>gb", "<cmd>Telescope git_branches<CR>", { desc = "Git branches with actions" })

-- ================================
-- COPILOT CHAT
-- ================================
keymap.set("n", "<leader>cp", "<cmd>CopilotChat<CR>") -- open copilot chat
keymap.set("n", "<leader>cq", "<cmd>CopilotChatClose<CR>") -- close copilot chat
keymap.set("n", "<leader>cf", "<cmd>CopilotChatFix<CR>", { noremap = true, silent = true }) -- fix with copilot

keymap.set("n", "<leader>kh", "<cmd>lua require('milo.keymaps_window').open_keymaps_window()<CR>", { desc = "Keymaps Helper" })
