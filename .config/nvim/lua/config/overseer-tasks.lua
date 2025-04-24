local overseer = require("overseer")

overseer.add_template({
  name = "dotnet build", -- template name used to reference this task
  builder = function()
    return {
      -- Command and its arguments; adjust if you need more flags
      cmd = { "dotnet", "build" },
      -- Setting the working directory to the current one (can adjust as needed)
      cwd = vim.fn.getcwd(),
    }
  end,
  -- Optionally, add an output parser or other settings if you need them
})

vim.api.nvim_create_user_command("DotnetBuild", function()
  require("overseer").run_template({ name = "dotnet build" }, {}, function(task)
    task:start()
    -- Wait for the task to finish (adjust the timeout if necessary)
    task:wait(10000)
    if task:result() == 0 then
      vim.notify("Build succeeded!", vim.log.levels.INFO)
    else
      vim.notify("Build failed.", vim.log.levels.ERROR)
    end
  end)
end, {})

local dap = require("dap")

dap.listeners.before.event_initialized["pre_debug_build"] = function(session)
  vim.notify("Running dotnet build before starting debug...", vim.log.levels.INFO)
  local build_task = require("overseer").run_template({ name = "dotnet build" })
  build_task:start()
  -- Wait (synchronously) for the build to complete (10 seconds timeout here; adjust as needed)
  build_task:wait(10000)
  if build_task:result() ~= 0 then
    vim.notify("dotnet build failed – aborting debug session.", vim.log.levels.ERROR)
    -- Optionally, add logic to abort the debug session:
    -- session:terminate() or simply return early depending on your dap configuration.
  else
    vim.notify("Build succeeded – continuing with debug session.", vim.log.levels.INFO)
  end
end
