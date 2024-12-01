-- -- インデント
-- return {
-- 	"lukas-reineke/indent-blankline.nvim",
-- 	config = function()
-- 		require("ibl").setup({
-- 			exclude = {
-- 				filetypes = {
-- 					"help",
-- 					"alpha",
-- 					"dashboard",
-- 					"neo-tree",
-- 					"Trouble",
-- 					"trouble",
-- 					"lazy",
-- 					"mason",
-- 					"notify",
-- 					"toggleterm",
-- 					"lazyterm",
-- 				},
-- 			},
-- 		})
-- 	end,
-- }
return {
	"shellRaining/hlchunk.nvim",
	event = { "UIEnter" },
	config = function()
		require("hlchunk").setup({
			chunk = {
				chars = {
					horizontal_line = "─",
					vertical_line = "│",
					left_top = "╭",
					left_bottom = "╰",
					right_arrow = ">",
				},
				style = "#806d9c",
				enable = "true",
			},
			indent = {
				chars = {
					"│",
				},
				style = {
					vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID("Whitespace")), "fg", "gui"),
				},
			},
		})
	end,
}
