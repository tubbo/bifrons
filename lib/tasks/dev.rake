namespace :dev do
  desc "Pull in changes from each submodule"
  task :update_submodules do
    sh "git submodule foreach 'git reset --hard HEAD >> /dev/null && git pull origin master >> /dev/null && git clean -f >> /dev/null' >> /dev/null"
    puts "Pulled in changes from each submodule"
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


