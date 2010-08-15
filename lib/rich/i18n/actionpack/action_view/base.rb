
module ActionView
  class Base

    def render_with_rich_i18n(*args, &block)
      ::Rich::I18n::Engine.current_controller = @controller
      (html = render_without_rich_i18n(*args, &block)).include?("<i18n ") ?
        ::Rich::I18n::Actionpack::ActionView::Sanitizor.sanitize_html(html) :
        html
    ensure
      ::Rich::I18n::Engine.current_controller = nil
    end
    alias_method_chain :render, :rich_i18n

  end
end
