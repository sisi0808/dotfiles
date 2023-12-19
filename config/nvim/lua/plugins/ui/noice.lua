-- 通知のポップアップをかっこよく
return {
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = {
    -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    "MunifTanjim/nui.nvim",
    -- OPTIONAL:
    --   `nvim-notify` is only needed, if you want to use the notification view.
    --   If not available, we use `mini` as the fallback
    "rcarriga/nvim-notify",
  },
  config = function()
    require("noice").setup({
      messages = {
        enabled = false
        -- view = "messages"
        -- excluded_filetypes = {"fern"}
      },
      lsp = {
        -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
      },
      -- you can enable a preset for easier configuration
      -- presets = {
        -- long_message_to_split = true, -- long messages will be sent to a split
        -- inc_rename = false, -- enables an input dialog for inc-rename.nvim
        -- lsp_doc_border = false, -- add a border to hover docs and signature help
      -- },
    })
  end,
  keys = {
    {"<leader>nn", ":Noice<CR>", desc="Noice", silent=true },
    {"<leader>ne", ":NoiceErrors<CR>", desc="Errors", silent=true },
    {"<leader>nh", ":NoiceHistory<CR>", desc="History", silent=true },
    {"<leader>nl", ":NoiceLast<CR>", desc="Last", silent=true }
  }
}
