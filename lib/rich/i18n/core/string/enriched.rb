
module Rich
  module I18n
    module Core
      module String
        module Enriched

          def to_tag
            self
          end

          def to_es
            EnrichedString.new self
          end

        end
      end
    end
  end
end
