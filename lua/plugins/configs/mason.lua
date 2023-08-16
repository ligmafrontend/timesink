local M = {}

M.opts = {
    ensure_installed = { "lua-language-server" },
    PATH = "skip",
    ui = {
        icons = {
            package_installed = "✓",
            package_uninstalled = "✗",
            package_pending = "⟳",
        },
        keymaps = {
            toggle_server_expand = "<CR>",
            install_server = "i",
            update_server = "u",
            check_server_version = "c",
            update_all_servers = "U",
            check_outdated_servers = "C",
            uninstall_server = "X",
            cancel_installation = "<C-c>",
        },
    }
}

M.config = function(_, opts)
    require("mason").setup(opts)
    vim.g.mason_binaries_list = opts.ensure_installed
end

return M
