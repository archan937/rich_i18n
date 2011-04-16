module Rich
  module I18n
    class Engine < Rails::Engine

      class << self

        attr_accessor :logger, :enable_enriched_output, :cache_translations

        def init(test_locale = nil)
          Rich::Support.after_initialize do
            register_assets
            set_default_config
            load_i18n test_locale
          end
          test_locale
        end

        # //////////////////////////////////
        # // TODO: Check the following code!
        # //////////////////////////////////

        def current_controller=(current_controller)
          @current_controller = current_controller
          @can_enrich_output  = nil
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

        def enable_enriched_output=(value)
          @enable_enriched_output = value
          @can_enrich_output      = nil
        end

        def can_enrich_output?
          if @can_enrich_output.nil?
            @can_enrich_output = !!@enable_enriched_output &&
                                  (@enable_enriched_output.is_a?(Symbol) ? (@current_controller.send(@enable_enriched_output) rescue false) : @enable_enriched_output)
          else
            @can_enrich_output
          end
        end

        # //////////////////////////////////
        # // END
        # //////////////////////////////////

      private

        def register_assets
          ::Jzip::Engine.add_template_location({File.expand_path("../../../../assets/jzip", __FILE__) => File.join(Rails.root, "public", "javascripts")})
          ::Sass::Plugin.add_template_location( File.expand_path("../../../../assets/sass", __FILE__),   File.join(Rails.root, "public", "stylesheets") )
          if defined?(::Formtastic) && ::Formtastic::SemanticFormBuilder.respond_to?(:escape_html_entities_in_hints_and_labels)
            ::Formtastic::SemanticFormBuilder.escape_html_entities_in_hints_and_labels = false
          end
        end

        def set_default_config
          @enable_enriched_output = true if @enable_enriched_output.nil?
          @cache_translations     = true if @cache_translations    .nil?
          Rich::I18n::Engine.logger = Rails.logger
        end

        def load_i18n(test_locale)
          if test_locale
            I18n.load_path  =    [File.expand_path("../../../../locales/#{test_locale}.yml", __FILE__)]
          else
            I18n.load_path += Dir[File.expand_path("../../../../locales/*.yml"             , __FILE__)]
          end
          I18n.backend.reload!
        end

      end

    end
  end
end

Rich::I18n::Engine.init