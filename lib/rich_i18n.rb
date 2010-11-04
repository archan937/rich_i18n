require "formtastic"
require "jzip"

require "rich/i18n"
require "rich/i18n/core"
require "rich/i18n/activesupport"
require "rich/i18n/actionpack"
require "rich/i18n/rails"
require "rich/i18n/engine"
require "rich/i18n/formtastic"

if Rails::VERSION::MAJOR < 3
  ActionView::Base.send :include, Formtastic::SemanticFormHelper unless ActionView::Base.included_modules.include? Formtastic::SemanticFormHelper # still required?
end