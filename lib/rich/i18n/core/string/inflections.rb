
module Rich
  module I18n
    module Core
      module String
        module Inflections

          # -- start FIXME: these methods are also defined in rich_pluralization

          def upcase_first
            empty? ?
              self :
              self[0].chr.capitalize + self[1, size]
          end

          def cp_case(s)
            send((:downcase unless s.dup.downcase!) || (:upcase unless s.dup.upcase!) || (:upcase_first unless s.dup.upcase_first!) || :to_s)
          end

          def upcase_first!
            self == (result = upcase_first) ? nil : replace(result)
          end

          def cp_case!(s)
            self == (result = cp_case(s))   ? nil : replace(result)
          end

          # -- end

          def singularize!
            downcase == (result = singularize).downcase ? nil : replace(result)
          end

          def pluralize!
            downcase == (result = pluralize).downcase   ? nil : replace(result)
          end

        end
      end
    end
  end
end
