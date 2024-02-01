return {
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        lazy = true,
        config = false,
        init = function()
            -- Disable automatic setup, we are doing it manually
            vim.g.lsp_zero_extend_cmp = 0
            vim.g.lsp_zero_extend_lspconfig = 0
        end,
    },
    {
        'williamboman/mason.nvim',
        lazy = false,
        config = true,
    },
    -- Autocompletion
    {
        'hrsh7th/nvim-cmp',
        event = 'InsertEnter',
        dependencies = {
            "hrsh7th/cmp-nvim-lsp", -- use suggestions from the LSP
            "hrsh7th/cmp-nvim-lua", -- nvim-cmp source for neovim Lua API
            "hrsh7th/cmp-path",     -- nvim-cmp source for filesystem paths
            "hrsh7th/cmp-buffer",   -- nvim-cmp source for buffer words

            -- Snippet engine. Required for nvim-cmp to work, even if you don't
            -- intend to use custom snippets.
            "L3MON4D3/LuaSnip",         -- snippet engine
            "saadparwaiz1/cmp_luasnip", -- adapter for the snippet engine
        },
        config = function()
            -- Here is where you configure the autocompletion settings.
            local lsp_zero = require('lsp-zero')
            lsp_zero.extend_cmp()

            -- And you can configure cmp even more, if you want to.
            local cmp = require('cmp')
            local cmp_action = lsp_zero.cmp_action()
            local cmp_select = { behavior = cmp.SelectBehavior.Select }

            cmp.setup({
                formatting = lsp_zero.cmp_format(),
                completion = {
                    completeopt = "menu,menuone,noinsert",
                },
                mapping = cmp.mapping.preset.insert({
                    ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
                    ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
                    -- `Enter` key to confirm completion
                    ['<CR>'] = cmp.mapping.confirm({ select = false }),
                    ['<Tab>'] = cmp_action.tab_complete(),
                    ['<S-Tab>'] = cmp_action.select_prev_or_fallback(),
                    -- Ctrl+Space to trigger completion menu
                    ["<C-Space>"] = cmp.mapping.complete(),
                    -- Navigate between snippet placeholder
                    ["<C-f>"] = cmp_action.luasnip_jump_forward(),
                    ["<C-b>"] = cmp_action.luasnip_jump_backward(),
                    -- Scroll up and down in the completion documentation
                    ["<C-u>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-d>"] = cmp.mapping.scroll_docs(4),
                }),
                sources = {
                    { name = "path" },
                    { name = "buffer" },
                    { name = "nvim_lua" },
                    { name = "nvim_lsp" },
                },
                experimental = {
                    ghost_text = {
                        hl_group = "CmpGhostText",
                    },
                },

            })
        end
    },
    -- LSP
    {
        'neovim/nvim-lspconfig',
        cmd = { 'LspInfo', 'LspInstall', 'LspStart' },
        event = { 'BufReadPre', 'BufNewFile' },
        dependencies = {
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'williamboman/mason-lspconfig.nvim' },
        },
        keys = {
            { "gd",         vim.lsp.buf.definition,  desc = "Goto Definition" },
            { "gr",         vim.lsp.buf.references,  desc = "Goto References" },
            { "<leader>rr", vim.lsp.buf.rename,      desc = "Rename" },
            { "<leader>c",  vim.lsp.buf.code_action, desc = "Code Action" },
            { "K",          vim.lsp.buf.hover,       desc = "Hover definition" },
        },
        config = function()
            -- This is where all the LSP shenanigans will live
            local lsp_zero = require('lsp-zero')
            lsp_zero.extend_lspconfig()

            --- read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guides/integrate-with-mason-nvim.md
            lsp_zero.on_attach(function(client, bufnr)
                -- see :help lsp-zero-keybindings
                -- to learn the available actions
                lsp_zero.default_keymaps({ buffer = bufnr })
                lsp_zero.set_sign_icons({
                    error = "✘",
                    warn = "▲",
                    hint = "⚑",
                    info = "ℹ",
                })
            end)

            require('mason-lspconfig').setup({
                ensure_installed = { 'lua_ls', 'rust_analyzer', 'gopls', 'ruff_lsp' },
                handlers = {
                    lsp_zero.default_setup,
                    lua_ls = function()
                        -- (Optional) Configure lua language server for neovim
                        local lua_opts = lsp_zero.nvim_lua_ls()
                        require('lspconfig').lua_ls.setup(lua_opts)
                    end,
                    ruff_lsp = function()
                        require('lspconfig').ruff_lsp.setup({
                            settings = {
                                organizeImports = false,
                            },
                        })
                    end
                }
            })
        end
    },
    -- Formatting
    {
        "stevearc/conform.nvim",
        event = "BufWritePre", -- load the plugin before saving
        keys = {
            {
                "<leader>fm",
                function()
                    require("conform").format({ lsp_fallback = true })
                end,
                desc = "Format buffer",
            },
            {
                "<leader>ft",
                function()
                    if vim.b.disable_autoformat or vim.g.disable_autoformat then
                        vim.cmd("FormatEnable")
                    else
                        vim.cmd("FormatDisable")
                    end
                end,
                desc = "Toggle auto-formating"
            },
        },
        init = function()
            local notify = require("notify")
            vim.api.nvim_create_user_command("FormatDisable", function(args)
                if args.bang then
                    -- FormatDisable! will disable formatting just for this buffer
                    vim.b.disable_autoformat = true
                else
                    vim.g.disable_autoformat = true
                end
                notify("autoformat on save disabled", "error", { title = "conform.nvim" })
            end, {
                desc = "Disable autoformat-on-save",
                bang = true,
            })
            vim.api.nvim_create_user_command("FormatEnable", function()
                vim.b.disable_autoformat = false
                vim.g.disable_autoformat = false
                notify("autoformat on save enabled", "info", { title = "conform.nvim" })
            end, {
                desc = "Re-enable autoformat-on-save",
            })
        end,
        opts = {
            formatters_by_ft = {
                python = { "isort", "ruff_lsp" },
                lua = { "lua_ls" },
                go = { "gopls" },
                -- "inject" is a special formatter from conform.nvim, which
                -- formats treesitter-injected code. Basically, this makes
                -- conform.nvim format python codeblocks inside a markdown file.
                markdown = { "inject" },
            },
            -- enable format-on-save for specific languages
            format_on_save = function(bufnr)
                local filetypes = { "go", "lua" }
                if not vim.tbl_contains(filetypes, vim.bo[bufnr].filetype) then
                    print("not a autoformat filetype")
                    return
                end
                return { timeout_ms = 500, lsp_fallback = true }
            end
        },
    },
}
