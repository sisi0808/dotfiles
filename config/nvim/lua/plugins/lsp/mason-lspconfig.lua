-- lspとmassonを紐付ける
return {
  "williamboman/mason-lspconfig.nvim",
  dependencies = {
    -- lspの設定集
    "neovim/nvim-lspconfig",
    -- lsp用のインストールマネージャー
    {
      "williamboman/mason.nvim",
      config = function()
        require("mason").setup({
          ui = {
            border = "single"
          }
        })
      end
    },
  },
  config = function()
    local mason_lspconfig = require("mason-lspconfig")
    mason_lspconfig.setup({
      ensure_installed = {
        -- "lua_ls",
      },
      automatic_installation = true
    })

    mason_lspconfig.setup_handlers({
      function(server)
        local opt = {
          capabilities = require("cmp_nvim_lsp").default_capabilities()
          -- capabilities = require('cmp_nvim_lsp').update_capabilities(
          --   vim.lsp.protocol.make_client_capabilities()
          -- )
        }
        require('lspconfig')[server].setup(opt)
      end,
    })
    require('lspconfig.ui.windows').default_options.border = 'single'
  end,
  keys = {
    {"<leader>l", ":Mason<CR>", silent = true}
  }
}
