return {
  -- ポップアップ(UI)をカスタマイズ
  {
    "stevearc/dressing.nvim",
    lazy = true,
    init = function()
      ---@diagnostic disable-next-line: duplicate-set-field
      vim.ui.select = function(...)
        require("lazy").load({ plugins = { "dressing.nvim" } })
        return vim.ui.select(...)
      end
      ---@diagnostic disable-next-line: duplicate-set-field
      vim.ui.input = function(...)
        require("lazy").load({ plugins = { "dressing.nvim" } })
        return vim.ui.input(...)
      end
    end,
  },
  -- ステータスライン
  {
    'nvim-lualine/lualine.nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
      'ryanoasis/vim-devicons'
    },
    config = function()
      require('lualine').setup({
        options = {
          icons_enabled = true,
          theme = 'gruvbox',
          component_separators = { left = '', right = ''},
          section_separators = { left = '', right = ''},
          disabled_filetypes = {
            statusline = {},
            winbar = {},
          },
          ignore_focus = {},
          always_divide_middle = true,
          colored = true,
          globalstatus = true,
          refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
          }
        },
        sections = {
          lualine_a = {'mode'},
          lualine_b = {'branch', 'diff'},
          lualine_c = {'filename'},
          lualine_x = {'encoding', 'fileformat', 'filetype'},
          lualine_y = {'progress'},
          lualine_z = {'location'}
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = {'filename'},
          lualine_x = {'location'},
          lualine_y = {},
          lualine_z = {}
        },
        winbar = {},
        inactive_winbar = {},
        extensions = {}
        })
    end
  },
  -- インデント
  {
    'lukas-reineke/indent-blankline.nvim',
    config = function()
      require("ibl").setup {
        exclude = { 
          filetypes = {
            "help",
            "alpha",
            "dashboard",
            "neo-tree",
            "Trouble",
            "trouble",
            "lazy",
            "mason",
            "notify",
            "toggleterm",
            "lazyterm",
          },
        }
      }
    end
  },
  -- バッファ・タブバーをかっこよく
  {
    'romgrk/barbar.nvim',
    dependencies = {'nvim-web-devicons'},
    event = {'BufNewFile', 'BufRead'},
    keys = {
      -- Move to previous/next
      { '<M-,>', '<Cmd>BufferPrevious<CR>', { noremap = true, silent = true }},
      { '<M-.>', '<Cmd>BufferNext<CR>' ,{ noremap = true, silent = true }},
      -- Reorder to previous/next
      { '<M-<>', '<Cmd>BufferMovePrevious<CR>', { noremap = true, silent = true }},
      { '<M->>', '<Cmd>BufferMoveNext<CR>' ,{ noremap = true, silent = true }},
      -- Close buffer
      { '<M-c>', '<Cmd>BufferClose<CR>' ,{ noremap = true, silent = true }},
      { '<M-S-c>', '<Cmd>BufferCloseAllBufCurrent<CR>' ,{ noremap = true, silent = true }},
      -- Restore buffer
      { '<M-v>', '<Cmd>BufferRestore<CR>' ,{ noremap = true, silent = true }},
      -- Pick buffer
      { '<M-s>', '<Cmd>BufferPick<CR>' ,{ noremap = true, silent = true }},
    }
  },
  -- 通知のポップアップをかっこよく
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      -- add any options here
    },
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      "rcarriga/nvim-notify",
    },
  }
}
