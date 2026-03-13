return {
  dir = vim.fn.stdpath("config"),
  name = "terminal-selector",
  dependencies = { "akinsho/toggleterm.nvim" },
  keys = {
    { "<leader>at", desc = "Select terminal" },
    { "<leader>et", desc = "Server terminal" },
    { "<leader>cn", desc = "New terminal" },
  },
  config = function()
    local Terminal = require("toggleterm.terminal").Terminal

    local float_opts = {
      border = "curved",
      width = 120,
      height = 50,
    }

    -- Registry de terminales
    local terminals = {}

    local function register_terminal(name, term)
      table.insert(terminals, { name = name, term = term })
    end

    -- Server terminal
    local server_term = Terminal:new({
      direction = "float",
      float_opts = float_opts,
      display_name = "Server",
      on_open = function()
        vim.cmd("startinsert!")
      end,
    })
    register_terminal(" Server", server_term)

    -- Cierra todas las terminales abiertas excepto la indicada
    local function close_others(except_name)
      for _, t in ipairs(terminals) do
        if t.name ~= except_name and t.term:is_open() then
          t.term:close()
        end
      end
    end

    -- Nueva terminal
    local term_count = 0
    local function new_terminal()
      term_count = term_count + 1
      local name = " Terminal " .. term_count
      local new_term = Terminal:new({
        direction = "float",
        float_opts = float_opts,
        display_name = name,
        on_open = function()
          vim.cmd("startinsert!")
        end,
      })
      register_terminal(name, new_term)
      close_others(name)
      new_term:open()
    end

    -- Toggle functions individuales
    local function server_term_toggle()
      close_others(" Server")
      server_term:toggle()
    end

    -- Selector de terminales con soporte de click
    local function select_terminal()
      local names = {}
      for _, t in ipairs(terminals) do
        local indicator = t.term:is_open() and "● " or "  "
        table.insert(names, indicator .. t.name)
      end
      table.insert(names, "  + Nueva terminal")

      local buf = vim.api.nvim_create_buf(false, true)
      vim.api.nvim_buf_set_lines(buf, 0, -1, false, names)
      vim.bo[buf].modifiable = false
      vim.bo[buf].buftype = "nofile"

      local width = 36
      local height = #names
      local row = math.floor((vim.o.lines - height) / 2)
      local col = math.floor((vim.o.columns - width) / 2)

      local win = vim.api.nvim_open_win(buf, true, {
        relative = "editor",
        row = row,
        col = col,
        width = width,
        height = height,
        style = "minimal",
        border = "rounded",
        title = " Terminales ",
        title_pos = "center",
      })
      vim.wo[win].cursorline = true

      local function confirm()
        local line = vim.api.nvim_win_get_cursor(win)[1]
        local choice = names[line]
        vim.api.nvim_win_close(win, true)

        if choice == "  + Nueva terminal" then
          new_terminal()
          return
        end

        local selected_name = choice:sub(3)
        for _, t in ipairs(terminals) do
          if t.name == selected_name then
            close_others(t.name)
            t.term:open()
            return
          end
        end
      end

      local function close_win()
        vim.api.nvim_win_close(win, true)
      end

      local opts = { buffer = buf, nowait = true, silent = true }
      vim.keymap.set("n", "<CR>", confirm, opts)
      vim.keymap.set("n", "<LeftRelease>", confirm, opts)
      vim.keymap.set("n", "<2-LeftMouse>", confirm, opts)
      vim.keymap.set("n", "<Esc>", close_win, opts)
      vim.keymap.set("n", "q", close_win, opts)
    end

    -- Keymaps (normal mode)
    vim.keymap.set("n", "<leader>at", select_terminal, { desc = "Select Terminal" })

    vim.keymap.set("n", "<leader>et", server_term_toggle, { desc = "Toggle Server Terminal" })
    vim.keymap.set("n", "<leader>cn", new_terminal, { desc = "New Terminal" })

    -- Selector accesible desde dentro de una terminal
    vim.keymap.set("t", "<C-t>", function()
      vim.cmd("stopinsert")
      select_terminal()
    end, { desc = "Select Terminal" })
  end,
}
