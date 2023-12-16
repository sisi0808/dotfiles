-- %の移動を強化
return {
  "andymass/vim-matchup",
  setup = function()
    g.matchup_matchparen_offscreen = { method = "popup" }
  end,
}
