local util = require("easycomplete.util")
local console = util.console

vim.api.nvim_create_autocmd("User", {
  pattern = "easycomplete_default_plugin",
  callback = function()
    require("easycomplete_docker").setup()
  end,
})





