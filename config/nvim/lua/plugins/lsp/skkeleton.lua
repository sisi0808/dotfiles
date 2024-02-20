return {
	"vim-skk/skkeleton",
	dependencies = {
    "vim-denops/denops.vim",
    {
      "delphinus/skkeleton_indicator.nvim",
      config = function()
        require'skkeleton_indicator'.setup{}
      end
    }
  },
  lazy = false,
	config = function()
    local dicPath = "~/Library/Containers/net.mtgto.inputmethod.macSKK/Data/Documents/Dictionaries"
		vim.fn["skkeleton#config"]({
			eggLikeNewline = true,
			registerConvertResult = true,
			globalDictionaries = {
				"~/.skk/SKK-JISYO.L",
        dicPath .. "SKK-JISYO.assoc",
        dicPath .. "SKK-JISYO.geo",
        dicPath .. "SKK-JISYO.jinmei",
        dicPath .. "SKK-JISYO.L",
        dicPath .. "SKK-JISYO.law",
        dicPath .. "SKK-JISYO.propernoun",
        dicPath .. "SKK-JISYO.station",
        dicPath .. "skk-jisyo.utf8",
			},
		})
	end,
	keys = {
		{ "<C-j>", "<Plug>(skkeleton-toggle)", mode = "i" },
		{ "<C-j>", "<Plug>(skkeleton-toggle)", mode = "c" },
    { "<C-j>", "<Plug>(skkeleton-toggle)", mode = "t" },
	},
}
