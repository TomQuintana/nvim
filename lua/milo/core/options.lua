local opt = vim.opt -- for conciseness

opt.title = true
opt.titlestring = "%{fnamemodify(getcwd(), ':t')}"

--opt.spell = true
--opt.spelllang = { 'en_us' }

opt.mouse = 'a'

-- Forzar la eliminación de la opción `c` para todos los tipos de archivo
vim.cmd("autocmd FileType * setlocal formatoptions-=c")
vim.cmd("autocmd FileType * setlocal formatoptions-=r")
vim.cmd("autocmd FileType * setlocal formatoptions-=o")


-- opt.scroll = 3 -- Desplaza 3 líneas por scroll
-- opt.scrolloff = 5 -- Mantiene 5 líneas de margen al final/inicio del archivo

-- line numbers 
opt.relativenumber = true
opt.number = true


-- tabs & indentation 
opt.tabstop = 2 -- prettier by default
opt.autoindent = true
opt.smartindent = true
opt.expandtab = true
opt.shiftwidth = 2
opt.softtabstop = 2
opt.wrap = false -- No Wrap lines

opt.cursorline = true

opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

opt.clipboard:append("unnamedplus")
