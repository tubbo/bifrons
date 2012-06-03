ROOT_PATH = File.expand_path(File.join(File.dirname(__FILE__)))
$: << File.join(ROOT_PATH, 'ruby')

require 'janus'
require 'fileutils'
include Janus

desc "Link Vim configuration."
task :link_vim_conf_files do
  %w[ vimrc gvimrc ].each do |file|
    dest = expand("~/.#{file}")
    unless File.exist?(dest)
      ln_s(expand("../#{file}", __FILE__), dest)
    end
  end
end

namespace :dev do
  desc "Pull in changes from each submodule"
  task :update_submodules do
    sh "git submodule foreach git pull origin master"
    sh "git submodule foreach git add ."
  end

  # Taken from RefineryCMS
  # https://github.com/resolve/refinerycms/blob/master/core/lib/tasks/refinery.rake
  desc "Removes trailing whitespace across the entire application."
  task :whitespace do
    require 'rbconfig'

    if RbConfig::CONFIG['host_os'] =~ /linux/
      sh %{find . -name '*.*rb' -o -name '*.*vim' -exec sed -i 's/\t/ /g' {} \\; -exec sed -i 's/ *$//g' {} \\; }
    elsif RbConfig::CONFIG['host_os'] =~ /darwin/
      sh %{find . -name '*.*rb' -o -name '*.*vim' -exec sed -i '' 's/\t/ /g' {} \\; -exec sed -i '' 's/ *$//g' {} \\; }
    else
      puts "This doesn't work on systems other than OSX or Linux. Please use a custom whitespace tool for your platform '#{RbConfig::CONFIG["host_os"]}'."
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

namespace :install do
  # Plugin installer
  %w(color lang tool).each do |type|
    desc "Installs a plugin into #{type.pluralize}/"
    task :"#{type}" do
      repo    = ARGV[0] # must end in .git
      plugin  = ARGV[1] || repo.gsub(/htt(p|ps)\:\/\/(.*)\/|git\:\/\/(.*)\/|.git/, '')
      sh "git submodule add #{repo} #{type}/#{plugin}"
    end
  end

  desc "Install 3rd-party dependencies with Homebrew and Bundler."
  task :dependencies do
    if !`where #{program}`.match("not found")
      %w(ack ctags git).each do |program|
        sh "brew install #{program}" if !!`where #{program}`.match("not found")
      end
    else
      puts "Warning: 3rd-party dependencies were not installed. Please install ack, ctags and git yourself."
    end

    sh "bundle install"
  end
end
