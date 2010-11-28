ENV["RAILS_ENV"] = "test"
require File.expand_path("../dummy/config/environment.rb",  __FILE__)
require "test_help"

puts "\nRunning Rails #{Rails::VERSION::STRING}\n\n"