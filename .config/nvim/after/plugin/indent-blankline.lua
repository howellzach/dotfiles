vim.opt.list = true
vim.opt.listchars:append "space:⋅"

require("ibl").setup({
    indent = {
        char = "|"
    },
    scope = {
        show_start = true
    }
})

