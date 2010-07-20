
require "rich/i18n/core/enumerable/methods"
require "rich/i18n/core/array/merging"

class Array
  include Rich::I18n::Core::Enumerable::Methods
  include Rich::I18n::Core::Array::Merging
end
