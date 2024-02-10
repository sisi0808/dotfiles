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
    require("hlchunk").setup({})
  end
}
