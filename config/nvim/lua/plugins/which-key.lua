-- keymapの補完表示
return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
	end,
	config = function()
		local wk = require("which-key")
		wk.register({
			{ "<leader>L", group = "lazy" },
			{ "<leader>S", group = "session" },
			{ "<leader>f", group = "find" },
			{ "<leader>g", group = "git" },
			{ "<leader>l", group = "lsp" },
			{ "<leader>m", group = "marks" },
			{ "<leader>n", group = "noice" },
		})
	end,
	dependencies = {
		{ "nvim-tree/nvim-web-devicons" },
	},
}
