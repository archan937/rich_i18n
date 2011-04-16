module Rich
  module I18n
    module EnrichedString
      module Content

        def self.included(base)
          base.extend ClassMethods
          base.send :include, InstanceMethods
        end

        module ClassMethods
        end

        module InstanceMethods
        end

      end
    end
  end
end