"" tubbo's gvimrc
""
"" configuration specific to MacVim

" CtrlP OS-X Menu remapping
if janus#is_plugin_enabled('ctrlp') && has("gui_macvim")
  macmenu &File.New\ Tab key=<D-S-t>
endif

" Solarized is the best color scheme for you.
colorscheme solarized
set background=light
set guifont=Monaco:\h14
call togglebg#map("<tab>")

" Remove the Toolbar guioption by default
set go-=T
