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
  -- ヘルプ日本語化
  'vim-jp/vimdoc-ja',
  -- 画面移動の滑らか化
  'yuttie/comfortable-motion.vim',
  -- Lazy Vim用のカラースキーム
  'ellisonleao/gruvbox.nvim', 
  -- Configure LazyVim to load gruvbox
  {
    'LazyVim/LazyVim',
    opts = {
      colorscheme = "gruvbox",
    },
  },
  -- 起動画面
  {

  },
  -- floating terminal
  {
    'voldikss/vim-floaterm',
    keys ={
      {'<leader>tt', ':FloatermToggle<CR>'},
      {'<leader>tn', ':FloatermNew<CR>'},
      {'<leader>tc', ':FloatermKill<CR>'},
      {'<leader>to', ':FloatermOnly<CR>'},
      {'<leader>th', ':FloatermPrev<CR>'},
      {'<leader>tl', ':FloatermNext<CR>'},
    }
    -- nmap('<leader>t', ':T<CR>')
  },
  -- keymapの補完表示
  {
    'folke/which-key.nvim',
    event = "VeryLazy",
    init = function()
      o.timeout = true
      o.timeoutlen = 300
    end,
    opts = {}
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
    end,

  },
  -- コメントアウト
  {
    'numToStr/Comment.nvim',
    opts = {
        -- add any options here
    },
    lazy = false,
  },
  -- セッション管理
  {
    'xolox/vim-session',
    dependencies = { 
      'xolox/vim-misc'
    },
    keys = {
      {'<leader>so', ':OpenSession<Space>'},
      {'<leader>ss', ':SaveSession<Space>'},
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
    cmd = "Copilot",
    event = "InsertEnter",
    lazy = false,
    config = function()
      require('copilot').setup({
      suggestion = {
        enabled = true,
        auto_trigger = true,
        debounce = 75,
        keymap = {
          accept = "<C-j>",
          accept_word = false,
          accept_line = false,
          next = "<M-o>",
          prev = "<M-i>",
          dismiss = "<C-]>",
        },
        },
      })
    end,
  },
  -- Gitの差分表示
  {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup({
        signs = {
          add          = { text = '+' },
          change       = { text = '~' },
          delete       = { text = '_' },
          topdelete    = { text = '‾' },
          changedelete = { text = '~_' },
        },
        current_line_blame = true,
      })
    end
  },
  -- Git操作
  {
    'lambdalisue/gin.vim',
    lazy = false,
    dependencies = {
      'vim-denops/denops.vim',
    },
    keys = {
      {'<leader>ga', ':silent Gin add .<CR>', silent=true},
      {'<leader>gc', ':silent Gin commit<CR>', silent=true},
      {'<leader>gp', ':silent Gin push<CR>', silent=true},

      {'<leader>gs', ':GinStatus <CR>'},
      {'<leader>gb', ':GinBranch <CR>'},
      {'<leader>gbr', ':GinBrowse <CR>'},
    },
    config = function ()
      g['gin_proxy_apply_without_confirm'] = 1
    end
  },
  -- Git操作
  -- brewでlazygitを事前にインストールしておく
  -- {
  --   "kdheepak/lazygit.nvim",
  --   -- optional for floating window border decoration
  --   dependencies = {
  --       "nvim-lua/plenary.nvim",
  --   },
  -- },
  -- Registerを拡張
  {
    "tversteeg/registers.nvim",
    config = function()
      require("registers").setup()
    end
  },
  -- ターミナル操作をVimで
  -- {
  --   'glacambre/firenvim',
  --
  --   -- Lazy load firenvim
  --   -- Explanation: https://github.com/folke/lazy.nvim/discussions/463#discussioncomment-4819297
  --   lazy = not vim.g.started_by_firenvim,
  --   build = function()
  --       vim.fn["firenvim#install"](0)
  --   end
  -- },
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
    -- 囲まれているものの操作
    {
      'machakann/vim-sandwich',
      config = function()
       cmd("runtime macros/sandwich/keymap/surround.vim")
      end
    },
    -- 画面内瞬間移動
    {
      'phaazon/hop.nvim',
      branch = 'v2',
      keys = {
        { 'ss', ':HopChar2MW<CR>' }
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
        'nvim-lua/plenary.nvim',
        {
          "nvim-telescope/telescope-frecency.nvim",
          config = function()
            require"telescope".load_extension("frecency")
          end,
          dependencies = {"kkharji/sqlite.lua"}
        },
      },
      keys = {
        { '<leader><leader>', ':Telescope find_files find_command=rg,--files,--hidden,--glob,!*.git <CR>' },
        { '<leader>ff', ':Telescope frecency<CR>' },
        { '<leader>fg', ':Telescope live_grep<CR>' },
        { '<leader>fb', ':Telescope current_buffer_fuzzy_find<CR>' },
        { '<leader>fh', ':Telescope help_tags<CR>' }
      }
    },
    {
      "nvim-treesitter/nvim-treesitter",
      version = false, -- last release is way too old and doesn't work on Windows
      build = ":TSUpdate",
      event = { "BufReadPost", "BufNewFile" },
      dependencies = {
        {
          "nvim-treesitter/nvim-treesitter-textobjects",
          init = function()
            -- disable rtp plugin, as we only need its queries for mini.ai
            -- In case other textobject modules are enabled, we will load them
            -- once nvim-treesitter is loaded
            require("lazy.core.loader").disable_rtp_plugin("nvim-treesitter-textobjects")
            load_textobjects = true
          end,
        },
      },
      cmd = { "TSUpdateSync" },
      keys = {
        { "<c-space>", desc = "Increment selection" },
        { "<bs>", desc = "Decrement selection", mode = "x" },
      },
      ---@type TSConfig
      opts = {
        highlight = { enable = true },
        indent = { enable = true },
        ensure_installed = {
          "bash",
          "c",
          "html",
          "javascript",
          "jsdoc",
          "json",
          "lua",
          "luadoc",
          "luap",
          "markdown",
          "markdown_inline",
          "python",
          "query",
          "regex",
          "tsx",
          "typescript",
          "vim",
          "vimdoc",
          "yaml",
        },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "<C-space>",
            node_incremental = "<C-space>",
            scope_incremental = false,
            node_decremental = "<bs>",
          },
        },
      },
      ---@param opts TSConfig
      config = function(_, opts)
        if type(opts.ensure_installed) == "table" then
          ---@type table<string, boolean>
          local added = {}
          opts.ensure_installed = vim.tbl_filter(function(lang)
            if added[lang] then
              return false
            end
            added[lang] = true
            return true
          end, opts.ensure_installed)
        end
        require("nvim-treesitter.configs").setup(opts)

        if load_textobjects then
          -- PERF: no need to load the plugin, if we only need its queries for mini.ai
          if opts.textobjects then
            for _, mod in ipairs({ "move", "select", "swap", "lsp_interop" }) do
              if opts.textobjects[mod] and opts.textobjects[mod].enable then
                local Loader = require("lazy.core.loader")
                Loader.disabled_rtp_plugins["nvim-treesitter-textobjects"] = nil
                local plugin = require("lazy.core.config").plugins["nvim-treesitter-textobjects"]
                require("lazy.core.loader").source_runtime(plugin.dir, "plugin")
                break
              end
            end
          end
        end
      end,
    },
    -- VSCode like
    {
      'neoclide/coc.nvim',
      branch = "release",
      event = "InsertEnter",
      lazy = false,
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
          "coc-lua",
          "coc-git",
          "coc-java",
          "coc-markdownlint",
          "coc-deno",
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
          ft='fern',
          config = function()
            g['fern#renderer'] = "nerdfont"
          end
        },
        -- アイコン類
        {
          'lambdalisue/glyph-palette.vim',
          ft='fern',
          config = function()
            fn['glyph_palette#apply']()
          end
        },
        -- fernをデフォルトのエクスプローラーに
        -- {'lambdalisue/fern-hijack.vim'},
        -- git statusを表示
        -- { 'lambdalisue/fern-git-status.vim' },
        -- ファイルのプレビュー
        {
          'yuki-yano/fern-preview.vim',
          ft='fern',
          -- keys = {
          --   {"p", "<Plug>(fern-action-preview:toggle)", {silent=true, buffer=true}},
          --   {"<C-p>", "<Plug>(fern-action-preview:auto:toggle)", {silent=true, buffer=true}},
          --   {"<C-d>", "<Plug>(fern-action-preview:scroll:down:half)", {silent=true, buffer=true}},
          --   {"<C-u>", "<Plug>(fern-action-preview:scroll:up:half)", {silent=true, buffer=true}},
          -- },
          cmd[[
            function! s:fern_settings() abort
              nmap <silent> <buffer> p     <Plug>(fern-action-preview:toggle)
              nmap <silent> <buffer> <C-p> <Plug>(fern-action-preview:auto:toggle)
              nmap <silent> <buffer> <C-d> <Plug>(fern-action-preview:scroll:down:half)
              nmap <silent> <buffer> <C-u> <Plug>(fern-action-preview:scroll:up:half)

              nmap <buffer> sa <Plug>(fern-action-open:select)
              nmap <buffer> ss <Plug>(fern-action-open:split)
              nmap <buffer> sd <Plug>(fern-action-open:vsplit)
            endfunction

            augroup fern-settings
              autocmd!
               autocmd FileType fern call s:fern_settings()
            augroup END
          ]]
        },
      },
      keys = {
        {"<F2>", ":Fern . -reveal=% -drawer -toggle -width=40<CR>", silent=true},
        {"<F3>", ":Fern . -reveal=% -drawer -toggle -width=40<CR>", silent=true},
        -- {"sa", "<Plug>(fern-action-open:select)", {silent=true, buffer=true}},
        -- {"ss", "<Plug>(fern-action-open:split)", {silent=true, buffer=true}},
        -- {"sd", "<Plug>(fern-action-open:vsplit)", {silent=true, buffer=true}}
      },
    },
})
