require "rich_support"
require "rich_cms"
require "i18n"

Rich::Support.append_gem_path File.expand_path("../..", __FILE__)

require "rich/i18n"
require "rich/i18n/core"
require "rich/i18n/actionpack"
require "rich/i18n/engine"
require "rich/i18n/translation"
require "rich/i18n/version"

%w(rich_pluralization formtastic simple_form).each_with_index do |lib, index|
  begin
    require lib
    require "rich/i18n/forms/#{lib}" unless index.zero?
  rescue LoadError
  end
end