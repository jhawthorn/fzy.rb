require "bundler/gem_tasks"
require "rake/extensiontask"

task :build => :compile

Rake::ExtensionTask.new("fzy") do |ext|
  ext.lib_dir = "lib/fzy"
end

task :default => [:clobber, :compile, :spec]
