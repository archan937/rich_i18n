module Rich
  module I18n
    class Engine < Rails::Engine

      class << self

        attr_accessor :logger

        def init(test_locale = nil)
          Rich::Support.after_initialize do
            copy_assets
            configure_formtastic
            set_default_config
            load_i18n test_locale
          end
          test_locale
        end

      private

        def copy_assets
          %w(images javascripts stylesheets).each do |dir|
            source_dir = File.join File.expand_path("../../../../assets/public/#{dir}", __FILE__)
            target_dir = File.join Rails.root, "public/#{dir}"

            Dir["#{source_dir}/**/*.*"].each do |source|
              target = source.gsub source_dir, target_dir
              unless File.exists? target
                FileUtils.mkdir_p File.dirname(target)
                FileUtils.cp source, target
              end
            end
          end
        end

        def configure_formtastic
          if defined?(::Formtastic) && ::Formtastic::SemanticFormBuilder.respond_to?(:escape_html_entities_in_hints_and_labels)
            ::Formtastic::SemanticFormBuilder.escape_html_entities_in_hints_and_labels = false
          end
        end

        def set_default_config
          Rich::I18n::Engine.logger ||= Rails.logger
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