local M = {}
M.ensure_installed = { "lua-language-server" }
M.PATH = "skip"
M.ui = {
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

return M
