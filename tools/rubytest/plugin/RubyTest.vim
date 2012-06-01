"" RubyTest
""
"" A set of commands and functions for working with Ruby tests.
"" Run tests and open corresponding tests/implementations in a
"" vertical split window. These functions were originally written
"" by Gary Bernhardt for his screencast series "Destroy All Software",
"" but they have been modified to work with Test::Unit/MiniTest.

" Open this file's corresponding test or implementation.
function! OpenTestAlternate()
  let new_file = AlternateForCurrentFile()
  exec ':e ' . new_file
endfunction

" Find the test or implementation code that corresponds with this file.
function! AlternateForCurrentFile()
  let current_file = expand("%")
  let new_file = current_file
  let in_spec = match(current_file, '^test/') != -1
  let going_to_spec = !in_spec
  let in_app = match(current_file, '\<controllers\>') != -1 || match(current_file, '\<models\>') != -1 || match(current_file, '\<views\>') != -1
  if going_to_spec
    if in_app
      let new_file = substitute(new_file, '^app/', '', '')
    end
    let new_file = substitute(new_file, '\.rb$', '_test.rb', '')
    let new_file = 'test/' . new_file
  else
    let new_file = substitute(new_file, '_test\.rb$', '.rb', '')
    let new_file = substitute(new_file, '^test/', '', '')
    if in_app
      let new_file = 'app/' . new_file
    end
  endif
  return new_file
endfunction

" Find and run the test file for the given implementation code.
function! RunTestFile(...)
    if a:0
        let command_suffix = a:1
    else
        let command_suffix = ""
    endif

    " Run the tests for the previously-marked file.
    let in_test_file = match(expand("%"), '\(.feature\|_test.rb\)$') != -1
    if in_test_file
        call SetTestFile()
    elseif !exists("t:grb_test_file")
        return
    end
    call RunTests(t:grb_test_file . command_suffix)
endfunction

" Run a single test in the file closest to the currently active line
" number.
function! RunNearestTest()
    let test_line_number = line('.')
    call RunTestFile(":" . test_line_number . " -b")
endfunction

" Set the test file for this particular implementation.
function! SetTestFile()
    let t:grb_test_file=@%
endfunction

" Write the file and run tests for the given filename.
function! RunTests(filename)
    :w
    :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
    :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
    :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
    :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
    :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
    :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
    if match(a:filename, '\.feature$') != -1
        exec ":!script/features " . a:filename
    else
        if filereadable("script/test")
            exec ":!script/test " . a:filename
        elseif filereadable("Gemfile")
            exec ":!bundle exec rspec --color " . a:filename
        else
            exec ":!rspec --color " . a:filename
        end
    end
endfunction
