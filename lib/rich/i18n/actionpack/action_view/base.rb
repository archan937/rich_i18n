module ActionView
  class Base

    def rich_i18n
      render :file => File.expand_path("../../../../../../app/views/rich_i18n.html.erb", __FILE__)
    end

    def render_with_rich_i18n(*args, &block)
      (html = render_without_rich_i18n(*args, &block)).include?("<i18n ") ?
        ::Rich::I18n::Actionpack::ActionView::Sanitizor.sanitize_html(html) :
        html
    end
    alias_method_chain :render, :rich_i18n

  end
end