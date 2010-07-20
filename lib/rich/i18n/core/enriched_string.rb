
module Rich
  module I18n
    module Core
      class EnrichedString < ::String
      
        attr_accessor :meta_data
      
        def initialize(s = "", meta_data = nil)
          super s
          @meta_data = meta_data || (s.meta_data.dup unless (s.meta_data.nil? rescue true)) || {}
        end
      
        def initialize_copy_with_rich_i18n(s)
          result = super(s)
          result.meta_data = self.meta_data.dup
        end
      
        def to_es
          @meta_data.filled? and ::Rich::I18n::Engine.can_enrich_output? ? 
            "<i18n #{@meta_data.collect{|k, v| "data-#{k}=#{v.inspect}"}.join(" ")}>#{to_s}</i18n>" :
            to_s
        end
        
      end
    end
  end
end

EnrichedString = Rich::I18n::Core::EnrichedString
