-- Fuzzy finder
return {
  "nvim-telescope/telescope.nvim",
  lazy= false,
  dependencies = { 
    "nvim-lua/plenary.nvim",
    -- 最近使用したファイルを検索
    {
      "nvim-telescope/telescope-frecency.nvim",
      config = function()
        require("telescope").load_extension("frecency")
      end,
      dependencies = "kkharji/sqlite.lua"
    },
    -- icon
    "nvim-tree/nvim-web-devicons",
    -- live-grepでオプションを指定できるよう
    {
      "nvim-telescope/telescope-live-grep-args.nvim",
      config = function()
        require("telescope").load_extension("live_grep_args")
      end
    }
  },
  keys = {
    { "<leader><leader>", ":Telescope find_files find_command=rg,--files,--hidden,--glob,!*.git <CR>", desc="File"},
    { "<leader>ff", ":Telescope frecency<CR>", desc="Recent" },
    { "<leader>fg", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>", desc="Text"},
    -- { "<leader>fb", ":Telescope current_buffer_fuzzy_find<CR>", desc="Buffer"},
    { "<leader>fh", ":Telescope help_tags<CR>", desc="Help tag"},
    { "<leader>fc", ":Telescope command_history<CR>", desc="Command"},
    { "<leader>fk", ":Telescope keymaps<CR>", desc="Keymaps"}
  },
}
