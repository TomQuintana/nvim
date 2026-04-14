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
  { key = "<leader>cb",  desc = "Close all buffers" },
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

  -- TMUX INTEGRATION
  { key = "<C-m>",       desc = "Tmux navigate right" },
  { key = "<C-h>",       desc = "Tmux navigate left" },
  { key = "<C-j>",       desc = "Tmux navigate down" },
  { key = "<C-k>",       desc = "Tmux navigate up" },
  { key = "<C-l>",       desc = "Tmux navigate right" },
  { key = "<C-p> |",     desc = "Tmux split vertical" },
  { key = "<C-p> -",     desc = "Tmux split horizontal" },
  { key = "<C-p> M",     desc = "Tmux auto-maximize ON" },
  { key = "<C-p> m",     desc = "Tmux auto-maximize OFF" },
  { key = "<C-p> z",     desc = "Tmux toggle auto-maximize" },
  { key = "<C-p> r",     desc = "Tmux reload config" },

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

  -- TERMINAL FLOATING WINDOW
  { key = "<leader>at",  desc = "Terminal - Select" },
  { key = "<C-`>",       desc = "Toggle terminal" },
  { key = "<C-h>",       desc = "Terminal - Navigate left (terminal mode)" },
  { key = "<C-l>",       desc = "Terminal - Navigate right (terminal mode)" },
  { key = "<C-j>",       desc = "Terminal - Navigate down (terminal mode)" },
  { key = "<C-k>",       desc = "Terminal - Navigate up (terminal mode)" },
  { key = "<Esc>",       desc = "Exit terminal insert mode" },
  { key = "<C-]>",       desc = "Exit terminal insert mode (alternate)" },

  -- KEYMAPS HELPER
  { key = "<leader>hk",  desc = "Keymaps Helper" },

  -- DAP (DEBUG ADAPTER PROTOCOL) - Commented out
  -- { key = "<leader>db",  desc = "DAP - Toggle Breakpoint" },
  -- { key = "<leader>dc",  desc = "DAP - Continue" },
  -- { key = "<leader>do",  desc = "DAP - Step Over" },
  -- { key = "<leader>di",  desc = "DAP - Step Into" },
  -- { key = "<leader>dO",  desc = "DAP - Step Out" },
  -- { key = "<leader>dq",  desc = "DAP - Terminate" },
  -- { key = "<leader>du",  desc = "DAP - UI" },

}
