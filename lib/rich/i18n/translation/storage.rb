module Rich
  module I18n
    module Translation
      module Storage

        def self.included(base)
          base.extend ClassMethods
          base.send :include, InstanceMethods
        end

        module ClassMethods

          def find(identifier)
            locale, key = identity_hash_for(identifier).values_at :locale, :key
            identifiers = identifiers_for locale, key.downcase

            super(*identifiers.keys).tap do |translation|
              translation.derivative_key = key
              translation.pluralized     = identifiers[translation.identity_hash] == :pluralized
            end
          end

        end

        module InstanceMethods

          def value
            super.copy_case(derivative_key || "").tap do |val|
              val.pl! if pluralized
            end
          end

        protected

          def default_value
            @default_value || begin
              @translation ||= I18n.t(key, :locale => locale).tap do |translation|
                return @default_value = (derivative_key || key).split(".").last.gsub("_", " ") if translation.include? "translation missing"
              end
            end
          end

        end

      end
    end
  end
end