return {
    { "nvim-telescope/telescope-file-browser.nvim" },
    {
        "catppuccin/nvim",
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd([[colorscheme catppuccin]])
        end,
    },
    "mbbill/undotree",
    {
        "numToStr/Comment.nvim",
        config = function()
            require("Comment").setup()
        end,
    },
    "nvim-tree/nvim-web-devicons",
    {
        "windwp/nvim-autopairs",
        config = function()
            require("nvim-autopairs").setup({})
        end,
    },
    "RRethy/vim-illuminate",
    {
        "goolord/alpha-nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },
    {
        "folke/which-key.nvim",
        config = function()
            require("which-key").setup({})
        end,
    },
    {
        "akinsho/toggleterm.nvim",
        version = "*",
        config = function()
            require("toggleterm").setup({})
        end,
    },
    {
        'petertriho/nvim-scrollbar',
        dependencies = { "lewis6991/gitsigns.nvim" },
        config = function()
            require("scrollbar").setup({
                handlers = {
                    cursor = true,
                    diagnostic = true,
                    gitsigns = true, -- Requires gitsigns
                    handle = true,
                    search = false,  -- Requires hlslens
                    ale = false,     -- Requires ALE
                },
            })
        end,
    }
}
