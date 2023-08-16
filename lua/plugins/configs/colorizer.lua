local M = {}

M.opts = {
  names = true,
  tailwind = true,
}

M.config = function(_, opts)
  require("colorizer").setup(opts)
end

return M
