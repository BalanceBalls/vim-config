local status, lualine = pcall(require, "lualine")
if not status then
  return
end

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
            return "Chillin" -- nf-md-robot-outline
          elseif status == "WORKING" then
            return "Inference..." -- nf-md-robot
          end
        end,
        cond = function()
          return package.loaded["ollama"] and require("ollama").status() ~= nil
        end,
      } -- close the extra table
    }
  }
})
