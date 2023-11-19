-- Git操作
return {
  -- git操作をVimから
  -- lazygitの方をメインで使うので一旦消す
  -- {
  --   'lambdalisue/gin.vim',
  --   lazy = false,
  --   dependencies = {
  --     'vim-denops/denops.vim',
  --   },
  --   keys = {
  --     {'<leader>ga', ':silent Gin add .<CR>', silent=true},
  --     {'<leader>gc', ':silent Gin commit<CR>', silent=true},
  --     {'<leader>gp', ':silent Gin push<CR>', silent=true},

  --     {'<leader>gs', ':GinStatus <CR>'},
  --     {'<leader>gb', ':GinBranch <CR>'},
  --     {'<leader>gbr', ':GinBrowse <CR>'},
  --   },
  --   config = function ()
  --     g['gin_proxy_apply_without_confirm'] = 1
  --   end
  -- },
  --
  -- Git操作
  -- brewでlazygitを事前にインストールしておく
  {
    "kdheepak/lazygit.nvim",
    -- optional for floating window border decoration
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    keys = {
      {'<leader>gg', ':LazyGit<CR>', silent=true},
    },
      config = function ()
        g['lazygit_floating_window_use_plenary'] = 1
      end
  },
  -- Gitの差分表示
  {
    'lewis6991/gitsigns.nvim',
    config = function()
    require('gitsigns').setup()
      require('gitsigns').setup {
        signs = {
          add          = { text = '+' },
          change       = { text = '~' },
          delete       = { text = '_' },
          topdelete    = { text = '‾' },
          changedelete = { text = '~_' },
        },
        current_line_blame = true,
      }
    end
  },
}
