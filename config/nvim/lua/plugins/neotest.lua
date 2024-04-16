-- test
return {
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-neotest/nvim-nio",
		"nvim-lua/plenary.nvim",
		"antoinemadec/FixCursorHold.nvim",
		"nvim-treesitter/nvim-treesitter",
		-- rust adapter
		{
			"mrcjkb/rustaceanvim",
			version = "^4",
			ft = { "rust" },
		},
	},

  config = function()
    require("neotest").setup({
      adapters = {
        require("rustaceanvim.neotest"), -- rust adapter
        -- require("neotest-plenary"),
        -- require("neotest-vim-test")({
        --   ignore_file_types = {
        --     "vim",
        --     "lua" ,
        --     "rust"
        --   },
        -- }),
      },
    })
  end,
  -- keys = {
  --
  -- }

}
