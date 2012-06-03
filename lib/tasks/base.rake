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

desc "Update to the latest HEAD from git"
task :update do
  Rake::Task[:clean].invoke

  ['origin', `git config github.user`.strip].each do |remote|
    puts "Pulling latest changes"
    `git pull #{remote} master > /dev/null`
    Rake::Task[:clean].invoke
  end

  puts "Synchronising submodule urls"
  `git submodule sync > /dev/null`

  puts "Updating the submodules"
  `git submodule update --init > /dev/null`
end

desc "Get the Vim folder ready for Janus."
task :configure => [:folders, :link_vim_conf_files]

desc "Update Janus."
task :default => [:update]

