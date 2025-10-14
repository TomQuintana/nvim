return {
  "greggh/claude-code.nvim",
  event = "VeryLazy",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  opts = {
    window = {
      position = "float",
      enter_insert = true,
      float = {
        width = "60%",        -- Ancho más angosto para panel lateral
        height = "95%",       -- Altura casi completa
        row = 1,              -- Empieza desde arriba
        col = "100%",         -- Posicionado a la derecha
        border = "rounded",
      },
    },
    refresh = {
      enable = true,
      show_notifications = true,
    },
    git = {
      use_git_root = true,
    },
    keymaps = {
      toggle = {
        normal = "<C-,>",
        terminal = "<C-,>",
      },
    },
  },
}
