
require "rich/i18n/core/string/inflections"
require "rich/i18n/core/string/internationalization"
require "rich/i18n/core/string/enrichments"
require "rich/i18n/core/string/html_safe"

class String
  include Rich::I18n::Core::String::Inflections
  include Rich::I18n::Core::String::Internationalization
  include Rich::I18n::Core::String::Enrichments
  include Rich::I18n::Core::String::HtmlSafe unless "".respond_to? :html_safe
end
