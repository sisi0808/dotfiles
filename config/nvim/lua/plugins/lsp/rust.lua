return {
	-- rustの環境
	-- {
	--   'rust-lang/rust.vim',
	--   ft = 'rust',
	--   config = function()
	--     vim.g.rustfmt_autosave = 1
	--   end
	-- },
	-- rustをlspに繋いでくれる
	-- {
	--   'simrat39/rust-tools.nvim',
	-- config = function()
	--   require('rust-tools').setup({})
	-- end
	-- }
	{
		"mrcjkb/rustaceanvim",
		version = "^4", -- Recommended
		ft = { "rust" },
	},
}
