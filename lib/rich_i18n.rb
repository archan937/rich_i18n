require "rich_support"
require "jzip"
require "haml"
# require "formtastic"

Rich::Support.append_gem_path File.expand_path("../..", __FILE__)

require "rich/i18n"
require "rich/i18n/core"
require "rich/i18n/actionpack"
require "rich/i18n/engine"
require "rich/i18n/version"
# require "rich/i18n/formtastic"