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
        require("mason").setup()
      end
    },
  },
  config = function()
    require("mason-lspconfig").setup({
      ensure_installed = {
        -- "lua_ls",
      },
    })
  end,
  keys = {
    {"<leader>l", ":Mason<CR>"}
  }
}
