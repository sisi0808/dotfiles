-- rainbow_csvのnvim版
-- F5でクエリコンソールを開く
return {
	"cameron-wags/rainbow_csv.nvim",
	config = true,
	ft = {
		"csv",
		"tsv",
		"csv_semicolon",
		"csv_whitespace",
		"csv_pipe",
		"rfc_csv",
		"rfc_semicolon",
	},
	cmd = {
		"RainbowDelim",
		"RainbowDelimSimple",
		"RainbowDelimQuoted",
		"RainbowMultiDelim",
	},
}
