
# require the hydra codebase
require 'hydra'
# require the hydra rake task helpers
require 'hydra/tasks'
require 'cucumber'

Hydra::TestTask.new('hydra:cucumber') do |t|
  # add all files in the features directory that end with ".feature"
  t.add_files 'features/**/*.feature'
end