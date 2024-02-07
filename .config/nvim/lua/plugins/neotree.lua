return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    lazy = false,
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
    },
    opts = {
        mappings = {
            ["P"] = { "toggle_preview", config = { use_float = true, use_image_nvim = true } },
        },
        name = {
            trailing_slash = false,
            use_git_status_colors = true,
            highlight = "NeoTreeFileName",
        },
        filesystem = {
            filtered_items = {
                visible = true,
                show_hidden_count = true,
                hide_by_name = {
                    '.DS_Store',
                    'thumbs.db',
                },
                never_show = { ".git" },
            }
        },
        git_status = {
            symbols = {
                -- Change type
                added = "✚", -- or "✚", but this is redundant info if you use git_status_colors on the name
                modified = "", -- or "", but this is redundant info if you use git_status_colors on the name
                deleted = "✖", -- this can only be used in the git_status source
                renamed = "󰁕", -- this can only be used in the git_status source
                -- Status type
                untracked = "",
                ignored = "",
                unstaged = "󰄱",
                staged = "",
                conflict = "",
            },
        },
    },
    keys = {
        { "<leader>n", "<cmd>Neotree toggle<cr>", desc = "Toggle Neotree" },
    },
}
