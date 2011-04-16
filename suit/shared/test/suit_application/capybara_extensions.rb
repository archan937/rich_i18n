module GemSuit
  class IntegrationTest

    def edit_rich_translation(key)
      translation = key.t
      edit_content translation.store_key, translation.class.css_class
    end

  end
end