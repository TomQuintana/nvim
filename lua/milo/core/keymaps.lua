--local str = require "luasnip.util.str"
vim.g.mapleader = " "

local keymap = vim.keymap
--TODO: how to close a buffer and jump to next
--

keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- general keys
keymap.set("n", "<leader>w", "<cmd>w<CR>", { noremap = true })
keymap.set("n", "<leader>q", "<cmd>q<CR>", { noremap = true })
keymap.set("n", "<leader>wq", "<cmd>wq<CR>", { noremap = true })
keymap.set("n", "<leader>fw", ":w!<CR>", { noremap = true })

keymap.set("n", "<leader>la", ":Lazy<CR>", { noremap = true })

--tmux
keymap.set("n", "<C-m>", "<cmd>TmuxNavigateRight<cr>", { noremap = true })

-- use jk to exit insert mode
keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

keymap.set("n", "fd", "<cmd>Lspsaga peek_definition<CR>", { desc = "Close all buffers except current" })
keymap.set("n", "gf", "<cmd>Lspsaga finder<CR>", { desc = "Close all buffers except current" }) -- show definition, references
keymap.set("n", "gd", "<cmd>Lspsaga goto_definition<CR>", { desc = "Close all buffers except current" }) -- show definition, references

-- code actions
--keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action) -- see available code actions, in visual mode will apply to selection

keymap.set({ "n", "v" }, "<leader>ca", "<cmd>Lspsaga code_action<CR>") -- see available code actions, in visual mode will apply to selection

-- rename all variables with the same name
keymap.set("n", "<leader>rn", vim.lsp.buf.rename) -- smart rename

keymap.set("n", "<leader>d", vim.diagnostic.open_float) -- show diagnostics for line

keymap.set("n", "[d", vim.diagnostic.goto_prev) -- jump to previous diagnostic in buffer

keymap.set("n", "]d", vim.diagnostic.goto_next) -- jump to next diagnostic in buffer

keymap.set("n", "K", vim.lsp.buf.hover) -- show documentation for what is under cursor

keymap.set("n", "<leader>tf", ":Telescope lsp_document_symbols<CR>", { desc = "Search function or methdos in file" })

keymap.set("n", "<leader>be", "<cmd>Lspsaga show_workspace_diagnostics<CR>", { desc = "Show workspace diagnostics" })
keymap.set("n", "<leader>le", "<cmd>Lspsaga show_buf_diagnostics<CR>", { desc = "Show buffer diagnostics" })

keymap.set("n", "<leader>rn", vim.lsp.buf.rename) -- smart rename

-- Copilot chat
keymap.set("n", "<leader>cp", "<cmd>CopilotChat<CR>") -- smart rename
keymap.set("n", "<leader>cq", "<cmd>CopilotChatClose<CR>") -- smart rename

-- window management
keymap.set("n", "<leader>vs", "<C-w>v") -- split window vertically
keymap.set("n", "<leader>hs", "<C-w>s") -- split window horizontally
keymap.set("n", "<leader>es", "<C-w>=") -- make split windows equal width & height
keymap.set("n", "<leader>xs", ":close<CR>") -- close current split window

keymap.set('n', '<leader>jj', '<cmd>normal 20j<CR>')
keymap.set('n', '<leader>kk', '<cmd>normal 20k<CR>')


keymap.set("n", "<leader>cf", "<cmd>CopilotChatFix<CR>", { noremap = true, silent = true })
