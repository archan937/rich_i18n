module Rich
  module I18n
    module Translation
      module Base

        def self.included(base)
          base.send :include, Rich::Cms::Content
          base.class_eval do
            storage :memory
            identifiers :locale, :key
            configure "i18n" do |config|
              config.before_edit  "Rich.I18n.beforeEdit"
              config.after_update "Rich.I18n.afterUpdate"
            end
            cmsable defined?(E9s)
          end
        end

      end
    end
  end
end