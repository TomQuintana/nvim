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


opt.smoothscroll = true     -- Smooth scrolling (Neovim 0.10+)
opt.scrolloff = 8           -- Mantiene 8 líneas de margen al final/inicio del archivo

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

-- Performance optimizations
opt.updatetime = 200        -- Faster CursorHold events (default 4000ms)
opt.timeoutlen = 300        -- Faster mapped sequence timeout
opt.lazyredraw = false      -- Keep false for compatibility with Noice
opt.synmaxcol = 300         -- Limit syntax highlighting width
opt.hidden = true           -- Allow switching buffers without saving
opt.swapfile = false        -- No swap files
opt.backup = false          -- No backup files
opt.undofile = true         -- Persistent undo
