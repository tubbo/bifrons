""
"" Janus setup
""

" Define paths. We always use the .vim dir.
let g:janus_path = expand("~/.vim")
let g:janus_vim_path = expand("~/.vim")
let g:janus_custom_path = expand("~/.janus")

" Load Janus core
exe 'source ' . g:janus_vim_path . '/core/before/plugin/janus.vim'


" Load Pathogen groups. Processed in reverse order.
call janus#add_group("tools")
call janus#add_group("langs")
call janus#add_group("colors")

" Disable plugins prior to loading pathogen
let g:pathogen_disabled = []

" Load plugins with Pathogen
exe 'source ' . g:janus_vim_path . '/core/plugins.vim'
call janus#load_pathogen()

" ZSH is the greatest shell in the history of the universe.
set shell=zsh

" Search highlighting, only done by request and easy to get rid of.
set nohlsearch
nnoremap <C-L> :set hlsearch!<cr>
nnoremap <C-l> :nohl<cr>

" CTags, hit Ctrl+H to browse them, Ctrl+H,N to iterate through findings, and Ctrl+Shift+H to go
" directly to the first tag found
vmap <C-h> <C-]>
nnoremap <C-h>n :tnext<cr>
nnoremap <C-h>s :tselect<cr>

" Soft word wrap, by default using 2 spaces to conform with eLocal.
set wrap
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set list listchars=tab:\ \ ,trail:·
set tw=100
set ai    " Auto indent
set si    " Smart indent


" MacVim shift+arrow-keys behavior (required in .vimrc)
let macvim_hig_shift_movement = 1

" Show (partial) command in the status line
set showcmd

" Autocommands
augroup vimrcEx
  " Clear all autocmds in the group
  autocmd!

  " Whenever we're writing text, like comments, make the width mo more
  " than 72 characters. This is to ensure maximum readability of
  " documentation with things like CTags.
  autocmd FileType text setlocal textwidth=72

  " Jump to last cursor position unless it's invalid or in an event handler
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  " In Ruby, autoindent with two spaces, always expand tabs
  autocmd FileType ruby,haml,eruby,yaml,html,javascript,sass,cucumber set ai sw=2 sts=2 et

  " In Python, maintain strict 4-space indents and don't word wrap
  autocmd FileType python set sw=4 sts=4 set wrap=off

  " Alternative Sass extensions
  autocmd! BufRead,BufNewFile *.sass setfiletype sass

  " Alternative Markdown extensions
  autocmd BufRead *.mkd  set ai formatoptions=tcroqn2 comments=n:&gt;
  autocmd BufRead *.markdown  set ai formatoptions=tcroqn2 comments=n:&gt;

  " Indent <p> tags inherently
  autocmd FileType html,eruby if g:html_indent_tags !~ '\\|p\>' | let g:html_indent_tags .= '\|p\|li\|dt\|dd' | endif

  " Uncomment this to turn off Markdown syntax highlighting
  "autocmd! FileType mkd setlocal syn=off
augroup END


" When there's no text behind it, tab indents. When there is, tab
" autocompletes.
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>
inoremap <s-tab> <c-n>

" automatically reload vimrc when it's saved
au BufWritePost .vimrc so ~/.vimrc

" strip whitespace
autocmd BufWritePre *.py :%s/\s\+$//e

" Include user's local vim config
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif

" No sound on errors
set noerrorbells
set novisualbell

" Turn backups off since we store everything in Git
set nobackup
set nowb
set noswapfile

" Persistent undo
try
    if MySys() == "windows"
      set undodir=C:\Windows\Temp
    else
      set undodir=~/.vim_runtime/undodir
    endif

    set undofile
catch
endtry

" Skip bullshit directories
let Grep_Skip_Dirs = 'RCS CVS SCCS .svn generated .sass-cache .git'
set grepprg=/bin/grep\ -nH

" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>
