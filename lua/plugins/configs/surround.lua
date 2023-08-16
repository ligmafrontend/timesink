local M = {}

M.opts = {}

M.config = function(_, opts)
  opts = opts or {}
  require("nvim-surround").setup(opts)
end

return M
