ENV["RAILS_ENV"] = "test"
require File.expand_path("../dummy/config/environment.rb",  __FILE__)
require "rails/test_help"

require File.expand_path("../../../lib/rich_i18n", __FILE__)
include Rich::I18n

puts "\nRunning Rails #{Rails::VERSION::STRING}\n\n"