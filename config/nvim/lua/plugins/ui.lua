return {
  -- ポップアップ(UI)をカスタマイズ
  {
    "stevearc/dressing.nvim",
    config = function()
      require("dressing").setup({
        input = { enabled = false },
      })
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
      opt.termguicolors = true
      cmd [[highlight IndentBlanklineIndent1 guibg=#1f1f1f gui=nocombine]]
      cmd [[highlight IndentBlanklineIndent2 guibg=#1a1a1a gui=nocombine]]
      require("indent_blankline").setup {
          char = "",
          char_highlight_list = {
              "IndentBlanklineIndent1",
              "IndentBlanklineIndent2",
          },
          space_char_highlight_list = {
              "IndentBlanklineIndent1",
              "IndentBlanklineIndent2",
          },
          show_trailing_blankline_indent = false,
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
  }
}
