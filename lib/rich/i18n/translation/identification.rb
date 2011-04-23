module Rich
  module I18n
    module Translation
      module Identification

        def self.included(base)
          base.extend ClassMethods
          base.class_eval do
            attr_accessor :derivative_key
            attr_accessor :pluralized
          end
        end

        module ClassMethods

        protected

          def identity_hash_for(identifier)
            super correct_identifier(identifier)
          end

        private

          def correct_identifier(identifier)
            [String, Symbol].include?(identifier.class) && identifier.to_s.split(delimiter).size == 1 ?
              [I18n.locale, identifier].join(delimiter) :
              identifier
          end

          def identifiers_for(locale, key)
            [key].tap do |keys|
              if possible_word? key
                word = key.gsub /^word\./, ""
                keys << "word.#{word}" unless word_key? key
                keys << {:key => "word.#{word.singularize}", :pluralized => true} unless word.singular?
              end
            end.inject(ActiveSupport::OrderedHash.new) do |identifiers, k|
              hash       = k.is_a?(Hash) ? k : {:key => k.downcase}
              pluralized = :pluralized if hash.delete(:pluralized)
              identifiers.merge({:locale => locale}.merge(hash) => pluralized)
            end
          end

          def possible_word?(key)
            word_key?(key) || (key.split(".").size == 1)
          end

          def word_key?(key)
            key.starts_with? "word."
          end

          def valid_match?(instance)
            instance.send :default_value
            !!instance.instance_variable_get(:@translation)
          end

        end

      end
    end
  end
end