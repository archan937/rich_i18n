require "rich_support"
require "jzip"
require "haml"

Rich::Support.append_gem_path File.expand_path("../..", __FILE__)

%w(formtastic simple_form).each do |lib|
  begin
    require lib
  rescue LoadError
  end
end

require "rich/i18n"
require "rich/i18n/core"
require "rich/i18n/actionpack"
require "rich/i18n/engine"
require "rich/i18n/version"

if defined?(Formtastic)
  require "rich/i18n/formtastic"
end