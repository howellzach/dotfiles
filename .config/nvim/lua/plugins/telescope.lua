return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.5",
	dependencies = { "nvim-lua/plenary.nvim" },
	lazy = false,
	keys = {
		{ "<leader>sf", "<CMD>:Telescope find_files<CR>", desc = "[S]earch [F]iles" },
		{ "<leader>sh", "<CMD>:Telescope help_tags<CR>", desc = "[S]earch [H]elp" },
		{ "<leader>sw", "<CMD>:Telescope grep_string<CR>", desc = "[S]earch current [W]ord" },
		{ "<leader>sr", "<CMD>:Telescope oldfiles<CR>", desc = "[S]earch [R]ecent" },
		{ "<leader>sg", "<CMD>:Telescope live_grep<CR>", desc = "[S]earch by [G]rep" },
		{ "<leader>sd", "<CMD>:Telescope diagnostics<CR>", desc = "[S]earch [D]iagnostics" },
		{ "<C-p>", "<CMD>:Telescope git_files<CR>", desc = "Search git" },
		{ "<leader>fb", ":Telescope file_browser<CR>", desc = "Open Telescope file_browser" },
	},
	config = function()
		require("telescope").load_extension("file_browser")
	end,
}
