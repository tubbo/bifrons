" Tagbar mappings.
call janus#add_mapping('tagbar', 'map', '<Leader>rt', ':TagbarToggle<CR>')

" Invoke the next tag by simply hitting Ctrl+H
call janus#add_mapping('tagbar', 'map', '<C-H>', ':tnext<cr>')
