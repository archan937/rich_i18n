
module Rich
  module I18n
    extend self
    
    def method_missing(method, *args)
      ::I18n.send method, *args
    end
    
  end
end

require "rich/i18n/core"
require "rich/i18n/actionpack"
require "rich/i18n/engine"
