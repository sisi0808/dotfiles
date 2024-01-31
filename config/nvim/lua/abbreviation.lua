vim.cmd([[
  "" insert
  iabbrev improt import
  iabbrev asn ans

  "" command
  cnoreabbrev <expr> s getcmdtype() .. getcmdline() ==# ":s" ? "%s///g<Left><Left>" : "s"
]])
