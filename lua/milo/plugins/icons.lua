return {
  "nvim-tree/nvim-web-devicons",
  config = function()
    require("nvim-web-devicons").set_icon({
      [".gitignore"] = {
        icon = "",
        color = "#F9F2F2",
        cterm_color = "65",
        name = "Git",
      },
      ["package.json"] = {
        icon = " ",
        color = "#98B45D",
        cterm_color = "65",
        name = "Package",
      },
      ["test.js"] = {
        icon = "",
        color = "#F1E723",
        cterm_color = "65",
        name = "TestJS",
      },
      -- ["js"] = {
      --   icon = "",
      --   color = "#E8D51E",
      --   cterm_color = "65",
      --   name = "JS",
      -- },
      [".eslintrc.json"] = {
        icon = "",
        color = "#5988CF",
        cterm_color = "65",
        name = "Eslint",
      },
      [".eslintignore"] = {
        icon = " ",
        color = "#F9F2F2",
        cterm_color = "65",
        name = "Eslintignore",
      },
      ["package-lock.json"] = {
        icon = "",
        color = "#7a0d21",
        name = "Package",
      },
      [".eslintrc.cjs"] = {
        icon = "",
        color = "#5988CF",
        cterm_color = "65",
        name = "Eslint",
      },
      [".lintstagedrc"] = {
        icon = "",
        color = "#6d8086",
        cterm_color = "65",
        name = "lin",
      },
      ["makefile"] = {
        icon = "",
        color = "#E56D15",
        cterm_color = "65",
        name = "Makefile",
      },
      -- ["ts"] = {
      --   icon = "",
      --   color = "#519aba",
      --   cterm_color = "65",
      --   name = "TS",
      -- },
      ["sol"] = {
        icon = "",
        color = "#515D70",
        cterm_color = "74",
        name = "Solidity",
      },
      ["readme.md"] = {
        icon = "",
        cterm_color = "74",
        name = "README",
      },
      ["ruff.toml"] = {
        icon = "󰰤",
        cterm_color = "65",
        name = "README",
      },
      -- ["py"] = {
      --   icon = "",
      --   color = "#4faef7",
      --   cterm_color = "65",
      --   name = "python",
      -- },
    })

    require("nvim-web-devicons").set_default_icon("", "#41535b")
    --require("nvim-web-devicons").set_default_icon("", "#0078D4")
    --require("nvim-web-devicons").set_default_icon('󰂺', '#41535b')
    require("nvim-web-devicons").set_default_icon("", "#7a0d21")
    require("nvim-web-devicons").set_default_icon("", "#e37933")
    require("nvim-web-devicons").set_default_icon("js", "#cbcb41")
    require("nvim-web-devicons").set_default_icon(" ", "#519aba")
    require("nvim-web-devicons").set_default_icon("󰞻", "#519aba")
    --require("nvim-web-devicons").set_default_icon('', '#6d8086')
    --require("nvim-web-devicons").set_default_icon('', '#519aba')
    --require("nvim-web-devicons").set_default_icon('', '#519aba')
  end,
}
