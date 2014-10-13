#!/usr/bin/env rake

begin
  require 'kitchen/rake_tasks'
  Kitchen::RakeTasks.new
rescue LoadError
  puts '>>>>> Kitchen gem not loaded, omitting tasks' unless ENV['CI']
end

begin
  require 'rubocop/rake_task'
  RuboCop::RakeTask.new
rescue LoadError
  puts '>>>>> Rubocop gem not loaded, omitting tasks'
end

begin
  require 'rubocop/rake_task'
  RuboCop::RakeTask.new
rescue LoadError
  puts '>>>>> Rubocop gem not loaded, omitting tasks'
end

begin
  require 'rspec/core/rake_task'
  RSpec::Core::RakeTask.new
rescue LoadError
  puts '>>>>> Rspec gem not loaded, omitting tasks'
end

begin
  require 'foodcritic'
  FoodCritic::Rake::LintTask.new do |t|
    t.options = { fail_tags: ['any'] }
  end
rescue LoadError
  puts '>>>>> Foodcritic gem not loaded, omitting tasks'
end

desc 'For Travis CI'
task ci: [:foodcritic, :rubocop, :spec]

task default: [:ci]
