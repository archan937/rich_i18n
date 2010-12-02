
require "rich/i18n/core/string/html_safe"
require "rich/i18n/core/string/inflections"
require "rich/i18n/core/string/internationalization"

class String
  include Rich::I18n::Core::String::HtmlSafe
  include Rich::I18n::Core::String::Inflections
  include Rich::I18n::Core::String::Internationalization
end
