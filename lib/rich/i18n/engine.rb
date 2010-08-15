
module Rich
  module I18n
    module Engine
      extend self
    
      attr_accessor :enable_enriched_output, :cache_translations
      
      def init(test_class = nil)
        @enable_enriched_output = true if @enable_enriched_output.nil?
        @cache_translations     = true if @cache_translations    .nil?
        
        ::Jzip::Engine.add_template_location({File.join(File.dirname(__FILE__), "..", "..", "..", "assets", "jzip") => RAILS_ROOT + "/public/javascripts"})
        if test_class
          test_locale = test_class.name.match(/(Rich\:\:I18n\:\:Test\:\:Locales\:\:)(\w+)/).captures[1].downcase.to_sym
          
          I18n.load_path  =    [File.join(File.dirname(__FILE__), "..", "..", "..", "locales", "#{test_locale}.yml")]
        else
          I18n.load_path += Dir[File.join(File.dirname(__FILE__), "..", "..", "..", "locales", "*.yml")]
        end

        I18n.backend.reload!
        
        test_locale
      end
      
      def current_controller=(current_controller)
        @current_controller = current_controller
        @can_enrich_output  = nil
      end

      def can_enrich_output?
        if @can_enrich_output.nil?
          @can_enrich_output = !!@enable_enriched_output &&
                                (@enable_enriched_output.is_a?(Symbol) ? (@current_controller.send(@enable_enriched_output) rescue false) : @enable_enriched_output)
        else
          @can_enrich_output
        end
      end
      
    end
  end
end

Rich::I18n::Engine.init
