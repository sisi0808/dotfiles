-- Fuzzy finder
return {
  'nvim-telescope/telescope.nvim',
  lazy= false,
  dependencies = { 
    'nvim-lua/plenary.nvim',
    {
      "nvim-telescope/telescope-frecency.nvim",
      config = function()
        require('telescope').load_extension('frecency')
      end,
      dependencies = {'kkharji/sqlite.lua'}
    },
    'nvim-tree/nvim-web-devicons'
  },
  keys = {
    { '<leader><leader>', ':Telescope find_files find_command=rg,--files,--hidden,--glob,!*.git <CR>' },
    { '<leader>ff', ':Telescope frecency<CR>' },
    { '<leader>fg', ':Telescope live_grep<CR>' },
    { '<leader>fb', ':Telescope current_buffer_fuzzy_find<CR>' },
    { '<leader>fh', ':Telescope help_tags<CR>' }
  },
  -- extensions = {
  --   persisted = {
  --     layout_config = { width = 0.55, height = 0.55 }
  --   }
  -- }
}
