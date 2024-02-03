return {
    'akinsho/toggleterm.nvim',
    version = "*",
    keys = {
        { "<leader>t", "<cmd>lua OPEN_FLOATING_TERMINAL()<cr>",             desc = "Open floating terminal" },
        { "<leader>T", "<cmd>:ToggleTerm direction=horizontal size=18<cr>", desc = "Open terminal at bottom" },
        { "<leader>g", "<cmd>lua LAZY_GIT_TOGGLE()<cr>",                    desc = "Open lazygit" },
    },
    init = function()
        -- Create a toggle term config for a floating terminal
        local Terminal  = require('toggleterm.terminal').Terminal
        local open_term = Terminal:new({
            direction = "float",
            float_opts = {
                border = "double",
                height = 50,
                width = 250
            },
            -- function to run on opening the terminal
            on_open = function(term)
                vim.cmd("startinsert!")
                vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
            end,
            -- function to run on closing the terminal
            on_close = function(term)
                vim.cmd("startinsert!")
            end,
        })

        function OPEN_FLOATING_TERMINAL()
            open_term:toggle()
        end

        local lazygit = Terminal:new({
            cmd = "lazygit",
            dir = "git_dir",
            direction = "float",
            float_opts = {
                border = "double",
            },
            -- function to run on opening the terminal
            on_open = function(term)
                vim.cmd("startinsert!")
                vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
            end,
            -- function to run on closing the terminal
            on_close = function(term)
                vim.cmd("startinsert!")
            end,
        })

        function LAZY_GIT_TOGGLE()
            lazygit:toggle()
        end
    end
    -- opts = {
    --
    -- }
}
