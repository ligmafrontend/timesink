return function(_, opts)
  opts = opts or {}

  local result = vim.tbl_deep_extend("force", {
    style = "night",
  }, opts)

  require("tokyonight").setup(result)
end

