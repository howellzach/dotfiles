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

function _open_term_toggle()
    open_term:toggle()
end

vim.api.nvim_set_keymap("n", "<leader>t", "<cmd>lua _open_term_toggle()<CR>",
    { desc = "Open floating terminal", noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>ht", "<cmd>:ToggleTerm direction=horizontal size=18<CR>",
    { desc = "Open terminal at bottom", noremap = true, silent = true })
