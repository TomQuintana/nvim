local opt = vim.opt -- for conciseness

vim.opt.title = true
vim.opt.titlestring = "%{fnamemodify(getcwd(), ':t')}"

--vim.opt.spell = true
--opt.spelllang = { 'en_us' }

opt.mouse = 'a'

-- Forzar la eliminación de la opción `c` para todos los tipos de archivo
vim.cmd("autocmd FileType * setlocal formatoptions-=c")
vim.cmd("autocmd FileType * setlocal formatoptions-=r")
vim.cmd("autocmd FileType * setlocal formatoptions-=o")


-- vim.o.scroll = 3 -- Desplaza 3 líneas por scroll
-- vim.o.scrolloff = 5 -- Mantiene 5 líneas de margen al final/inicio del archivo

-- line numbers 
opt.relativenumber = true
opt.number = true

-- tabs & indentation 
opt.tabstop = 2 -- prettier by default
vim.autoindent = true
vim.opt.smartindent = true
opt.shiftwidth = 2
opt.expandtab = true
vim.shiftwidth = 2
vim.wrap = false -- No Wrap lines

opt.cursorline = true

opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

opt.clipboard:append("unnamedplus")
