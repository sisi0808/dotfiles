-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Example configs: https://github.com/LunarVim/starter.lvim
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny
-- map functions

-- Base settings

_G["map"] = function(mode, lhs, rhs, opt)
  vim.keymap.set(mode, lhs, rhs, opt or { silent = true })
end

for _, mode in pairs({ "n", "v", "i", "o", "c", "t", "x", "t" }) do
  _G[mode .. "map"] = function(lhs, rhs, opt)
    map(mode, lhs, rhs, opt)
  end
end

local g = vim.g
local o = vim.o
local opt = vim.opt
local cmd = vim.cmd
local fn = vim.fn
local api = vim.api

local lb = lvim.builtin
local lkn = lvim.keys.normal_mode
local lbw = lvim.builtin.which_key.mappings

-- Option setting
--
-- タブ、インテンド
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true
opt.tabstop = 2
opt.shiftwidth = 2

-- 表示、見た目
opt.relativenumber = true

-- カーソルを常に中央に表示
opt.so = 999
-- opt.so = 0

-- 行末への移動
opt.backspace = "indent,eol,start"
opt.virtualedit = "onemore"

-- 検索
opt.ignorecase = true
opt.smartcase = true
opt.wrapscan = true
opt.incsearch = true
opt.hlsearch = true

-- ヘルプを日本語で
opt.helplang = "ja"

-- digraph setting
cmd [[
  " 12354 => "あ"
  digraph aa 12354
  digraph ii 12356
  digraph uu 12358
  digraph ee 12360
  digraph oo 12362

  " 12450 => "ア"
  digraph Aa 12450
  digraph Ii 12452
  digraph Uu 12454
  digraph Ee 12456
  digraph Oo 12458

  " ん、ン
  digraph nn 12435
  digraph Nn 12531

  " カッコ
  digraphs j( 65288  " （
  digraphs j) 65289  " ）
  digraphs j[ 12300  " 「
  digraphs j] 12301  " 」
  digraphs j{ 12302  " 『
  digraphs j} 12303  " 』
  digraphs j< 12304  " 【
  digraphs j> 12305  " 】

  " 句読点
  digraphs j, 65292  " ，
  digraphs j. 65294  " ．
  digraphs j! 65281  " ！
  digraphs j? 65311  " ？
  digraphs j: 65306  " ：

  digraphs jj 106  " j
]]

-- KeyBind

-- ウィンドウ操作
lkn["<C-h>"] = false
lkn["<C-j>"] = false
lkn["<C-k>"] = false
lkn["<C-l>"] = false

lkn["sh"] = "<C-w>h"
lkn["sj"] = "<C-w>j"
lkn["sk"] = "<C-w>k"
lkn["sl"] = "<C-w>l"

lkn["sH"] = "<C-w>H"
lkn["sJ"] = "<C-w>J"
lkn["sK"] = "<C-w>K"
lkn["sL"] = "<C-w>L"

-- インデントを揃えたペースト
lkn["p"] = "]p"
lkn["P"] = "]P"

-- 空行を挿入
lkn["<Space>o"] = "o<ESC>k"
lkn["<Space>O"] = "O<ESC>j"

-- Digraph設定
lkn["fj"] = "f<C-k>"
lkn["Fj"] = "F<C-k>"
lkn["tj"] = "t<C-k>"
lkn["Tj"] = "T<C-k>"

-- 検索後にEscを二回打ったら検索ワードのマーカーが消える
lkn["<Esc><Esc>"] = ":nohlsearch<CR><Esc>"

-- Plugins settings
-- Core Plugin
lbw["t"] = {
  name = "Toggle Term",
  t = { ":FloatermToggle<CR>", "Toggle terminal" },
  n = { ":FloatermNew<CR>", "New terminal" },
  c = { ":FloatermKill<CR>", "Kill terminal" },
  o = { ":FloatermOnly<CR>", "Only terminal" },
  h = { ":FloatermPrev<CR>", "Prev terminal" },
  l = { ":FloatermNext<CR>", "Next terminal" },
}

-- colorscheme
lvim.colorscheme = "gruvbox"

-- Copilot(cmpの中に紛れ込んでくれる)
table.insert(lvim.plugins, {
  "zbirenbaum/copilot-cmp",
  event = "InsertEnter",
  dependencies = { "zbirenbaum/copilot.lua" },
  config = function()
    vim.defer_fn(function()
      require("copilot").setup() -- https://github.com/zbirenbaum/copilot.lua/blob/master/README.md#setup-and-configuration
      require("copilot_cmp").setup() -- https://github.com/zbirenbaum/copilot-cmp/blob/master/README.md#configuration
    end, 100)
  end,
})

