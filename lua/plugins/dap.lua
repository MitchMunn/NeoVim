return {
  -- For C/C++
  {
    "mfussenegger/nvim-dap",
    optional = true,
    dependencies = {
      -- Ensure C/C++ debugger is installed
      "williamboman/mason.nvim",
      optional = true,
      opts = { ensure_installed = { "codelldb" } },
    },
    opts = function()
      local dap = require("dap")

      -- Configure C/C++ debugger
      if not dap.adapters["codelldb"] then
        require("dap").adapters["codelldb"] = {
          type = "server",
          host = "localhost",
          port = "${port}",
          executable = {
            command = "codelldb",
            args = {
              "--port",
              "${port}",
            },
          },
        }
      end
      for _, lang in ipairs({ "c", "cpp" }) do
        dap.configurations[lang] = {
          {
            type = "codelldb",
            request = "launch",
            name = "Launch file",
            program = function()
              return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
            end,
            cwd = "${workspaceFolder}",
          },
          {
            type = "codelldb",
            request = "attach",
            name = "Attach to process",
            pid = require("dap.utils").pick_process,
            cwd = "${workspaceFolder}",
          },
        }
      end
    end,
  },
  -- Python Debugger Configuration
  {
    "mfussenegger/nvim-dap",
    optional = true,
    dependencies = {
      "williamboman/mason.nvim",
      optional = true,
      opts = { ensure_installed = { "debugpy" } },
    },
    opts = function()
      local dap = require("dap")

      -- Configure Python debugger
      dap.adapters.python = {
        type = "executable",
        command = "python", -- Use the system python executable
        args = { "-m", "debugpy.adapter" },
      }

      dap.configurations.python = {
        {
          -- Configuration for debugging a regular Python file
          type = "python",
          request = "launch",
          name = "Launch file",
          program = "${file}", -- This will debug the current file
          pythonPath = function()
            return "/usr/bin/python" -- Adjust this path to the Python interpreter you want to use
          end,
        },
        {
          type = "python",
          request = "attach",
          name = "Attach to Docker container",
          connect = {
            host = "127.0.0.1",
            port = 5678,
          },
          mode = "remote",
          pathMappings = {
            {
              localRoot = vim.fn.getcwd(),
              remoteRoot = "/app",
            },
          },
        },
      }
    end,
  },
}
