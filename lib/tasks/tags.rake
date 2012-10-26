require 'bundler'
require 'rails/all'

desc "Generate CTags for every gem in the bundle. Only works with Rails for now."
task :tags do
  paths = Bundler.load.specs.map(&:full_gem_path)
  system "ctags -R -f #{Rails.root}/tags #{paths.join(' ')} #{Rails.root}"
  puts "CTags have been built."
end
