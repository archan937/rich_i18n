require "bundler"
Bundler::GemHelper.install_tasks

require "rake/testtask"
require "rake/rdoctask"

desc "Default: run unit tests."
task :default => :test

desc "Test Rich-i18n."
task :test do
  system "suit test unit -v"
end

desc "Generate documentation for Rich-i18n."
Rake::RDocTask.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = "rdoc"
  rdoc.title    = "Rich-i18n"
  rdoc.options << "--line-numbers" << "--inline-source"
  rdoc.rdoc_files.include "README.textile"
  rdoc.rdoc_files.include "MIT-LICENSE"
  rdoc.rdoc_files.include "lib/**/*.rb"
end