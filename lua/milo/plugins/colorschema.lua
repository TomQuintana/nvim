return {
  {
    "ellisonleao/gruvbox.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("gruvbox").setup({
        contrast = "hard",
        italic = {
          strings   = true,
          emphasis  = true,
          comments  = true,
          operators = false,
          folds     = true,
        },
        bold = true,
        -- rojo → naranja retro, variables blancas → aqua/celeste retro
        palette_overrides = {
          bright_red  = "#D3869B", -- rosa/púrpura claro (reemplaza rojo brillante)
          neutral_red = "#B16286", -- púrpura retro (reemplaza rojo neutro)
        },
        overrides = {
          -- variables: de blanco/amarillo → aqua retro
          -- ["@variable"]         = { fg = "#8EC07C", italic = false },
          -- ["@variable.builtin"] = { fg = "#83A598", italic = true },
          -- Identifier            = { fg = "#8EC07C" },
          -- keywords en púrpura retro
          ["@keyword"]          = { fg = "#B16286", bold = true },
          Statement             = { fg = "#B16286", bold = true },
          -- headings con colores de Tokyo Night night
          ["@markup.heading.1.markdown"] = { fg = "#7aa2f7", bold = true },
          ["@markup.heading.2.markdown"] = { fg = "#bb9af7", bold = true },
          ["@markup.heading.3.markdown"] = { fg = "#e0af68", bold = true },
          markdownH1 = { fg = "#7aa2f7", bold = true },
          markdownH2 = { fg = "#bb9af7", bold = true },
          markdownH3 = { fg = "#e0af68", bold = true },
          -- headings h4-h6
          ["@markup.heading.4.markdown"] = { fg = "#2ac3de", bold = true },
          ["@markup.heading.5.markdown"] = { fg = "#9ece6a", bold = true },
          ["@markup.heading.6.markdown"] = { fg = "#73daca", bold = true },
          markdownH4 = { fg = "#2ac3de", bold = true },
          markdownH5 = { fg = "#9ece6a", bold = true },
          markdownH6 = { fg = "#73daca", bold = true },
          -- inline code y bloques de código
          ["@markup.raw.markdown_inline"] = { fg = "#9ece6a", bg = "#1e2030" },
          ["@markup.raw.block"]           = { fg = "#9ece6a" },
          markdownCode                    = { fg = "#9ece6a", bg = "#1e2030" },
          markdownCodeBlock               = { fg = "#9ece6a" },
          -- links
          ["@markup.link"]       = { fg = "#7aa2f7", underline = true },
          ["@markup.link.url"]   = { fg = "#73daca", underline = true },
          ["@markup.link.label"] = { fg = "#7dcfff" },
          markdownLinkText       = { fg = "#7aa2f7", underline = true },
          markdownUrl            = { fg = "#73daca", underline = true },
          -- bold e italic
          ["@markup.strong"]   = { fg = "#e0af68", bold = true },
          ["@markup.italic"]   = { fg = "#bb9af7", italic = true },
          markdownBold         = { fg = "#e0af68", bold = true },
          markdownItalic       = { fg = "#bb9af7", italic = true },
          -- listas y checkboxes
          ["@markup.list"]           = { fg = "#7aa2f7" },
          ["@markup.list.checked"]   = { fg = "#9ece6a" },
          ["@markup.list.unchecked"] = { fg = "#565f89" },
          -- blockquotes y separadores
          ["@markup.quote"] = { fg = "#7dcfff", italic = true },
          markdownBlockquote = { fg = "#7dcfff", italic = true },
        },
      })
      vim.cmd("colorscheme gruvbox")
    end,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    --priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "mocha", -- mocha es el flavour más oscuro de catppuccin
        color_overrides = {
          mocha = {
            base   = "#161616", -- VSCode dark, más oscuro
            mantle = "#121212",
            crust  = "#0d0d0d",
            red    = "#cba6f7", -- mauve en lugar de rojo
            maroon = "#fab387", -- peach en lugar de maroon
          },
        },
        -- markdown con paleta de Tokyo Night (night)
        custom_highlights = function(_colors)
          return {
            -- headings h1-h3
            ["@markup.heading.1.markdown"] = { fg = "#7aa2f7", bold = true },
            ["@markup.heading.2.markdown"] = { fg = "#bb9af7", bold = true },
            ["@markup.heading.3.markdown"] = { fg = "#e0af68", bold = true },
            markdownH1 = { fg = "#7aa2f7", bold = true },
            markdownH2 = { fg = "#bb9af7", bold = true },
            markdownH3 = { fg = "#e0af68", bold = true },
            -- headings h4-h6
            ["@markup.heading.4.markdown"] = { fg = "#2ac3de", bold = true },
            ["@markup.heading.5.markdown"] = { fg = "#9ece6a", bold = true },
            ["@markup.heading.6.markdown"] = { fg = "#73daca", bold = true },
            markdownH4 = { fg = "#2ac3de", bold = true },
            markdownH5 = { fg = "#9ece6a", bold = true },
            markdownH6 = { fg = "#73daca", bold = true },
            -- inline code y bloques de código
            ["@markup.raw.markdown_inline"] = { fg = "#9ece6a", bg = "#1e2030" },
            ["@markup.raw.block"]           = { fg = "#9ece6a" },
            markdownCode                    = { fg = "#9ece6a", bg = "#1e2030" },
            markdownCodeBlock               = { fg = "#9ece6a" },
            -- links
            ["@markup.link"]       = { fg = "#7aa2f7", underline = true },
            ["@markup.link.url"]   = { fg = "#73daca", underline = true },
            ["@markup.link.label"] = { fg = "#7dcfff" },
            markdownLinkText       = { fg = "#7aa2f7", underline = true },
            markdownUrl            = { fg = "#73daca", underline = true },
            -- bold e italic
            ["@markup.strong"]   = { fg = "#e0af68", bold = true },
            ["@markup.italic"]   = { fg = "#bb9af7", italic = true },
            markdownBold         = { fg = "#e0af68", bold = true },
            markdownItalic       = { fg = "#bb9af7", italic = true },
            -- listas y checkboxes
            ["@markup.list"]           = { fg = "#7aa2f7" },
            ["@markup.list.checked"]   = { fg = "#9ece6a" },
            ["@markup.list.unchecked"] = { fg = "#565f89" },
            -- blockquotes
            ["@markup.quote"]  = { fg = "#7dcfff", italic = true },
            markdownBlockquote = { fg = "#7dcfff", italic = true },
          }
        end,
      })
      --vim.cmd("colorscheme catppuccin")
    end,
  },
  {
    "folke/tokyonight.nvim",
    lazy = true,
    --priority = 900,
    config = function()
      require("tokyonight").setup({
        style = "night",
        transparent = false,
        terminal_colors = true,
        styles = {
          comments = { italic = true },
          keywords = { bold = true },
          functions = {},
          variables = {},
        },
      })
      -- vim.cmd("colorscheme tokyonight")
    end,
  },
  {
    "Mofiqul/vscode.nvim",
    lazy = true,
    priority = 900,
    config = function()
      require("vscode").setup({
        style = "dark",
        transparent = false,
        italic_comments = true,
        disable_nvimtree_bg = true,
        color_overrides = {
          vscLineNumber = "#808080",
        },
        group_overrides = {
          DiagnosticSignError = { fg = "#f44747", bg = "NONE" },
          DiagnosticSignWarn  = { fg = "#ff8800", bg = "NONE" },
          DiagnosticSignInfo  = { fg = "#4fc1ff", bg = "NONE" },
          DiagnosticSignHint  = { fg = "#4ec9b0", bg = "NONE" },
          GitSignsAdd    = { fg = "#4ec9b0", bg = "NONE" },
          GitSignsChange = { fg = "#569cd6", bg = "NONE" },
          GitSignsDelete = { fg = "#f44747", bg = "NONE" },
          MatchParen = { fg = "#ffd700", bold = true, underline = true },
        },
      })
      -- vim.cmd("colorscheme vscode")
    end,
  },
}
