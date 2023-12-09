-- lspとmassonを紐付ける
return {
  "williamboman/mason-lspconfig.nvim",
  lazy = false,
  -- event = 'InsertEnter',
  dependencies = {
    -- lspの設定集
    "neovim/nvim-lspconfig",
    -- lsp用のインストールマネージャー
    "williamboman/mason.nvim",
  },
  keys = {
    {"<leader>l", ":Mason<CR>", silent = true}
  }
}
