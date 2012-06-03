ROOT_PATH = File.expand_path(File.join(File.dirname(__FILE__)))
$: << File.join(ROOT_PATH, 'lib')

require 'janus'
require 'fileutils'

include Janus

Dir["#{ROOT_PATH}/lib/tasks"].each { |rakefile| load rakefile }
