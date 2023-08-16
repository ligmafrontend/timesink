local config = function(_, opts)
    opts = opts or {}
    require"telescope".setup(opts)
end

return config