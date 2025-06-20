return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "rcarriga/nvim-dap-ui",
      "mfussenegger/nvim-dap-python", -- Asegúrate de que este plugin esté instalado
      "theHamsta/nvim-dap-virtual-text",
    },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")
      local dap_python = require("dap-python")

      -- *** Aquí cargas los args de debugpy en la configuración de nvim-dap ***
      dap.adapters.python = {
        type = "executable",
        command = 'python3', -- O 'python', o vim.fn.expand("~/.local/share/nvim/mason/bin/debugpy"), etc.
        args = { '-m', 'debugpy.adapter' },
      }

      dap_python.setup("python") -- Esto configurará las 'dap.configurations.python' predeterminadas

      -- Configuración de DAP UI
      require("dapui").setup({
        icons = { expanded = "▾", collapsed = "▸" },
        layouts = {
          {
            elements = {
              { id = "scopes", size = 0.25 },
              { id = "breakpoints", size = 0.25 },
              { id = "stacks", size = 0.25 },
              { id = "watches", size = 0.25 },
            },
            size = 40,
            position = "left",
          },
          {
            elements = { { id = "repl", size = 0.5 }, { id = "console", size = 0.5 } },
            size = 10,
            position = "bottom",
          },
        },
      })

      require("nvim-dap-virtual-text").setup({
        enabled = true,
        commented = true,
      })

      -- Definición de los signos de los breakpoints
      vim.fn.sign_define("DapBreakpoint", {
        text = "",
        texthl = "DiagnosticSignError",
        linehl = "",
        numhl = "",
      })

      vim.fn.sign_define("DapBreakpointRejected", {
        text = "", -- or "❌"
        texthl = "DiagnosticSignError",
        linehl = "",
        numhl = "",
      })

      vim.fn.sign_define("DapStopped", {
        text = "", -- or "→"
        texthl = "DiagnosticSignWarn",
        linehl = "Visual",
        numhl = "DiagnosticSignWarn",
      })

      -- Abrir/cerrar DAP UI automáticamente
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end

      local opts = { noremap = true, silent = true }

      -- Mapeos de teclas para DAP
      vim.keymap.set("n", "<leader>db", function()
        dap.toggle_breakpoint()
      end, opts)

      vim.keymap.set("n", "<leader>dc", function()
        dap.continue()
      end, opts)

      vim.keymap.set("n", "<leader>do", function()
        dap.step_over()
      end, opts)

      vim.keymap.set("n", "<leader>di", function()
        dap.step_into()
      end, opts)

      vim.keymap.set("n", "<leader>dO", function()
        dap.step_out()
      end, opts)

      vim.keymap.set("n", "<leader>dq", function()
        require("dap").terminate()
      end, opts)

      vim.keymap.set("n", "<leader>du", function()
        dapui.toggle()
      end, opts)
    end,
  },
}
