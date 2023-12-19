-- 1. LSP Server management
require("mason").setup({
  ui = { border = "single" }
})
require('lspconfig.ui.windows').default_options.border = 'single'

require("mason-lspconfig").setup({
  ensure_installed = {
    "lua_ls",
    "rust_analyzer"
  },
  automatic_installation = true,
  handlers = {
    function(server)
      require('lspconfig')[server].setup({})
    end,
    rust_analyzer = function()
      require('rust-tools').setup({
        -- server = {
        --   settings = {
        --     ['rust-analyzer'] = {
        --       checkOnsave = {
        --         command = 'clippy'
        --       }
        --     }
        --   }
        -- }
      })
    end,
    lua_ls = function()
        require('rust-tools').setup({})
    end
  },
})

-- require("lspconfig").lua_ls.setup({})
-- require("lspconfig").rust_analyzer.setup({})

-- 2. LSP keymaps
nmap('ge', vim.diagnostic.open_float)
nmap('g[', vim.diagnostic.goto_prev)
nmap('g]', vim.diagnostic.goto_next)

-- lspを起動している時のみキーマップを起動
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    local opts = { noremap = true, silent = true, buffer = ev.buf }
    nmap('K', vim.lsp.buf.hover, opts)
    nmap('gd', vim.lsp.buf.definition, opts)
    nmap('gD', vim.lsp.buf.declaration, opts)
    nmap('gt', vim.lsp.buf.type_definition, opts)
    nmap('gn', vim.lsp.buf.rename, opts)
    nmap('ga', vim.lsp.buf.code_action, opts)
    nmap('gi', vim.lsp.buf.implementation, opts)
    nmap('gr', vim.lsp.buf.references, opts)
    nmap('gf', function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end
})

-- 3. Cmp settings
local cmp = require("cmp")
cmp.setup({

  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },

  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },

  formatting = {
    format = require("lspkind").cmp_format({
      mode = 'symbol',
      maxwidth = 50,
      ellipsis_char = '...',

      -- before = function(entry, vim_item)
      --   return vim_item
      -- end
    })
  },

  sources = cmp.config.sources({
    { name = 'copilot' },
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'nvim_lsp_signature_help' },
    { name = 'calc' },
  }, {
    { name = 'buffer', keyword_length = 2 },
    { name = "path" },
    -- { name = "cmdline" },
  }),

  mapping = cmp.mapping.preset.insert({
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-u>'] = cmp.mapping.scroll_docs(4),

    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<Down>'] = cmp.mapping.select_next_item(),
    ['<Tab>'] = cmp.mapping.select_next_item(),

    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<Up>'] = cmp.mapping.select_prev_item(),
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),

    ['<C-j>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm { select = true },
  })
})

cmp.setup.cmdline({ '/', '?' }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'nvim_lsp_document_symbol' }
  },
  {
    { name = 'buffer' }
  }
})

cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline', keyword_length = 2 }
  })
})

-- require("mason-lspconfig").setup_handlers({
--   function(server)
--     local opt = {
--       capabilities = require("cmp_nvim_lsp").default_capabilities()
--     }
--     require('lspconfig')[server].setup(opt)
--
--     rust_analyzer = function()
--       require('rust-tools').setup({})
--     end,
--   end,
-- })
