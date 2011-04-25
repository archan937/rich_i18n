module Rich
  module I18n
    module Core
      module Array
        module Merging

          def self.included(base)
            base.class_eval do
              alias_method_chain :join, :rich_i18n
            end
          end

          def join_with_rich_i18n(sep = $,)
            if size == 1 && first.enriched?
              first
            else
              result = ""
              each_with_index do |x, i|
                result = "#{result}#{sep unless i.zero?}#{x.enriched? ? x.to_str : x}"
              end
              if any? &:enriched?
                merged_strings = dup.zip([(sep unless sep == "")] * (size - 1)).flatten.compact
                ::Translation.new nil, nil, merged_strings
              else
                result
              end
            end
          end

        end
      end
    end
  end
end