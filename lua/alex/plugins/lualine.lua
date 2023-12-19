local status, lualine = pcall(require, "lualine")
if not status then
  return
end

-- get lualine nightfly theme
local lualine_nightfly = require("lualine.themes.onedark")
local lualine_ayu_light = require("lualine.themes.ayu_light")

-- configure lualine with modified theme
lualine.setup({
  options = {
    theme = "catppuccin",
  },
  sections = {
    lualine_x = {
      { -- add this extra table
        function()
          local status = require("ollama").status()

          if status == "IDLE" then
            return "󱙺" -- nf-md-robot-outline
          elseif status == "WORKING" then
            return "󰚩" -- nf-md-robot
          end
        end,
        cond = function()
          return package.loaded["ollama"] and require("ollama").status() ~= nil
        end,
      } -- close the extra table
    }
  }
})
