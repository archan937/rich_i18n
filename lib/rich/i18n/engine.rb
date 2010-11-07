
module Rich
  module I18n
    class Engine < Rails::Engine

      class << self

        attr_accessor :logger, :enable_enriched_output, :cache_translations

        def init(test_locale = nil)
          @enable_enriched_output = true if @enable_enriched_output.nil?
          @cache_translations     = true if @cache_translations    .nil?

          %w(controllers).each do |dir|
            path = File.join File.dirname(__FILE__), "..", "..", "app", dir
            $LOAD_PATH << path
            ActiveSupport::Dependencies.autoload_paths << path
            ActiveSupport::Dependencies.autoload_once_paths.delete path
          end

          procedure = proc {
            ::Jzip::Engine.add_template_location({File.expand_path("../../../../assets/jzip", __FILE__) => File.join(Rails.root, "public", "javascripts")})
            ::Formtastic::SemanticFormBuilder.escape_html_entities_in_hints_and_labels = false if ::Formtastic::SemanticFormBuilder.respond_to?(:escape_html_entities_in_hints_and_labels)
            load_i18n test_locale
            Rich::I18n::Engine.logger = Rails.logger
          }

          if Rails::VERSION::MAJOR >= 3
            config.after_initialize do
              procedure.call
            end
          else
            procedure.call
          end

          test_locale
        end

        def current_controller=(current_controller)
          @current_controller = current_controller
          @can_enrich_output  = nil
        end

        def load_i18n(test_locale)
          if test_locale
            I18n.load_path  =    [File.join(File.dirname(__FILE__), "..", "..", "..", "locales", "#{test_locale}.yml")]
          else
            I18n.load_path += Dir[File.join(File.dirname(__FILE__), "..", "..", "..", "locales", "*.yml")]
          end
          I18n.backend.reload!
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

      end

    end
  end
end

Rich::I18n::Engine.init
