
module Rich
  module I18n
    module Engine
      extend self
    
      attr_accessor :enable_enriched_output
    
      def init(test_class = nil)
        if test_class
          test_locale = test_class.name.match(/(Rich\:\:I18n\:\:Test\:\:Locales\:\:)(\w+)/).captures[1].downcase.to_sym
          
          I18n.load_path  =          [File.join("vendor", "plugins", "rich_i18n", "locales", "#{test_locale}.yml")]
        else
          I18n.load_path += Dir[Rails.root.join("vendor", "plugins", "rich_i18n", "locales", "*.yml")]
        end

        I18n.backend.reload!
        
        test_locale
      end
      
      def can_enrich_output?
        !enable_enriched_output.blank? and (enable_enriched_output.is_a?(Symbol) ? (send(enable_enriched_output) rescue false) : enable_enriched_output)
      end
    
    end
  end
end

Rich::I18n::Engine.init
