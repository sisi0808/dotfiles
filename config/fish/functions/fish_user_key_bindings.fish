function fish_user_key_bindings
  # fish_vi_key_bindings
  bind -M insert -m default jk backward-char force-repaint

  for mode in insert default visual
    fish_default_key_bindings -M $mode
  end
  fish_vi_key_bindings --no-erase

end
