-- Call Script
-- alias to vim's objects
g = vim.g
o = vim.o
opt = vim.opt
cmd = vim.cmd
fn = vim.fn
api = vim.api

-- map functions
_G['map'] = function(mode, lhs, rhs, opt)
  vim.keymap.set(mode, lhs, rhs, opt or { silent = true })
end

for _, mode in pairs({ 'n', 'v', 'i', 'o', 'c', 't', 'x', 't' }) do
  _G[mode .. 'map'] = function(lhs, rhs, opt)
    map(mode, lhs, rhs, opt)
  end
end
