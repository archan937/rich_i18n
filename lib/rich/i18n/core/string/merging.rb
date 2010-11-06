
module Rich
  module I18n
    module Core
      module String
        module Merging

          def self.included(base)
            base.class_eval do

              alias_method_chain :concat, :rich_i18n
              undef_method :<<
              alias_method :<<, :concat_with_rich_i18n

              alias_method :add_without_rich_i18n, :+
              alias_method :+, :add_with_rich_i18n

              attr_accessor :merged_strings
            end
          end

          def to_output
            merged_strings.blank? ?
              to_es :
              merged_strings.collect(&:to_output).join(" ")
          end

          def concat_with_rich_i18n(value)
            default_merged_strings, result = [dup], concat_without_rich_i18n(value)
           (result.merged_strings ||= default_merged_strings) << value
            result
          end

          def add_with_rich_i18n(other)
            dup.concat(other)
          end

        end
      end
    end
  end
end
