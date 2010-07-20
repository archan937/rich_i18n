
module Rich
  module I18n
    module Core
      module Symbol
        module Internationalization
        
          def t(options = {})
            to_s.t options
          end
        
        end
      end
    end
  end
end
