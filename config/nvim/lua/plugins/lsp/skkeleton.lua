return {
	"vim-skk/skkeleton",
	dependencies = { "vim-denops/denops.vim" },
  lazy = false,
	config = function()
		vim.fn["skkeleton#config"]({
			eggLikeNewline = true,
			registerConvertResult = true,
			globalDictionaries = {
				"~/.skk/SKK-JISYO.L",
			},
		})
	end,
	keys = {
		{ "<C-j>", "<Plug>(skkeleton-toggle)", mode = "i" },
		{ "<C-j>", "<Plug>(skkeleton-toggle)", mode = "c" },
    { "<C-j>", "<Plug>(skkeleton-toggle)", mode = "t" },
	},
}
