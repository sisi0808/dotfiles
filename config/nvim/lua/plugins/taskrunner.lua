-- タスクランナー
return {
  'stevearc/overseer.nvim',
  opts = {},
  keys = {
    { '<leader>tt', ':OverseerOpen<CR>' },
    { '<leader>tr', ':OverseerRun<CR>' },
  }
}
