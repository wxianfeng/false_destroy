#!/usr/bin/env rake
$:.push File.expand_path("../lib", __FILE__)
require 'active_model'
require 'active_record'
require 'rails'
require 'false_destroy'

begin
  require 'bundler/setup'
rescue LoadError
  puts 'You must `gem install bundler` and `bundle install` to run rake tasks'
end
begin
  require 'rdoc/task'
rescue LoadError
  require 'rdoc/rdoc'
  require 'rake/rdoctask'
  RDoc::Task = Rake::RDocTask
end

RDoc::Task.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'FalseDestroy'
  rdoc.options << '--line-numbers'
  rdoc.rdoc_files.include('README.md')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

# Bundler::GemHelper.install_tasks

require 'rake/testtask'

Rake::TestTask.new(:spec) do |t|
  t.libs << 'lib'
  t.libs << 'spec'
  t.pattern = 'sepc/**/*_spec.rb'
  t.verbose = false
end

task :build do
  system "gem build false_destroy.gemspec"
end

task :install => :build do
  system "gem install false_destroy-#{FalseDestroy::VERSION}.gem"
end

task :release => :build do
  puts "Tagging #{FalseDestroy::VERSION}..."
  system "git tag -a #{FalseDestroy::VERSION} -m 'Tagging #{FalseDestroy::VERSION}'"
  puts "Pushing to Github..."
  system "git push --tags"
end

task :default => :spec
