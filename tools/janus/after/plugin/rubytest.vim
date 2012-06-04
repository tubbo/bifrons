" Ctrl+j opens test files. Add Shift to open in a new split window
call janus#add_mapping("rubytest", "map", "<C-j>", ":call OpenTestAlternate()")
call janus#add_mapping("rubytest", "map", "<C-J>", ":vsplit<cr>:call OpenTestAlternate()")

" Ctrl+k runs the current test file. Add Shift to run all tests.
call janus#add_mapping("rubytest", "map", "<C-k>", ":call RunTestFile()")
call janus#add_mapping("rubytest", "map", "<C-K>", ":call RunTests()")

