
module Rich
  module I18n
    module Core
      class EnrichedString < ::String
      
        def initialize(s = "", meta_data = nil)
          super s
          @meta_data = meta_data || (s.meta_data.dup unless (s.meta_data.nil? rescue true)) || {}
        end
      
        def initialize_copy_with_rich_i18n(s)
          result = super(s)
          result.meta_data = self.meta_data.dup
        end
      
        def to_es
          @meta_data.filled? && Engine.can_enrich_output? ? to_tag : to_s
        end
        
      private
      
        def to_tag
          keys  = [:key, :value, :locale, :derivative_key]
          data  = @meta_data.reject{|k, v| !keys.include?(k.to_sym)}

          tag   = :i18n
          attrs = data.collect{|k, v| "data-#{k}=\"#{::ERB::Util.html_escape v}\""}.join " "
          value = to_s
          
          "<#{tag} #{attrs}>#{value}</#{tag}>"
        end
        
      end
    end
  end
end

EnrichedString = Rich::I18n::Core::EnrichedString
