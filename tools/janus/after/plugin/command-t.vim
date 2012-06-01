" Set global variables
if janus#is_plugin_enabled("command-t")
  let g:commandt_map = ''
  let g:commandt_custom_ignore = {
    \ 'dir':  '\.git$\|\.hg$\|\.svn$',
    \ 'file': '\.pyc$\|\.pyo$\|\.rbc$|\.rbo$\|\.class$\|\.o$\|\~$\',
    \ }
endif

" Add Rails bindings if we're in a Rails app.
if filereadable(expand("config/environment.rb"))
  call janus#add_mapping('command-t', 'map', '<C-g>v',    ':CommandTFlush<cr>\|:CommandT app/views<cr>')
  call janus#add_mapping('command-t', 'imap', '<C-g>v',    ':CommandTFlush<cr>\|:CommandT app/views<cr>')

  call janus#add_mapping('command-t', 'map', '<C-g>c',    ':CommandTFlush<cr>\|:CommandT app/controllers<cr>')
  call janus#add_mapping('command-t', 'imap', '<C-g>c',    ':CommandTFlush<cr>\|:CommandT app/controllers<cr>')

  call janus#add_mapping('command-t', 'map', '<C-g>m',    ':CommandTFlush<cr>\|:CommandT app/models<cr>')
  call janus#add_mapping('command-t', 'imap', '<C-g>m',    ':CommandTFlush<cr>\|:CommandT app/models<cr>')

  call janus#add_mapping('command-t', 'map', '<C-g>h',    ':CommandTFlush<cr>\|:CommandT app/helpers<cr>')
  call janus#add_mapping('command-t', 'imap', '<C-g>h',    ':CommandTFlush<cr>\|:CommandT app/helpers<cr>')

  call janus#add_mapping('command-t', 'map', '<C-g>l',    ':CommandTFlush<cr>\|:CommandT lib<cr>')
  call janus#add_mapping('command-t', 'imap', '<C-g>l',    ':CommandTFlush<cr>\|:CommandT lib<cr>')

  call janus#add_mapping('command-t', 'map', '<C-g>r',    ':CommandTFlush<cr>\|:CommandT lib/tasks<cr>')
  call janus#add_mapping('command-t', 'imap', '<C-g>r',    ':CommandTFlush<cr>\|:CommandT lib/tasks<cr>')

  call janus#add_mapping('command-t', 'map', '<C-g>t',    ':CommandTFlush<cr>\|:CommandT test<cr>')
  call janus#add_mapping('command-t', 'imap', '<C-g>t',    ':CommandTFlush<cr>\|:CommandT test<cr>')

  call janus#add_mapping('command-t', 'map', '<C-g>u',    ':CommandTFlush<cr>\|:CommandT test/unit<cr>')
  call janus#add_mapping('command-t', 'imap', '<C-g>u',    ':CommandTFlush<cr>\|:CommandT test/unit<cr>')

  call janus#add_mapping('command-t', 'map', '<C-g>f',    ':CommandTFlush<cr>\|:CommandT test/functional<cr>')
  call janus#add_mapping('command-t', 'imap', '<C-g>f',    ':CommandTFlush<cr>\|:CommandT test/functional<cr>')

  call janus#add_mapping('command-t', 'map', '<C-g>i',    ':CommandTFlush<cr>\|:CommandT test/integration<cr>')
  call janus#add_mapping('command-t', 'imap', '<C-g>i',    ':CommandTFlush<cr>\|:CommandT test/integration<cr>')

  call janus#add_mapping('command-t', 'map', '<C-g>a',    ':CommandTFlush<cr>\|:CommandT app/assets<cr>'
  call janus#add_mapping('command-t', 'imap', '<C-g>a',    ':CommandTFlush<cr>\|:CommandT app/assets<cr>'

  call janus#add_mapping('command-t', 'map', '<C-g>s',    ':CommandTFlush<cr>\|:CommandT app/assets/stylesheets<cr>' 
  call janus#add_mapping('command-t', 'imap', '<C-g>s',    ':CommandTFlush<cr>\|:CommandT app/assets/stylesheets<cr>' 

  call janus#add_mapping('command-t', 'map', '<C-g>j',    ':CommandTFlush<cr>\|:CommandT app/assets/javascripts<cr>'
  call janus#add_mapping('command-t', 'imap', '<C-g>j',    ':CommandTFlush<cr>\|:CommandT app/assets/javascripts<cr>'

  call janus#add_mapping('command-t', 'map', '<C-g>p',    ':CommandTFlush<cr>\|:CommandT public<cr>'
  call janus#add_mapping('command-t', 'imap', '<C-g>p',    ':CommandTFlush<cr>\|:CommandT public<cr>'
endif

" Bind Cmd+T in MacVim
if has("gui_macvim") && has("gui_running")
  call janus#add_mapping('command-t', 'map', '<C-t>',   ':CommandT<CR>')
  call janus#add_mapping('command-t', 'imap', '<C-t>',  '<ESC>:CommandT<CR>')
endif
