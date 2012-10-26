desc "Link Vim configuration."
task :link_vim_configuration do
  %w[ vimrc gvimrc ].each do |file|
    dest = expand("~/.#{file}")
    unless File.exist?(dest)
      ln_s(expand("../#{file}", __FILE__), dest)
    end
  end
end

desc "Create necessary folders."
task :folders do
  Janus::VIM.folders.each do |folder|
    mkdir_p folder
  end
end

desc "Remove any untracked files from the folder"
task :clean do
  puts "Cleaning the janus folder"
  `git clean -xdf -- janus &> /dev/null`
  `git ls-files --exclude-standard --others -- janus`.split("\n").each do |untracked|
    FileUtils.rm_rf File.expand_path(untracked.chomp, File.dirname(__FILE__))
  end
end

desc "Update to the latest HEAD from git"
task :update do
  Rake::Task[:clean].invoke

  puts "Pulling latest changes"
  `git pull origin master > /dev/null`
  Rake::Task[:clean].invoke

  puts "Synchronising submodule urls"
  `git submodule sync > /dev/null`

  puts "Updating the submodules"
  `git submodule update --init > /dev/null`

  puts "Resetting all submodules to the latest commit"
  Rake::Task['dev:update_submodules'].invoke
end

desc "Get the Vim folder ready for Janus."
task :configure => [:folders, :link_vim_conf_files]

desc "Update Janus."
task :default => [:update]

