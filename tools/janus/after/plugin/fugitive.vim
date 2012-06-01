" Janus mappings
call janus#add_mapping('fugitive', 'nmap', '<leader>gb', ':Gblame<CR>')
call janus#add_mapping('fugitive', 'nmap', '<leader>gs', ':Gstatus<CR>')
call janus#add_mapping('fugitive', 'nmap', '<leader>gd', ':Gdiff<CR>')
call janus#add_mapping('fugitive', 'nmap', '<leader>gl', ':Glog<CR>')
call janus#add_mapping('fugitive', 'nmap', '<leader>gc', ':Gcommit<CR>')
call janus#add_mapping('fugitive', 'nmap', '<leader>gp', ':Git push<CR>')

" Map Cmd|<leader> + F if set in .vimrc
if has("gui_macvim") && has("gui_running")
  " Command-Shift-F on OSX
  call janus#add_mapping('fugitive', 'map', '<D-F>', ':Ggrep<space>')
else
  " Define <C-F> to a dummy value to see if it would set <C-f> as well.
  map <C-F> :dummy

  if maparg("<C-f>") == ":dummy"
    " <leader>f on systems where <C-f> == <C-F>
    call janus#add_mapping('fugitive', 'map', '<leader>f', ':Ggrep<space>')
  else
    " <C-F> if we can still map <C-f> to <S-Down>
    call janus#add_mapping('fugitive', 'map', '<C-F>', ':Ggrep<space>')
  endif

  map <C-f> <S-Down>
endif

" Open all files git thinks have changed.
function! OpenChangedFiles()
  only " Close all windows, unless they're modified
  let status = system('git status -s | grep "^ \?\(M\|A\)" | cut -d " " -f 3')
  let filenames = split(status, "\n")
  exec "edit " . filenames[0]
  for filename in filenames[1:]
    exec "sp " . filename
  endfor
endfunction

command! OpenChangedFiles :call OpenChangedFiles()
map <C-d> :OpenChangedFiles <cr>a

