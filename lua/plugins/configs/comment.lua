local M = {}

M.init = function()
  require("core.utils").load_mappings "comment"
end

M.config = function(_, opts)
  require("Comment").setup(opts)
end

return M