-- 無効化
lb.indentlines.active = false
lvim.builtin.nvimtree.active = false
-- ファイラーを開く
lbw["e"] = {}
-- ハイライトを無効化
lbw["h"] = {}

-- Buffer操作
lbw["b"] = {}
lkn["<M-c>"] = ":BufferKill<CR>"
lkn["<M-,>"] = ":BufferLineCyclePrev<CR>"
lkn["<M-.>"] = ":BufferLineCycleNext<CR>"
lkn["<M-<>"] = ":BufferLineMovePrev<CR>"
lkn["<M->>"] = ":BufferLineMoveNext<CR>"

-- telescope
lb.telescope.on_config_done = function(telescope)
  pcall(telescope.load_extension, "frecency")
  pcall(telescope.load_extension, "neoclip")
  -- any other extensions loading
end

-- lbw["f"] = {}
-- lkn["<Space><Space>"] = ":Telescope find_files find_command=rg,--files,--hidden,--glob,!*.git <CR>"
-- lbw["<Space>"] = {
--  ":Telescope find_files find_command=rg,--files,--hidden,--glob,!*.git <CR>", "File"
-- }
-- lkn["<Space>ff"] = ":Telescope frecency<CR>"
-- lkn["<Space>fg"] = ":Telescope live_grep<CR>"
-- lkn["<Space>fb"] = ":Telescope current_buffer_fuzzy_find<CR>"
-- lkn["<Space>fh"] = ":Telescope help_tags<CR>"

-- User Plugin
lvim.plugins = {
  -- カラースキーム
  "ellisonleao/gruvbox.nvim",
   -- 行内のf文字ハイライト
  "unblevable/quick-scope",
  -- ヘルプ日本語化
  "vim-jp/vimdoc-ja",
  -- 画面移動の滑らか化
  "yuttie/comfortable-motion.vim",
  -- quick fixウインドウの一括置換
  "thinca/vim-qfreplace",
  -- ポップアップ(UI)をカスタマイズ
  {
    "stevearc/dressing.nvim",
    config = function()
      require("dressing").setup({
        input = { enabled = false },
      })
    end,
  },
  -- インデント可視化
    {
      "lukas-reineke/indent-blankline.nvim",
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
  -- セッション管理
  {
    "olimorris/persisted.nvim",
    -- event = "BufReadPre",
    -- event = "VeryLazy",
    lazy = false,
    opts = { options = { "buffers", "curdir", "tabpages", "winsize", "help", "globals", "skiprtp" } },
    -- stylua: ignore
    keys = {
      { "<Space>qs", function() require("persisted").load() end, desc = "Restore Session" },
      { "<Space>ql", function() require("persisted").load({ last = true }) end, desc = "Restore Last Session" },
      { "<Space>qd", function() require("persisted").stop() end, desc = "Don't Save Current Session" },
    },
    config = function()
      require("persisted").setup({
        save_dir = fn.expand(fn.stdpath("data") .. "/sessions/"), -- directory where session files are saved
        silent = false, -- silent nvim message when sourcing session file
        use_git_branch = false, -- create session files based on the branch of the git enabled repository
        autosave = true, -- automatically save session files when exiting Neovim
        -- should_autosave = nil, -- function to determine if a session should be autosaved
        should_autosave = function()
        -- do not autosave if the alpha dashboard is the current filetype
          if vim.bo.filetype == "alpha" then
            return false
          end
          return true
        end,
        -- autoload = true, -- automatically load the session for the cwd on Neovim startup
        on_autoload_no_session = function()
          vim.notify("No existing session to load.")
        end,
        follow_cwd = true, -- change session file name to match current working directory if it changes
        allowed_dirs = nil, -- table of dirs that the plugin will auto-save and auto-load from
        ignored_dirs = nil, -- table of dirs that are ignored when auto-saving and auto-loading<F3>
        telescope = { -- options for the telescope extension
          reset_prompt_after_deletion = true, -- whether to reset prompt after session deleted
        },
      })
    end
  },
  -- Registerを拡張
  {
    "tversteeg/registers.nvim",
    config = function()
      require("registers").setup()
    end
  },
  -- Escで日本語->英語
  {
    "brglng/vim-im-select",
    config = function()
      g["im_select_default"] = "com.apple.inputmethod.Kotoeri.RomajiTyping.Roman"
    end
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
      -- { 'ss', ':HopChar2MW<CR>' }
    },
    config = function()
      require('hop').setup({
        keys = 'etovxqpdygfblzhckisuran'
      })
    end
  },
  -- ファイラー
  {
    'lambdalisue/fern.vim',
    -- lazy=false,
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
      {
        'lambdalisue/fern-hijack.vim',
        config = function()
          api.nvim_set_var('loaded_netrwPlugin', 1)
        end
      },
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
}