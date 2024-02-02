-- Escで日本語->英語
return {
	"brglng/vim-im-select",
	config = function()
		vim.g["im_select_default"] = "com.apple.inputmethod.Kotoeri.RomajiTyping.Roman"
	end,
}
