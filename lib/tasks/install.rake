namespace :install do
  # Plugin installer
  %w(color lang tool).each do |type|
    desc "Installs a plugin into #{type}s/"
    task :"#{type}" do
      repo    = ARGV[0] # must end in .git
      plugin  = ARGV[1] || repo.gsub(/htt(p|ps)\:\/\/(.*)\/|git\:\/\/(.*)\/|.git/, '')
      sh "git submodule add #{repo} #{type}s/#{plugin}"
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
