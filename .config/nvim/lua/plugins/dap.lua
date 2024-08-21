return {
  {
    "mfussenegger/nvim-dap",
    config = function()
      local dap = require("dap")

      -- Function to get the DLL path from launchSettings.json
      local function get_dll_from_launchsettings()
        local cwd = vim.fn.getcwd()
        local launch_settings_path = cwd .. '/launchSettings.json' -- Adjusted to root of the project

        if vim.fn.filereadable(launch_settings_path) == 0 then
          vim.notify('Could not find launchSettings.json', vim.log.levels.ERROR)
          return ''
        end

        local launch_settings = vim.fn.json_decode(vim.fn.readfile(launch_settings_path))
        local profiles = launch_settings.profiles or {}

        -- Select the 'debug' profile (or customize this logic)
        local active_profile = profiles["debug"] -- Assuming 'debug' is the profile name you use
        if not active_profile then
          vim.notify('Could not find the debug profile in launchSettings.json', vim.log.levels.ERROR)
          return ''
        end

        -- Use the executablePath from the debug profile
        local executable_path = active_profile.executablePath or ''
        if executable_path == '' then
          vim.notify('Executable path not found in the debug profile', vim.log.levels.ERROR)
          return ''
        end

        -- Convert relative path to absolute path
        local dll_path = vim.fn.resolve(cwd .. '/' .. executable_path)
        if vim.fn.filereadable(dll_path) == 0 then
          vim.notify('Could not find the DLL file: ' .. dll_path, vim.log.levels.ERROR)
          return ''
        end

        return dll_path
      end

      dap.adapters.coreclr = {
        type = 'executable',
        command = '/home/luka/.local/share/nvim/mason/packages/netcoredbg/netcoredbg', -- Ensure the path includes the executable
        args = { '--interpreter=vscode' }
      }

      dap.configurations.cs = { -- Ensure this matches the filetype of your buffer
        {
          type = 'coreclr',
          name = 'Launch with launchSettings.json',
          request = 'launch',
          program = function()
            local path = get_dll_from_launchsettings()
            if path == '' then
              path = vim.fn.input('Path to dll', vim.fn.getcwd() .. '', 'file')
            end
            return path
          end, -- Use the function to dynamically get the DLL path
          cwd = '${workspaceFolder}',
          stopAtEntry = false,
          env = function()
            -- Parse launchSettings.json for environment variables
            local env = {}
            local launch_settings_path = vim.fn.getcwd() .. '/launchSettings.json'
            local launch_settings = vim.fn.json_decode(vim.fn.readfile(launch_settings_path))
            local profiles = launch_settings.profiles or {}
            local active_profile = profiles["debug"]

            if active_profile and active_profile.environmentVariables then
              for key, value in pairs(active_profile.environmentVariables) do
                table.insert(env, string.format('%s=%s', key, value))
              end
            end
            return env
          end,
          console = 'integratedTerminal',
        },
      }
    end,
  },

  -- UI for nvim-dap
  {
    "rcarriga/nvim-dap-ui",
    dependencies = {
      "nvim-neotest/nvim-nio"
    },
    requires = { "mfussenegger/nvim-dap" },
    config = function()
      local dap, dapui = require("dap"), require("dapui")
      dapui.setup()

      -- Automatically open UI when starting a session
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end

      -- Automatically close UI when ending a session
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end,
  },

  -- Virtual text for nvim-dap
  {
    "theHamsta/nvim-dap-virtual-text",
    requires = { "mfussenegger/nvim-dap" },
    config = function()
      require("nvim-dap-virtual-text").setup()
    end,
  },
}
