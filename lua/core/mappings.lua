-- n, v, i, t = mode names

local M = {}

M.general = {
    -- normal mode
    n = {
        ["<C-s>"] = { "<cmd>w!<cr>", desc = "Force write" },
        ["<C-q>"] = { "<cmd>qa!<cr>", desc = "Force quit" },

        -- Allow moving the cursor through wrapped lines with j, k, <Up> and <Down>
        -- http://www.reddit.com/r/vim/comments/2k4cbr/problem_with_gj_and_gk/
        -- empty mode is same as using <cmd> :map
        -- also don't use g[j|k] when in operator pending mode, so it doesn't alter d, y or c behaviour
        ["j"] = { 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', "Move down", opts = { expr = true } },
        ["k"] = { 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', "Move up", opts = { expr = true } },
        ["<Up>"] = { 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', "Move up", opts = { expr = true } },
        ["<Down>"] = { 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', "Move down", opts = { expr = true } },

        -- open lazygit
        ["<leader>gg"] = { "<cmd>LazyGit<cr>", desc = "LazyGit" },
    },
    -- visual mode
    v = {
        ["<S-Tab>"] = { "<gv", desc = "Unindent line" },
        ["<Tab>"] = { ">gv", desc = "Indent line" },
    },
    -- terminal
    t = {
        ["<C-h>"] = { "<cmd>wincmd h<cr>", desc = "Terminal left window navigation" },
        ["<C-j>"] = { "<cmd>wincmd j<cr>", desc = "Terminal down window navigation" },
        ["<C-k>"] = { "<cmd>wincmd k<cr>", desc = "Terminal up window navigation" },
        ["<C-l>"] = { "<cmd>wincmd l<cr>", desc = "Terminal right window navigation" },
    }
}

M.comment = {
    -- plugin = true,

    -- toggle comment in both modes
    n = {
        ["<leader>/"] = {
            function()
                require("Comment.api").toggle.linewise.current()
            end,
            "Toggle comment",
        },
    },

    v = {
        ["<leader>/"] = {
            "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
            "Toggle comment",
        },
    },
}

M.nvimtree = {
    -- plugin = true,

    n = {
        -- toggle
        ["<C-n>"] = { "<cmd> NvimTreeToggle <CR>", "Toggle nvimtree" },
        -- focus
        ["<leader>e"] = { "<cmd> NvimTreeFocus <CR>", "Focus nvimtree" },
    },
}

M.telescope = {
    -- plugin = true,

    n = {
        ["<leader>ff"] = { function() require("telescope.builtin").find_files() end, desc = "Find files" },
        ["<leader>fo"] = { function() require("telescope.builtin").oldfiles() end, desc = "Find history" },
        ["<leader>fw"] = { function() require("telescope.builtin").live_grep() end, desc = "Find words" },
        ["<leader>fW"] = {
            function()
                require("telescope.builtin").live_grep {
                    additional_args = function(args) return vim.list_extend(args, { "--hidden", "--no-ignore" }) end,
                }
            end,
            desc = "Find words in all files",
        },
    }
}

M.whichkey = {
    -- plugin = true,

    n = {
        ["<leader>wK"] = {
            function()
                vim.cmd "WhichKey"
            end,
            "Which-key all keymaps",
        },
        ["<leader>wk"] = {
            function()
                local input = vim.fn.input "WhichKey: "
                vim.cmd("WhichKey " .. input)
            end,
            "Which-key query lookup",
        },
    },
}



return M
