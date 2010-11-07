
module Rich
  module I18n
    module Core

      class EnrichedString < ::String
        attr_reader :meta_data, :merged_strings

        def initialize(string = "", meta = nil, merged = nil)
          super string
          @meta_data      = HashWithIndifferentAccess.new meta || (string.meta_data.dup if string.enriched?) || {}
          @merged_strings = merged
        end

        def enriched?
          true
        end

        def html_safe?
          true
        end

        def concat_with_rich_i18n(other)
         (@merged_strings ||= [EnrichedString.new to_str, @meta_data]) << other
          @meta_data = nil
          concat_without_rich_i18n(other)
        end

        alias_method_chain :concat, :rich_i18n
        undef_method :<<
        alias_method :<<, :concat_with_rich_i18n

        def +(other)
          dup.concat(other)
        end

        def to_s
          (@merged_strings || [self]).collect(&:to_tag).join ""
        end

      protected

        def to_tag
          (@meta_data.filled? && Engine.can_enrich_output?) ? to_enriched_tag : to_html
        end

        def to_enriched_tag
          tag   = :i18n
          attrs = []

          keys  = [:key, :value, :locale, :derivative_key]
          data  = @meta_data.reject{|k, v| !keys.include?(k.to_sym)}

          data[:editable_input_type] = editable_input_type

          attrs << @meta_data[:html].collect{|k, v|      "#{k}='#{::ERB::Util.html_escape v}'"}.join(" ") if @meta_data[:html]
          attrs << data             .collect{|k, v| "data-#{k}='#{::ERB::Util.html_escape v}'"}.join(" ")
          attrs << "data-i18n_translation='#{::ERB::Util.html_escape to_str}'"
          attrs << "data-i18n_tag='#{@meta_data[:tag]}'" if @meta_data[:tag]

          "<#{tag} #{attrs.join(" ")}></#{tag}>".html_safe
        end

        def to_html
          tag = %w(text html).include?(editable_input_type) ? :div : :span
          tag ? "<#{tag}>#{to_str}</#{tag}>".html_safe : to_str
        end

      private

        def editable_input_type
          @meta_data[:as] if @meta_data && %w(string text html).include?(@meta_data[:as])
        end

      end

    end
  end
end

EnrichedString = Rich::I18n::Core::EnrichedString
