return {
	"vim-skk/skkeleton",
	dependencies = {
		"vim-denops/denops.vim",
		{
			"delphinus/skkeleton_indicator.nvim",
			config = function()
				require("skkeleton_indicator").setup({})
			end,
		},
	},
	lazy = false,
	config = function()
		local dicPath = "~/.skk/"
		vim.fn["skkeleton#config"]({
			eggLikeNewline = true,
			registerConvertResult = true,
			globalDictionaries = {
				dicPath .. "SKK-JISYO.L",
				dicPath .. "SKK-JISYO.assoc",
				dicPath .. "SKK-JISYO.geo",
				dicPath .. "SKK-JISYO.jinmei",
				dicPath .. "SKK-JISYO.law",
				dicPath .. "SKK-JISYO.propernoun",
				dicPath .. "SKK-JISYO.station",
			},
			userDictionary = dicPath .. ".skkeleton",
			kanaTable = "azik",
			globalKanaTableFiles = {
				dicPath .. "azik_us.rule",
			},
		})
		vim.fn["skkeleton#register_keymap"]("input", ";", "henkanPoint")
		vim.fn["skkeleton#register_keymap"]("henkan", "X", false)
		vim.fn["skkeleton#register_keymap"]("henkan", "<", "purgeCandidate")
	end,
	keys = {
		{ "<C-j>", "<Plug>(skkeleton-toggle)", mode = "i" },
		{ "<C-j>", "<Plug>(skkeleton-toggle)", mode = "c" },
		{ "<C-j>", "<Plug>(skkeleton-toggle)", mode = "t" }
	},
}
