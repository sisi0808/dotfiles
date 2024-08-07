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
			["<leader>g"] = { name = "+git" },
			["<leader>L"] = { name = "+lazy" },
			["<leader>l"] = { name = "+lsp" },
			["<leader>S"] = { name = "+session" },
			["<leader>f"] = { name = "+find" },
			["<leader>n"] = { name = "+noice" },
      ["<leader>m"] = { name = "+marks" },
		})
	end,
}
