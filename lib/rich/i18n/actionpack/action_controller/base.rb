
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

    view_path = File.expand_path "../../../../../../app/views", __FILE__
    if respond_to? :append_view_path
      self.append_view_path view_path
    elsif respond_to? :view_paths
      self.view_paths << view_path
    end

  end
end
