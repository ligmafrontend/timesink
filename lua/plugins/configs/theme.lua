local M = {}
M.opts = {
  transparent = true,
  styles = {
    sidebars = "transparent",
    floats = "transparent",
  }
}
M.config = function(_, opts)
  opts = opts or {}

  local result = vim.tbl_deep_extend("force", {
    style = "night",
  }, opts)

  require("tokyonight").setup(result)
end

return M
