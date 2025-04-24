return {
  "mfussenegger/nvim-dap",
  -- use `opts` to modify the existing config function
  opts = function(_, opts)
    local dap = require("dap")
    local dapui = require("dapui")

    -- Optional: Auto-open dapui when debugging starts
    dap.listeners.after.event_initialized["dapui_config"] = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated["dapui_config"] = function()
      dapui.close()
    end
    dap.listeners.before.event_exited["dapui_config"] = function()
      dapui.close()
    end
    require("user.dotnet-debug").register_net_dap()
  end,

  keys = {
    -- Function keys
    {
      "<F5>",
      function()
        require("dap").continue()
      end,
      desc = "DAP Continue",
    },
    {
      "<F10>",
      function()
        require("dap").step_over()
      end,
      desc = "DAP Step Over",
    },
    {
      "<F11>",
      function()
        require("dap").step_into()
      end,
      desc = "DAP Step Into",
    },
    {
      "<F12>",
      function()
        require("dap").step_out()
      end,
      desc = "DAP Step Out",
    },
    -- UI toggle
    {
      "<leader>du",
      function()
        require("dapui").toggle()
      end,
      desc = "DAP UI Toggle",
    },
  },
}
