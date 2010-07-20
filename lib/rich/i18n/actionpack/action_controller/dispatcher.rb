
unless defined?(Rich::I18n::CONTROLLER_HOOKED)
  
  ActionController::Dispatcher.to_prepare :rich_i18n_formtastic do
    if defined? Formtastic::SemanticFormBuilder
      Formtastic::SemanticFormBuilder.send :include, Rich::I18n::Formtastic unless Formtastic::SemanticFormBuilder.included_modules.include? Rich::I18n::Formtastic
    end
  end
  
  Rich::I18n::CONTROLLER_HOOKED = true
  
end
