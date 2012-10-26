"" tubbo's gvimrc
""
"" configuration specific to MacVim

" Solarized is always the best color scheme
colorscheme solarized
set background=light " hit tab to toggle
set guifont=Monaco:\h14
call togglebg#map("<tab>")

" Map Cmd+N to New Tab
"macmenu &File.New\ Tab key=<D-n>
"macmenu &File.New\ Window key=<D-S-n>

if has("gui_macvim")
  set guioptions-=T
  map <D-<> :vsplit ~/.vimrc<cr>

  " CtrlP/Command-T OS-X Menu remapping
  if janus#is_plugin_enabled('command-t') || janus#is_plugin_enabled('ctrlp')
    macmenu &File.New\ Tab key=<D-S-t>
  endif

  " iTerm split window legacy bindings
  map <D-d> :vsplit<cr>
  map <D-D> :split<cr>

  " Open a new tab with a blank buffer
  map <D-n> :tabnew<cr>
endif
