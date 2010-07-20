require "rake"
require "rake/testtask"
require "rake/rdoctask"

begin
  require "jeweler"
  Jeweler::Tasks.new do |gemspec|
    gemspec.name        = "rich_i18n"
    gemspec.summary     = "Enrichments (e9s) module for internationalization (i18n)"
    gemspec.description = "Rich-i18n is a module of E9s (http://github.com/archan937/e9s) which enriches I18n, Formtastic, the String and Symbol classes. This simplifies internationalization of your Rails application making a Rails developers life much easier."
    gemspec.email       = "paul.engel@holder.nl"
    gemspec.homepage    = "http://github.com/archan937/rich_i18n"
    gemspec.author      = "Paul Engel"

    gemspec.add_dependency "i18n"
    gemspec.add_dependency "formtastic"
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: gem install jeweler"
end

desc "Default: run unit tests."
task :default => :test

desc "Test the rich_i18n plugin."
Rake::TestTask.new(:test) do |t|
  t.libs    << "lib"
  t.libs    << "test"
  t.pattern  = "test/**/*_test.rb"
  t.verbose  = true
end

desc "Generate documentation for the rich_i18n plugin."
Rake::RDocTask.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = "rdoc"
  rdoc.title    = "Rich-i18n"
  rdoc.options << "--line-numbers" << "--inline-source"
  rdoc.rdoc_files.include "README"
  rdoc.rdoc_files.include "MIT-LICENSE"
  rdoc.rdoc_files.include "lib/**/*.rb"
end