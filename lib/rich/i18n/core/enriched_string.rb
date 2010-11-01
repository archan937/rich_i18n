
module Rich
  module I18n
    module Core
      class EnrichedString

        delegate :empty?, :blank?, :to_json, :+, :<<, :concat, :to => :@string

        attr_reader :string

        def initialize(string = "", meta_data = nil)
          @string    = string
          @meta_data = meta_data || (s.meta_data.dup unless (string.meta_data.nil? rescue true)) || {}
        end

        def enriched_string?
          true
        end

        def to_es
          (@meta_data.filled? && Engine.can_enrich_output?) ? to_tag : @string
        end
        alias_method :to_s, :to_es

      private

        def to_tag
          tag   = :i18n
          attrs = []

          keys  = [:key, :value, :locale, :derivative_key]
          data  = @meta_data.reject{|k, v| !keys.include?(k.to_sym)}

          data[:editable_input_type] = @meta_data[:as] if %w(string text html).include? @meta_data[:as].to_s.downcase

          attrs << @meta_data[:html].collect{|k, v|      "#{k}=\"#{::ERB::Util.html_escape v}\""}.join(" ") if @meta_data[:html]
          attrs << data             .collect{|k, v| "data-#{k}=\"#{::ERB::Util.html_escape v}\""}.join(" ")
          attrs << "data-i18n_translation=\"#{::ERB::Util.html_escape @string}\""

          "<#{tag} #{attrs}></#{tag}>"
        end

      end
    end
  end
end

EnrichedString = Rich::I18n::Core::EnrichedString
