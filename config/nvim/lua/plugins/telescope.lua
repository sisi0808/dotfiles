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
    },
    -- kensakuとの連携
    {
      "Allianaab2m/telescope-kensaku.nvim",
      config = function()
        require("telescope").load_extension("kensaku")
      end
    },
    -- プロジェクトごとのファイル検索
    {
      "nvim-telescope/telescope-project.nvim",
      config = function()
        require("telescope").load_extension("project")
      end
    }
  },
  keys = {
    { "<leader><leader>", ":Telescope find_files find_command=rg,--files,--hidden,--glob,!*.git <CR>", desc="File", silent=true},
    { "<leader>ff", ":Telescope frecency<CR>", desc="Recent", silent=true},
    { "<leader>fg", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>", desc="Text", silent=true},
    { "<leader>fh", ":Telescope help_tags<CR>", desc="Help tag", silent=true},
    { "<leader>fc", ":Telescope command_history<CR>", desc="Command", silent=true},
    { "<leader>fk", ":Telescope keymaps<CR>", desc="Keymaps", silent=true},
    { "<leader>fb", ":Telescope buffers<CR>", desc="Buffer", silent=true},
    { "<leader>fp", ":Telescope project<CR>", desc="Project", silent=true}
  },
}
