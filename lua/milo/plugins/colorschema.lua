return {
  "Mofiqul/vscode.nvim",
  --"catppuccin/nvim",
  --"sainnhe/gruvbox-material",
  --"catppuccin/nvim",

  --
  --'olimorris/onedarkpro.nvim',
  --'navarasu/onedark.nvim',
  --"bluz71/vim-moonfly-colors",
  --"folke/tokyonight.nvim",
  --"askfiy/visual_studio_code",  -- Asegúrate de que esto esté bien colocado

  config = function()
    -- Si tienes configuraciones comentadas, asegúrate de que no interfieran con la estructura
    --local bg = "#081101"

    -- Correcto: llamada al esquema de colores
    --vim.cmd("colorscheme tokyonight-night")
    vim.cmd("colorscheme vscode")
    --vim.cmd("colorscheme catppuccin-mocha")
    -- require("catppuccin").setup({
    --   flavour = "mocha", -- latte, frappe, macchiato, mocha
    --   -- background = { -- options: dark, light
    --   --   light = "latte",
    --   --   dark = "mocha",
    --   -- },
    --   -- transparent_background = true,
    --   -- term_colors = true,
    --   -- styles = {
    --   --   comments = { "italic" },
    --   --   conditionals = { "italic" },
    --   --   loops = { "italic" },
    --   --   functions = { "italic" },
    --   --   keywords = { "italic" },
    --   --   strings = { "NONE" },
    --   --   variables = { "NONE" },
    --   --   numbers = { "NONE" },
    --   --   booleans = { "NONE" },
    --   --   properties = { "NONE" },
    --   --   types = { "NONE" },
    --   -- },
    --   color_overrides = {
    --     mocha = {
    --       base = bg,
    --       mantle = bg,
    --       crust = bg,
    --       --base = "#000000",
    --       --mantle = "#000000",
    --       --crust = "#000000",
    --     },
    --   },
    -- })


    --vim.cmd("colorscheme catppuccin-mocha")


    -- -- -- Folder of nerdtree
    vim.cmd [[highlight NvimTreeFolderIcon guifg=#E5BE30]]
    vim.cmd [[highlight NvimTreeFolderName guifg=#DCDFF2]]
    vim.cmd [[highlight NvimTreeFolderNew guifg=#DCDFF2]]
    vim.cmd [[highlight NvimTreeIndentMarker guifg=#E5BE30]]
    --vim.cmd [[highlight NvimTreeCursorLine guifg=#8FECFC]]

    --Telescope color like tokyonight theme
    vim.cmd([[hi TelescopePromptTitle guifg=#ff9e64]])
    vim.cmd([[hi TelescopePromptBorder guifg=#ff9e64]])
    vim.cmd([[hi TelescopeBorder guifg=#D9EDBF]])

    -- Markdown
    -- vim.cmd [[hi @markup.heading.1.markdown cterm=bold gui=bold guifg=#41B06E]]
    -- vim.cmd [[hi @markup.heading.2.markdown cterm=bold gui=bold guifg=#e0af68]]
    --
    -- WarningMsg
    vim.cmd([[ highlight WarningMsg guifg=#8FECFC ]])

    vim.cmd([[highlight @variable.builtin guifg=#d86fc2 ]]) --Ej: console
    -- 06be9a
  end,
}
