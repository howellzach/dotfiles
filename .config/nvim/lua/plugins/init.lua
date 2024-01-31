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
    -- {
    --     "VonHeikemen/lsp-zero.nvim",
    --     dependencies = {
    --         -- LSP Support
    --         { "neovim/nvim-lspconfig" },
    --         { "williamboman/mason.nvim" },
    --         { "williamboman/mason-lspconfig.nvim" },
    --         -- Autocompletion
    --         { "hrsh7th/nvim-cmp" },
    --         { "hrsh7th/cmp-buffer" },
    --         { "hrsh7th/cmp-path" },
    --         { "saadparwaiz1/cmp_luasnip" },
    --         { "hrsh7th/cmp-nvim-lsp" },
    --         { "hrsh7th/cmp-nvim-lua" },
    --         -- Snippets
    --         { "L3MON4D3/LuaSnip" },
    --         { "rafamadriz/friendly-snippets" },
    --     },
    -- },
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
    -- {
    -- 	"wesleimp/stylua.nvim",
    -- 	keys = {
    -- 		{ "<leader>fmt", '<cmd>lua require("stylua").format()<cr>', desc = "Format lua file" },
    -- 	},
    -- },
}
