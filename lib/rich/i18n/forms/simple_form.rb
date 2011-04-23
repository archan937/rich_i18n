module Rich
  module I18n
    module Forms
      module SimpleForm

        def self.included(base)
          # base.alias_method_chain :input, :enrichments
        end

        # def input(*args)
        #
        # end

      end
    end
  end
end

# SimpleForm::SemanticFormBuilder.send :include, Rich::I18n::Forms::SimpleForm