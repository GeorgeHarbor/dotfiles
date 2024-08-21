local dap = require('dap')

dap.adapters.coreclr = {
  type = 'executable',
  command = '/home/luka/.local/share/nvim/mason/packages/netcoredbg/netcoredbg', -- Ensure the path includes the executable
  args = {'--interpreter=vscode'}
}

dap.configurations.cs = { -- Ensure this matches the filetype of your buffer
  {
    type = 'coreclr',
    name = 'launch - netcoredbg',
    request = 'launch',
    program = function()
      return vim.fn.input('Path to dll', vim.fn.getcwd() .. '/bin/Debug/<YourProjectName>.dll', 'file')
    end,
  },
}
