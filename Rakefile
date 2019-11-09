require "bundler/gem_tasks"
require "rake/extensiontask"
require "rake/testtask"

task :build => :compile

Rake::ExtensionTask.new("fzy") do |ext|
  ext.lib_dir = "lib/fzy"
end

Rake::TestTask.new(:test) do |t|
  t.libs << "test"
  t.libs << "lib"
  t.test_files = p(FileList["test/**/*_test.rb"])
end

task :default => [:clobber, :compile, :test]
