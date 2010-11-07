
require "rich/i18n/core/string/inflections"
require "rich/i18n/core/string/internationalization"
require "rich/i18n/core/string/enriched"
require "rich/i18n/core/string/html_safe"

class String
  include Rich::I18n::Core::String::Inflections
  include Rich::I18n::Core::String::Internationalization
  include Rich::I18n::Core::String::Enriched
  include Rich::I18n::Core::String::HtmlSafe unless String.new.respond_to? :html_safe
end
