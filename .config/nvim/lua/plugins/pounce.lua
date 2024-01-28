return {
	"rlane/pounce.nvim",
	opts = {
		accept_keys = "JFKDLSAHGNUVRBYTMICEOXWPQZ",
		accept_best_key = "<enter>",
		multi_window = true,
		debug = false,
	},
    keys = {
        {"s", vim.cmd.Pounce},
        {"S", vim.cmd.PounceRepeat},
    }
}

