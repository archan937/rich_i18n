ENV["RAILS_ENV"] = "test"
require File.expand_path("../dummy/config/environment.rb",  __FILE__)
require "test_help"

require File.join(File.dirname(__FILE__), "..", "..", "lib", "rich_i18n")
include Rich::I18n