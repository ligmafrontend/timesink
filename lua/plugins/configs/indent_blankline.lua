local M = {}

M.opts = {
  show_current_context = true,
  show_trailing_blankline_indent = true,
}

M.config = function(_, opts)
  opts = opts or {}

  require("indent_blankline").setup(opts)
end

return M
