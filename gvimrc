" Use Solarized, with the 'light' variant on by default.
colorscheme solarized
set background=light

" Use Menlo font, because Monaco is too wide-spaced now.
set guifont=Menlo:\h15

" Toggle dark and light when 'tab' is struck in command mode
call togglebg#map("<tab>")

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

" Turn off italics in comments (and everywhere else).
let g:solarized_italic=0

" Disable the toolbar in MacVim.
set go-=T

" Map Cmd+N to 'New Tab', so we can use Cmd+T to open 'New Tab'
macmenu &File.New\ Tab key=<D-n>
macmenu &File.New\ Window key=<D-S-n>
