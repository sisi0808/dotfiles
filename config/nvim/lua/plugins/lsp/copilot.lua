-- copilot
return {
	{
		"zbirenbaum/copilot.lua",
		dependencies = {
			"CopilotC-Nvim/CopilotChat.nvim",
			dependencies = {
				{ "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
			},
			build = "make tiktoken", -- Only on MacOS or Linux
			opts = {},
		},
		cmd = "Copilot",
		event = "InsertEnter",
		lazy = false,
		config = function()
			require("copilot").setup({
				suggestion = {
					enabled = true,
					auto_trigger = true,
					debounce = 75,
					keymap = {
						accept = "<C-k>",
						accept_word = false,
						accept_line = false,
						-- next = "<C-o>",
						-- prev = "<C-i>",
						dismiss = "<C-]>",
					},
				},
			})
		end,
	},
}
