"" tubbo's gvimrc
""
"" configuration specific to MacVim

" Solarized is the best color scheme for you.
colorscheme solarized
set background=light
set guifont=Monaco:\h14
call togglebg#map("<tab>")

" Remove the Toolbar guioption by default
set go-=T

" Map Cmd+N to New Tab
macmenu &File.New\ Tab key=<D-n>
macmenu &File.New\ Window key=<D-S-n>
