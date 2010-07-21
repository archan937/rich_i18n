
module Rich
  module I18n
    module Core
      module String
        module Enrichments
        
          # TODO: override String interpolation (e.g. "foo #{"bar".t}")
        
          def self.included(base)
            base.class_eval do
              alias_method :add_without_rich_i18n, :+
              alias_method :+, :add_with_rich_i18n
              alias_method_chain :concat, :rich_i18n
              undef_method :<<
              alias_method :<<, :concat_with_rich_i18n
            
              alias_method_chain :initialize_copy, :rich_i18n

              attr_accessor :meta_data
              attr_accessor :merged_strings
            end
          end
        
          def initialize_copy_with_rich_i18n(s)
            result = initialize_copy_without_rich_i18n(s)
            result.merged_strings = self.merged_strings.try :dup
          end

          def add_with_rich_i18n(other)
            strings, result = self.merged_strings.try(:dup) || [], add_without_rich_i18n(other)
          
            if (result.merged_strings = strings).empty?
              result.merged_strings << self.dup
            end
            unless other.empty?
              result.merged_strings << other
            end
          
            result
          end

          def concat_with_rich_i18n(other_or_fixnum)
            string, result = self.dup, concat_without_rich_i18n(other_or_fixnum)
          
            if (result.merged_strings ||= []).empty? and !string.empty?
              result.merged_strings << string
            end
            result.merged_strings << other_or_fixnum.dup unless other_or_fixnum.empty?
          
            result
          end
        
          def enriched_string?
            is_a?(EnrichedString) or (merged_strings || []).any?(&:enriched_string?)
          end
        
          def to_output
            merged_strings.blank? ?
              to_es :
              merged_strings.collect(&:to_output).join
          end
        
        end
      end
    end
  end
end
