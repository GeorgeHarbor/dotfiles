local npairs = require('nvim-autopairs')
local Rule = require('nvim-autopairs.rule')

-- Add a rule to always close angle brackets in C# files
npairs.add_rules({
    Rule("<", ">")
    :with_pair(function()
        local filetype = vim.bo.filetype
        return filetype == "cs"  -- Only apply in C# files
    end)
})
