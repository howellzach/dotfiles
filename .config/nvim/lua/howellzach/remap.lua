vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("x", "<leader>p", "\"_dP", {desc = "Delete+Paste vim clipboard without copying"})

vim.keymap.set("n", "<leader>y", "\"+y", {desc = "Yank to system clipboard"})
vim.keymap.set("v", "<leader>y", "\"+y", {desc = "Yank to system clipboard"})
vim.keymap.set("n", "<leader>Y", "\"+Y", {desc = "Yank to system clipboard"})

vim.keymap.set("n", "<leader>d", "\"_d", {desc = "Delete without copying"})
vim.keymap.set("v", "<leader>d", "\"_d", {desc = "Delete without copying"})

vim.keymap.set("n", "Q", "<nop>")

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>sub", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], {desc = "Substitute word"})
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true, desc = "Make file executable"})

vim.keymap.set("n", "<leader>b", "<cmd>!black %<CR>", {desc = "Format file with Black"})

vim.keymap.set('n', '<leader>m', ":Mason<CR>", {desc = 'Open Mason' })
vim.keymap.set('n', '<leader>l', ":Lazy<CR>", {desc = 'Open Lazy' })

vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, {desc = "Open undotree"})
