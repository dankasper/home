# Load DSL and Setup Up Stages
require 'capistrano/setup'

# Includes default deployment tasks
require 'capistrano/deploy'

# Override all tasks to run locally if ENV['LOCAL_ONLY'] is set
require './lib/capistrano/extensions/local'

require './config/dependencies'

# Loads custom tasks from `lib/capistrano/tasks' if you have any defined.
Dir.glob('lib/capistrano/tasks/*.cap').each { |r| import r }
