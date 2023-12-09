--  補完を行うcmpの大元
return {
  "hrsh7th/nvim-cmp",
  -- lazy = false,
  event = {'InsertEnter', 'CmdlineEnter'},
  dependencies = {
    -- アイコン
    "onsails/lspkind.nvim",
    -- スニペット
    "L3MON4D3/LuaSnip",
    -- cmpをlspから引っ張ってくる
    "hrsh7th/cmp-nvim-lsp",
    -- パス名を補完で出す
    "hrsh7th/cmp-path",
    -- バッファにある単語を補完で出す
    "hrsh7th/cmp-buffer",
    -- コマンドラインモードでの補完
    "hrsh7th/cmp-cmdline",
    -- ヘルプの補完
    "hrsh7th/cmp-nvim-lsp-signature-help",
    -- シンボルの補完
    "hrsh7th/cmp-nvim-lsp-document-symbol",
    -- 計算式の補完
    "hrsh7th/cmp-calc",
    -- copilotの補完
    "zbirenbaum/copilot-cmp"
  }
}
