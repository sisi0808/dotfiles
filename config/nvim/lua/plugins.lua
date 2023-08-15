-- lazy.vim setting
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.ngit",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
   -- 行内のf文字ハイライト
  'unblevable/quick-scope',
  -- コメントアウト
  'tpope/vim-commentary',
  -- ヘルプ日本語化
  'vim-jp/vimdoc-ja',
  -- 画面移動の滑らか化
  'yuttie/comfortable-motion.vim',

  -- セッション管理
  {
    'xolox/vim-session',
    dependencies = { 
      'xolox/vim-misc'
    },
    config = function()
      g['session_directory'] = "~/.config/nvim/session"
      g['session_autoload'] = "no"
      g['session_autosave'] = "no"
      g['session_command_aliases'] = 1
    end
  },

  -- copilot
  {
    "zbirenbaum/copilot.lua",
    event = "InsertEnter",
    keys = {
      {'<C-j>','copilot#Accept("<CR>")' ,mode = "i" },
      {'<M-i>','<Plug>(copilot-next)' ,mode = "i" },
      {'<M-o>','<Plug>(copilot-previous)' ,mode = "i" }
    },
    config = function()
      g['copilot_no_tab_map'] = true
        require('copilot').setup()
    end
  },
  -- 閉じカッコ作成
  {
    'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup()
    end
  },

  -- リンクをブラウザで開く
  {
    'tyru/open-browser.vim',
    keys = {
      {'gx', '<Plug>(openbrowser-smart-search)'}
    },
    config = function()
      g['netrw_nogx = 1'] = 1
    end
  },
  -- Escで日本語->英語
  {
    'brglng/vim-im-select',
    config = function()
      g['im_select_default'] = 'com.apple.inputmethod.Kotoeri.RomajiTyping.Roman'
    end
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
          globalstatus = false,
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
      }
    }, 
    -- 囲まれているものの操作
    {
      'machakann/vim-sandwich',
      config = function()
        vim.cmd("runtime macros/sandwich/keymap/surround.vim")
      end
    },
    -- 画面内瞬間移動
    {
      'phaazon/hop.nvim',
      branch = 'v2',
      keys = {
        { 's', ':HopChar2MW<CR>' }
      },
      config = function()
        require('hop').setup({
          keys = 'etovxqpdygfblzhckisuran' 
        })
      end
    },
      -- Fuzzy finder
    {
      'nvim-telescope/telescope.nvim',
      tag = '0.1.2',
      dependencies = { 
        'nvim-lua/plenary.nvim'
      },
      keys = {
        { '<leader>ff', ':Telescope find_files find_command=rg,--files,--hidden,--glob,!*.git <CR>' },
        { '<leader>fg', ':Telescope live_grep<CR>' },
        { '<leader>fb', ':Telescope current_buffer_fuzzy_find<CR>' },
        { '<leader>fh', ':Telescope help_tags<CR>' }
      }
    },
     -- VSCode like
    {
      'neoclide/coc.nvim',
      branch = "release",
      event = "InsertEnter",
      keys = {
        -- 定義に移動
        { '<C-]>', '<Plug>(coc-definition)' },
        -- 呼び出し元に移動
        { '<C-j>h', '<Plug>(coc-references)' },
        -- 実装に移動
        { '<C-j>i', '<Plug>(coc-implementation)' },
        -- 配下の定義を表示
        { '<M-s>', ':call CocActionAsync(\'doHover\')<CR>' },
        { '<C-P>', '<C-\\><C-O>:call CocActionAsync(\'showSignatureHelp\')<CR>', mode = "i" },
        -- 前後のエラーや警告に移動
        { '<M-k>', '<Plug>(coc-diagnostic-prev)' },
        { '<M-j>', '<Plug>(coc-diagnostic-next)' },
        -- Enterキーで決定
        { "<cr>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], mode = "i", expr = true, replace_keycodes = false },
        -- code action
        { '<M-CR>', '<Plug>(coc-codeaction-cursor)' },
        -- Find symbol of current document
        { '<C-j>o', ':<C-u>CocList outline<cr>' },
        -- Search workspace symbols
        { '<C-j>s', ':<C-u>CocList -I symbols<cr>' },
        -- Rename
        { '<S-M-r>', '<Plug>(coc-rename)' },
        -- Auto complete
        { "<F5>", "coc#refresh()" },
      },
      config = function()
        g.coc_global_extensions = {
          "coc-json",
          "coc-tsserver",
          "coc-css",
          "coc-yaml",
          "coc-sh",
          "coc-prettier",
          "coc-pyright",
        }
      end
    },
    -- ファイラー
    {
      'lambdalisue/fern.vim',
      dependencies = { 
        -- アイコン類
        {'lambdalisue/nerdfont.vim'},
        {
          'lambdalisue/fern-renderer-nerdfont.vim',
          config = function()
            g['fern#renderer'] = "nerdfont"
          end
        },
        -- アイコン類
        {
          'lambdalisue/glyph-palette.vim',
          vim.cmd [[
            augroup my-glyph-palette
              autocmd! *
              autocmd FileType fern call glyph_palette#apply()
              autocmd FileType nerdtree,startify call glyph_palette#apply()
            augroup END
          ]]
        },
        -- fernをデフォルトのエクスプローラーに
        {'lambdalisue/fern-hijack.vim'},
        -- git statusを表示
        {
          'lambdalisue/fern-git-status.vim',
          vim.cmd [[
            highlight GitGutterAdd ctermfg=green
            highlight GitGutterChange ctermfg=blue
            highlight GitGutterDelete ctermfg=red
          ]]
        },
        -- ファイルのプレビュー
        {
          'yuki-yano/fern-preview.vim',
          vim.cmd [[
            function! s:init_fern() abort
              nmap <buffer> ss <Plug>(fern-action-open:select
              nmap <silent> <buffer> p     <Plug>(fern-action-preview:toggle)
              nmap <silent> <buffer> <C-p> <Plug>(fern-action-preview:auto:toggle)
              nmap <silent> <buffer> <C-d> <Plug>(fern-action-preview:scroll:down:half)
              nmap <silent> <buffer> <C-u> <Plug>(fern-action-preview:scroll:up:half)
            endfunction

            augroup fern-custom
              autocmd! *
              autocmd FileType fern call s:init_fern()
            augroup END
          ]]
        }
      },
      keys = {
        { "<F2>", ":Fern . -reveal=% -drawer -toggle -width=40<CR>"},
        { "<F3>", ":Fern . -reveal=% -drawer -toggle -width=40<CR>"},
      },
  },
})
