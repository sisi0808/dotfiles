-- バッファ・タブバーをかっこよく
return {
  'romgrk/barbar.nvim',
  dependencies = {
    'lewis6991/gitsigns.nvim',
    'nvim-web-devicons'
  },
  -- event = {'BufNewFile', 'BufRead'},
  lazy = false,
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
}
