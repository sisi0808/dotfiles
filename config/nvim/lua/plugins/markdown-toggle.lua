return {
	"roodolv/markdown-toggle.nvim",
	config = function()
		require("markdown-toggle").setup({
			cycle_box_table = true,
			box_table = { "x" },
			list_before_box = true,

			vim.api.nvim_create_autocmd("FileType", {
				desc = "markdown-toggle.nvim keymaps",
				pattern = { "markdown", "markdown.mdx" },
				callback = function(args)
					local opts = { silent = true, noremap = true, buffer = args.buf }
					local toggle = require("markdown-toggle")

          -- toggle checkbox
					vim.keymap.set("n", "<CR>", toggle.checkbox, opts)
					vim.keymap.set("x", "<CR>", toggle.checkbox, opts)
					vim.keymap.set("n", "<C-h>", toggle.heading_dot, opts)
					vim.keymap.set("x", "<C-h>", toggle.heading, opts)

					-- autolist
					vim.keymap.set("n", "O", toggle.autolist_up, opts)
					vim.keymap.set("n", "o", toggle.autolist_down, opts)
					vim.keymap.set("i", "<CR>", toggle.autolist_cr, opts)
				end,
			}),
		})
	end,
}