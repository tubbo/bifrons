if janus#is_plugin_enabled("vroom")
  call janus#add_mapping('vroom', 'map', '<C-j>', ':A<cr>')
endif
