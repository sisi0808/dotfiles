-- ステータスライン
return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"ryanoasis/vim-devicons",
	},
	config = function()
		require("lualine").setup({
			options = {
				icons_enabled = true,
				theme = "catppuccin",
				disabled_filetypes = {
					statusline = {},
					winbar = {},
				},
				ignore_focus = {},
				always_divide_middle = true,
				colored = true,
				globalstatus = true,
				refresh = {
					statusline = 1000,
					tabline = 1000,
					winbar = 1000,
				},
			},
			sections = {
				lualine_a = { "branch" },
				lualine_b = { { "filename", path = 1 } },
				lualine_c = {
					"'%='",
					{
						"diff",
						symbols = { added = "", modified = "", removed = "" },
						separator = " | ",
					},
					{
						"diagnostics",
						sources = {
							"nvim_diagnostic",
							"nvim_lsp",
						},
						sections = { "error", "warn", "info", "hint" },
						-- symbols = { error = 'E', warn = 'W', info = 'I', hint = 'H' },
						symbols = { error = "", warn = "", info = "", hint = "" },
						separator = " | ",
						-- colored = true,
						-- update_in_insert = false,
						-- always_visible = false,
					},
				},
				lualine_x = {
					{
						require("noice").api.status.mode.get,
						cond = require("noice").api.status.mode.has,
						color = { fg = "#ff9e64" },
					},
					"encoding",
					"filetype",
				},
				lualine_y = { "location", "progress" },
				lualine_z = { "mode" },
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { "filename" },
				lualine_x = { "location" },
				lualine_y = {},
				lualine_z = {},
			},
			winbar = {},
			inactive_winbar = {},
			extensions = {
				"fern",
				"lazy",
        "man",
				"mason",
				"quickfix",
				"toggleterm",
        "trouble"
			},
		})
	end,
}
