-- Gitの差分表示
return {
  'lewis6991/gitsigns.nvim',
  config = function()
  require('gitsigns').setup()
    require('gitsigns').setup {
      signs = {
        add          = { text = '+' },
        change       = { text = '~' },
        delete       = { text = '_' },
        topdelete    = { text = '‾' },
        changedelete = { text = '~_' },
      },
      current_line_blame = true,
    }
  end
}
