
module Rich
  module I18n
    module Engine
      extend self
    
      attr_accessor :enable_enriched_output, :cache_translations
      
      def init(test_class = nil)
        @enable_enriched_output = true if @enable_enriched_output.nil?
        @cache_translations     = true if @cache_translations    .nil?
        
        %w(controllers).each do |dir|
          path = File.join File.dirname(__FILE__), "..", "..", "app", dir
          $LOAD_PATH << path
          ActiveSupport::Dependencies.load_paths << path
          ActiveSupport::Dependencies.load_once_paths.delete path
        end
        
        ::Jzip::Engine.add_template_location({File.join(File.dirname(__FILE__), "..", "..", "assets", "jzip") => File.join(RAILS_ROOT, "public", "javascripts")})
        
        load_i18n test_class
      end
      
      def load_i18n(test_class)
        if test_class
          test_locale = test_class.name.match(/(Rich\:\:I18n\:\:Test\:\:Locales\:\:)(\w+)/).captures[1].downcase.to_sym
          
          I18n.load_path  =    [File.join(File.dirname(__FILE__), "..", "..", "..", "locales", "#{test_locale}.yml")]
        else
          I18n.load_path += Dir[File.join(File.dirname(__FILE__), "..", "..", "..", "locales", "*.yml")]
        end

        I18n.backend.reload!
        
        test_locale
      end
    
      def enable_i18n_cms(enriched_output_criteria = :current_rich_cms_admin, assign_i18n_backend = true)
        raise "Missing E9s module Rich-CMS, please install first" unless defined?(Cms::Engine)
        
        self.enable_enriched_output = enriched_output_criteria
        Cms::Engine.register ".i18n", {:class_name => "Translation", :key => [:key, :locale], :before_edit => "Rich.I18n.beforeEdit", :after_update => "Rich.I18n.afterUpdate"}
        
        # FIXME: the check is a dirty fix to be able to test all the E9s modules at once (find a better implementation)
        if RAILS_ENV != "test" && assign_i18n_backend
          ::I18n.backend = ::I18n::Backend::Chain.new ::I18n::Backend::ActiveRecord.new, ::I18n.backend
          ::I18n.backend.extend ::I18n::Backend::Fallbacks
        end
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
