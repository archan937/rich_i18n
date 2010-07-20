
module Rich
  module I18n
    module Core
      module ERB
        module Output
        
          def self.included(base)
            base.class_eval do
              alias_method_chain :push, :rich_i18n
            end
          end
      
          def push_with_rich_i18n(cmd)
            push_without_rich_i18n cmd.match(/^#{@compiler.insert_cmd}\(\(.*\)\.to_s\)$/) ? cmd.gsub(/to_s\)$/, "to_output)") : cmd
          end
        
        end
      end
    end
  end
end
