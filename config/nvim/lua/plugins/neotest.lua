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
  keys = {
      { "[n", "<cmd>lua require('neotest').jump.prev({ status = 'failed'})<CR>", mode = "n" },
      { "]n", "<cmd>lua require('neotest').jump.next({ status = 'failed'})<CR>", mode = "n" },
      { "<leader>tt", "<cmd>lua require('neotest').summary.toggle()<CR>", mode = "n" , desc= "summary"},
      { "<leader>to", "<cmd>lua require('neotest').output_panel.toggle()<CR>", mode = "n", desc = "output panel"},
      { "<leader>th", "<cmd>lua require('neotest').open({ enter = true })<CR>", mode = "n", desc = "output hover"},
      { "<leader>tr", "<cmd>lua require('neotest').run.run()<CR>", mode = "n",  desc = "run"},
      { "<leader>te", "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<CR>", mode = "n" ,desc="run file"},
      { "<leader>tl", "<cmd>lua require('neotest').run.run_last()<CR>", mode = "n", desc = "run last"},
  }
}
