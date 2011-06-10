# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)
require 'rake'

# http://stackoverflow.com/questions/5287121/undefined-method-task-using-rake-0-9-0-beta-4
module ::Weblinda
  class Application
    include Rake::DSL
  end
end

module ::RakeFileUtils
  extend Rake::FileUtilsExt
end

Weblinda::Application.load_tasks

task :deploy => [:github, :heroku]

task :github do
  system 'git push origin master'
end

task :heroku do
  system 'heroku jammit:deploy --app weblinda'
end
