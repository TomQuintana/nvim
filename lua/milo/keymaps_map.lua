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

  -- TMUX INTEGRATION
  { key = "<C-m>",       desc = "Tmux navigate right" },

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

  -- TELESCOPE - SEARCH & FIND
  { key = "<leader>tf",  desc = "Search function or methods in file" },
  { key = "<leader>gb",  desc = "Git branches with actions" },

  -- GIT INTEGRATION
  { key = "<leader>gn",  desc = "Git - Next hunk" },
  { key = "<leader>gp",  desc = "Git - Previous hunk" },

  -- DAP (DEBUG ADAPTER PROTOCOL)
  { key = "<leader>db",  desc = "DAP - Toggle Breakpoint" },
  { key = "<leader>dc",  desc = "DAP - Continue" },
  { key = "<leader>do",  desc = "DAP - Step Over" },
  { key = "<leader>di",  desc = "DAP - Step Into" },
  { key = "<leader>dO",  desc = "DAP - Step Out" },
  { key = "<leader>dq",  desc = "DAP - Terminate" },
  { key = "<leader>du",  desc = "DAP - UI" },

  -- FORMATTING & LINTING
  { key = "<leader>fa",  desc = "Format - All" },
  { key = "<leader>l",   desc = "Linters" },

  -- COPILOT CHAT
  { key = "<leader>cp",  desc = "Open copilot chat" },
  { key = "<leader>cq",  desc = "Close copilot chat" },
  { key = "<leader>cf",  desc = "Fix with copilot" },
  { key = "<leader>ccm", desc = "CopilotChat - Commit" },
  { key = "<leader>ccf", desc = "CopilotChat - Fix" },

  -- AVANTE
  { key = "<leader>aq",  desc = "Avante - Edit" },

  -- KEYMAPS HELPER
  { key = "<leader>kh",  desc = "Keymaps Helper" },
}
