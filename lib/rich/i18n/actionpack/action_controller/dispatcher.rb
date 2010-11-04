
unless defined?(Rich::I18n::CONTROLLER_HOOKED)

  procedure = proc {
    if defined? Formtastic::SemanticFormBuilder
      Formtastic::SemanticFormBuilder.send :include, Rich::I18n::Formtastic unless Formtastic::SemanticFormBuilder.included_modules.include? Rich::I18n::Formtastic
    end
  }

  if Rails::VERSION::MAJOR >= 3
    ActionController::Base.config.to_prepare do
      procedure.call
    end
  else
    ActionController::Dispatcher.to_prepare :rich_i18n_formtastic do
      procedure.call
    end
  end

  Rich::I18n::CONTROLLER_HOOKED = true

end