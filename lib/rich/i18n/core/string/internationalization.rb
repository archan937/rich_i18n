module Rich
  module I18n
    module Core
      module String
        module Internationalization

          def t(options = {})
            scan(/(\s+|[^\s]+)/).flatten.collect do |string|
              if string.match /\s+/
                string
              else
                ::Translation.find(string).tap do |translation|
                  translation.options = options
                end
              end
            end.join ""
          end

        end
      end
    end
  end
end