
" Bind Cmd+T in MacVim
if has("gui_macvim") && has("gui_running")
  call janus#add_mapping('ctrlp', 'map', '<C-t>',   ':CtrlP<CR>')
  call janus#add_mapping('ctrlp', 'map', '<D-t>',   ':tabnew\|:CtrlP<CR>')

  call janus#add_mapping('ctrlp', 'imap', '<C-t>',  '<ESC>:CtrlP<CR>')
  call janus#add_mapping('ctrlp', 'imap', '<D-t>',  '<ESC>:tabnew\|:CtrlP<CR>')
endif
