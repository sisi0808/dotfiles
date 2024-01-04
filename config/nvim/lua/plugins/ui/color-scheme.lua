-- カラースキーム
return {
--  {
--   'shaunsingh/nord.nvim',
--   -- 'ellisonleao/gruvbox.nvim',
--   lazy = false,
--   priority = 1000,
--   config = function()
--     vim.cmd[[colorscheme nord]]
--
--     -- Example config in lua
--     -- vim.g.nord_contrast = true
--     -- vim.g.nord_borders = false
--     -- vim.g.nord_disable_background = true
--     -- vim.g.nord_italic = false
--     -- vim.g.nord_uniform_diff_background = true
--     -- vim.g.nord_bold = false
--
--     -- Load the colorscheme
--     require('nord').set()
--   end,
-- }
  {
    'catppuccin/nvim',
    lazy = false,
    name = 'catppuccin',
    priority = 1000,
    config = function()
      require('catppuccin').setup({
        integrations = {
          aerial = true,
          alpha = true,
          cmp = true,
          dashboard = true,
          flash = true,
          gitsigns = true,
          headlines = true,
          illuminate = true,
          indent_blankline = { enabled = true },
          lsp_trouble = true,
          mason = true,
          markdown = true,
          native_lsp = {
            enabled = true,
            underlines = {
              errors = { 'undercurl' },
              hints = { 'undercurl' },
              warnings = { 'undercurl' },
              information = { 'undercurl' },
            },
          },
          navic = { enabled = true, custom_bg = 'lualine' },
          noice = true,
          notify = true,
          semantic_tokens = true,
          telescope = true,
          treesitter = true,
          treesitter_context = true,
          which_key = true,
          barbar = true,
          fern = true,
        },
      })
      vim.cmd[[colorscheme catppuccin]]
    end,
  }
  -- {
  --   'sainnhe/everforest',
  --   lazy = false,
  --   name = 'everforest',
  --   priority = 1000,
  --   config = function()
  --     vim.cmd[[
  --       set background=dark
  --       " let g:everforest_background = 'hard'
  --       " let g:everforest_background = 'medium'
  --       let g:everforest_background = 'soft'
  --       let g:everforest_better_performance = 1
  --       colorscheme everforest
  --     ]]
  --   end,
  -- },
  -- {
  --    'rebelot/kanagawa.nvim',
  --    lazy = false,
  --    name = 'kanagawa',
  --    config = function()
  --      require('kanagawa').setup({
  --          undercurl = true,
  --          theme = "wave",
  --          -- theme = "lotus",
  --          -- theme = "dragon",
  --      })
  --      vim.cmd[[colorscheme kanagawa]]
  --    end
  -- }
}
