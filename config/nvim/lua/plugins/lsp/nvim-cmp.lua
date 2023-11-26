--  補完を行うcmpの大元
return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    -- アイコン
    "onsails/lspkind.nvim",
    -- スニペット
    -- "hrsh7th/vim-vsnip",
    "L3MON4D3/LuaSnip",
    -- cmpをlspから引っ張ってくる
    "hrsh7th/cmp-nvim-lsp",
    -- パス名を補完で出す
    "hrsh7th/cmp-path",
    -- バッファにある単語を補完で出す
    "hrsh7th/cmp-buffer",
    -- コマンドラインモードでの補完
    "hrsh7th/cmp-cmdline",
  },
  config = function()
    local cmp = require("cmp")
    cmp.setup({ 
      snippet = {
        expand = function(args)
          -- vim.fn["vsnip#anonymous"](args.body) 
        require('luasnip').lsp_expand(args.body)
        end,
      },
      -- window = {
      --   completion = cmp.config.window.bordered(),
      --   documentation = cmp.config.window.bordered(),
      -- },
      sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        -- { name = 'vsnip' }, -- For vsnip users.
        { name = 'luasnip' }, -- For luasnip users.
      }, {
        { name = 'buffer' },
        { name = "path" },
        -- { name = "cmdline" },
      }),
      formatting = {
        format = require("lspkind").cmp_format({
          mode = 'symbol', 
          maxwidth = 50, 
          ellipsis_char = '...', 

          before = function (entry, vim_item)
            return vim_item
          end
        })
      },
      mapping = cmp.mapping.preset.insert({
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-u>'] = cmp.mapping.scroll_docs(4),
        ["<C-p>"] = cmp.mapping.select_prev_item(),
        ["<C-n>"] = cmp.mapping.select_next_item(),
        ['<C-j>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm { select = true },
      })
    })

    cmp.setup.cmdline({ '/', '?' }, {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = 'buffer' }
      }
    })

    cmp.setup.cmdline(':', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = 'path' }
      }, {
        { name = 'cmdline' }
      })
    })
  end
}
