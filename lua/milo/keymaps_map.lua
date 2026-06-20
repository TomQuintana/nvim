-- Keymaps list
return {
  -- GENERAL FILE OPERATIONS
  { key = "<leader>w",   desc = "Save file" },
  { key = "<leader>q",   desc = "Quit" },
  { key = "<leader>wq",  desc = "Save and quit" },
  { key = "<leader>fw",  desc = "Force save" },

  -- INSERT MODE & NAVIGATION
  { key = "jk",          desc = "Exit insert mode" },
  { key = "<leader>jj",  desc = "Jump down 20 lines" },
  { key = "<leader>kk",  desc = "Jump up 20 lines" },

  -- BUFFER MANAGEMENT
  { key = "<leader>ba",  desc = "Close all buffers" },
  { key = "<leader>m",   desc = "Previous buffer" },
  { key = "<leader>s",   desc = "Next buffer" },
  { key = "<leader>bc",  desc = "Close all buffers except current" },
  { key = "<leader>lb",  desc = "Find buffers" },
  { key = "<leader>bf",  desc = "Pick buffer to close" },

  -- SEARCH & HIGHLIGHTS
  { key = "<leader>nh",  desc = "Clear search highlights" },

  -- WINDOW MANAGEMENT
  { key = "<leader>vs",  desc = "Split window vertically" },
  { key = "<leader>hs",  desc = "Split window horizontally" },
  { key = "<leader>es",  desc = "Make split windows equal" },
  { key = "<leader>xs",  desc = "Close current split window" },
  { key = "<C-Up>",      desc = "Increase window height" },
  { key = "<C-Down>",    desc = "Decrease window height" },
  { key = "<C-Left>",    desc = "Decrease window width" },
  { key = "<C-Right>",   desc = "Increase window width" },
  { key = "<leader>+",   desc = "Increase width by 5" },
  { key = "<leader>-",   desc = "Decrease width by 5" },

  -- SPLIT NAVIGATION (vim-tmux-navigator)
  { key = "<C-h>",       desc = "Move to left split" },
  { key = "<C-j>",       desc = "Move to bottom split" },
  { key = "<C-k>",       desc = "Move to top split" },
  { key = "<C-l>",       desc = "Move to right split" },

  -- PLUGIN MANAGEMENT
  { key = "<leader>lz",  desc = "Open Lazy" },

  -- LSP - CODE NAVIGATION
  { key = "fd",          desc = "Peek definition" },
  { key = "gf",          desc = "Find references and definitions" },
  { key = "gd",          desc = "Go to definition" },
  { key = "K",           desc = "Show documentation" },

  -- LSP - CODE ACTIONS & REFACTORING
  { key = "<leader>ca",  desc = "Code actions" },
  { key = "<leader>rn",  desc = "Smart rename" },

  -- LSP - DIAGNOSTICS
  { key = "[d",          desc = "Previous diagnostic" },
  { key = "]d",          desc = "Next diagnostic" },
  { key = "<leader>be",  desc = "Show workspace diagnostics" },
  { key = "<leader>le",  desc = "Show buffer diagnostics" },
  { key = "<leader>d",   desc = "Show cursor diagnostics" },

  -- TELESCOPE - FILE BROWSER & SEARCH
  { key = "<leader>fe",  desc = "Find .env files" },
  { key = "<leader>ff",  desc = "Fuzzy find files in cwd" },
  { key = "<leader>ts",  desc = "Find string in cwd (live grep)" },
  { key = "<leader>fc",  desc = "Find string under cursor in cwd" },
  { key = "<leader>td",  desc = "Find all todos" },
  { key = "<leader>tt",  desc = "Find all treesitter symbols" },
  { key = "<leader>te",  desc = "Show errors in buffer" },
  { key = "<leader>tr",  desc = "Show errors in all project" },
  { key = "<leader>tf",  desc = "Search function or methods in file" },
  { key = "<leader>gb",  desc = "Git branches with actions" },

  -- GIT INTEGRATION
  { key = "<leader>gg",  desc = "LazyGit" },
  { key = "<leader>gn",  desc = "Git - Next hunk" },
  { key = "<leader>gp",  desc = "Git - Previous hunk" },
  { key = "<leader>co",  desc = "Git Conflict - Choose ours" },
  { key = "<leader>ct",  desc = "Git Conflict - Choose theirs" },
  { key = "<leader>cb",  desc = "Git Conflict - Choose both" },
  { key = "<leader>c0",  desc = "Git Conflict - Choose none" },
  { key = "]x",          desc = "Git Conflict - Next conflict" },
  { key = "[x",          desc = "Git Conflict - Previous conflict" },

-- FORMATTING & LINTING
  { key = "<leader>fa",  desc = "Format - All" },
  { key = "<leader>l",   desc = "Linters" },

  -- COMPLETION (Insert mode)
  { key = "<C-k>",       desc = "Previous suggestion (insert mode)" },
  { key = "<Tab>",       desc = "Next suggestion (insert mode)" },
  { key = "<C-Space>",   desc = "Show completion suggestions (insert mode)" },
  { key = "<CR>",        desc = "Confirm selection (insert mode)" },

  -- DIFFVIEW (Git diff viewer)
  { key = "<tab>",       desc = "Diffview - Next file" },
  { key = "<s-tab>",     desc = "Diffview - Previous file" },
  { key = "[x",          desc = "Diffview - Previous conflict" },
  { key = "]x",          desc = "Diffview - Next conflict" },
  { key = "<leader>co",  desc = "Diffview - Choose OURS" },
  { key = "<leader>ct",  desc = "Diffview - Choose THEIRS" },
  { key = "<leader>cb",  desc = "Diffview - Choose BASE" },
  { key = "dx",          desc = "Diffview - Delete conflict region" },
  { key = "<leader>e",   desc = "Diffview - Focus files panel" },
  { key = "<leader>b",   desc = "Diffview - Toggle files panel" },
  { key = "g<C-x>",      desc = "Diffview - Cycle layout" },

  -- NEO-TREE FILE EXPLORER
  { key = "<leader>ee",  desc = "Neo-tree - Toggle sidebar" },
  { key = "<leader>ef",  desc = "Neo-tree - Reveal current file" },
  { key = "<leader>eg",  desc = "Neo-tree - Git status" },
  { key = "<leader>eb",  desc = "Neo-tree - Buffers" },

  -- KEYMAPS HELPER
  { key = "<leader>hk",  desc = "Keymaps Helper" },

  -- NVIM TAB MANAGEMENT
  { key = "<leader>tn",  desc = "New tab" },
  { key = "<leader>tx",  desc = "Close tab" },
  { key = "<Tab>",       desc = "Next tab" },
  { key = "<S-Tab>",     desc = "Previous tab" },
  { key = "<leader>1",   desc = "Go to tab 1" },
  { key = "<leader>2",   desc = "Go to tab 2" },
  { key = "<leader>3",   desc = "Go to tab 3" },
  { key = "<leader>4",   desc = "Go to tab 4" },
  { key = "<leader>5",   desc = "Go to tab 5" },
  { key = "<leader>6",   desc = "Go to tab 6" },
  { key = "<leader>7",   desc = "Go to tab 7" },
  { key = "<leader>8",   desc = "Go to tab 8" },
  { key = "<leader>9",   desc = "Go to tab 9" },

  -- KITTY TERMINAL - TABS
  { key = "<cmd+t>",          desc = "Kitty - New tab (cwd)" },
  { key = "<cmd+w>",          desc = "Kitty - Close tab" },
  { key = "<cmd+1>",          desc = "Kitty - Go to tab 1" },
  { key = "<cmd+2>",          desc = "Kitty - Go to tab 2" },
  { key = "<cmd+3>",          desc = "Kitty - Go to tab 3" },
  { key = "<cmd+4>",          desc = "Kitty - Go to tab 4" },
  { key = "<cmd+5>",          desc = "Kitty - Go to tab 5" },
  { key = "<cmd+6>",          desc = "Kitty - Go to tab 6" },
  { key = "<cmd+7>",          desc = "Kitty - Go to tab 7" },
  { key = "<cmd+8>",          desc = "Kitty - Go to tab 8" },
  { key = "<cmd+9>",          desc = "Kitty - Go to tab 9" },

  -- KITTY TERMINAL - PANELS (SPLITS)
  { key = "<cmd+d>",          desc = "Kitty - New panel/split (cwd)" },
  { key = "<cmd+shift+h>",    desc = "Kitty - Navigate panel left" },
  { key = "<cmd+shift+l>",    desc = "Kitty - Navigate panel right" },
  { key = "<cmd+shift+k>",    desc = "Kitty - Navigate panel up" },
  { key = "<cmd+shift+j>",    desc = "Kitty - Navigate panel down" },
  { key = "<cmd+shift+w>",    desc = "Kitty - Close panel" },

  -- KITTY TERMINAL - LAYOUT & RESIZE
  { key = "<cmd+shift+enter>", desc = "Kitty - Toggle maximize panel" },
  { key = "<cmd+left>",       desc = "Kitty - Resize panel narrower" },
  { key = "<cmd+right>",      desc = "Kitty - Resize panel wider" },
  { key = "<cmd+up>",         desc = "Kitty - Resize panel taller" },
  { key = "<cmd+down>",       desc = "Kitty - Resize panel shorter" },

  -- KITTY TERMINAL - OS WINDOWS
  { key = "<cmd+n>",          desc = "Kitty - New OS window (cwd)" },

  -- DAP (DEBUG ADAPTER PROTOCOL) - Commented out
  -- { key = "<leader>db",  desc = "DAP - Toggle Breakpoint" },
  -- { key = "<leader>dc",  desc = "DAP - Continue" },
  -- { key = "<leader>do",  desc = "DAP - Step Over" },
  -- { key = "<leader>di",  desc = "DAP - Step Into" },
  -- { key = "<leader>dO",  desc = "DAP - Step Out" },
  -- { key = "<leader>dq",  desc = "DAP - Terminate" },
  -- { key = "<leader>du",  desc = "DAP - UI" },

}
