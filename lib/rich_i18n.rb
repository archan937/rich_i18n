require "jzip"

require "formtastic"
ActionView::Base.send :include, Formtastic::SemanticFormHelper

require "rich/i18n"
require "rich/i18n/core"
require "rich/i18n/actionpack"
require "rich/i18n/engine"
require "rich/i18n/formtastic"