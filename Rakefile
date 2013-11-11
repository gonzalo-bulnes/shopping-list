require 'rubygems'
require 'cucumber'
require 'cucumber/rake/task'

task :default do
  puts "Nothing to do!"
end

Cucumber::Rake::Task.new(:cucumber) do |t|
  t.cucumber_opts = "features --format pretty"
end
