module ActionController
  class Base

    around_filter :prepare_rich_i18n

    def prepare_rich_i18n
      String.clear_translations
      ::Rich::I18n::Engine.current_controller = self
      yield
    ensure
      ::Rich::I18n::Engine.current_controller = nil
    end

  end
end