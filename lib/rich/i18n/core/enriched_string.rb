
module Rich
  module I18n
    module Core
      class EnrichedString < ActiveSupport::SafeBuffer

        attr_reader :meta_data

        def initialize(string = "", meta_data = nil)
          super(string)
          @meta_data = meta_data || (string.meta_data.dup unless (string.meta_data.nil? rescue true)) || {}
        end

        def to_es
          (@meta_data.filled? && Engine.can_enrich_output?) ? to_tag : self
        end
        alias_method :to_s, :to_es

      private

        def to_tag
          tag   = :i18n
          attrs = []

          keys  = [:key, :value, :locale, :derivative_key]
          data  = @meta_data.reject{|k, v| !keys.include?(k.to_sym)}

          data[:editable_input_type] = @meta_data[:as] if %w(string text html).include? @meta_data[:as].to_s.downcase

          attrs << @meta_data[:html].collect{|k, v|      "#{k}='#{::ERB::Util.html_escape v}'"}.join(" ") if @meta_data[:html]
          attrs << data             .collect{|k, v| "data-#{k}='#{::ERB::Util.html_escape v}'"}.join(" ")
          attrs << "data-i18n_translation='#{::ERB::Util.html_escape to_str}'"
          attrs << "data-i18n_tag='#{@meta_data[:tag]}'" if @meta_data[:tag]

          "<#{tag} #{attrs.join(" ")}></#{tag}>".html_safe
        end

        def to_tag
          tag = @meta_data[:tag] || (%w(text html).include?(@meta_data[:as].to_s) ? :div : :span if @meta_data[:as])
          tag ? "<#{tag}>#{self}</#{tag}>".html_safe : self
        end

      end
    end
  end
end

EnrichedString = Rich::I18n::Core::EnrichedString
