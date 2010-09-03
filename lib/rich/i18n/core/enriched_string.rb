
module Rich
  module I18n
    module Core
      class EnrichedString
        
        delegate :empty?, :blank?, :to_json, :to => :@string
      
        def initialize(string = "", meta_data = nil)
          @string    = string
          @meta_data = meta_data || (s.meta_data.dup unless (string.meta_data.nil? rescue true)) || {}
        end
      
        def to_es
          (@meta_data.filled? && Engine.can_enrich_output?) ? to_tag : @string
        end
        alias_method :to_s, :to_es
        
      private
      
        def to_tag
          keys  = [:key, :value, :locale, :derivative_key]
          data  = @meta_data.reject{|k, v| !keys.include?(k.to_sym)}

          tag   = :i18n
          attrs = data.collect{|k, v| "data-#{k}=\"#{::ERB::Util.html_escape v}\""}.join " "
          value = @string
          
          "<#{tag} #{attrs}>#{value}</#{tag}>"
        end
        
      end
    end
  end
end

EnrichedString = Rich::I18n::Core::EnrichedString
