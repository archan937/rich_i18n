module Rich
  module I18n
    module Translation
      module Rendering

        def self.included(base)
          base.send :include, InstanceMethods
        end

        module InstanceMethods

          def to_tag(opts = {})
            super opts.merge(:tag  => :i18n,
                             :data => {:derivative_key   => derivative_key,
                                       :i18n_tag         => derive_tag(opts),
                                       :i18n_translation => derive_text})
          end

          def to_rich_cms_response(params)
            # options = {:as => params[:editable_input_type]}
            {:translations => Hash[*params[:derivative_keys].split(";").uniq.collect{|x| [x, x.t.value]}.flatten]}
          end

          def derive_tag(options)
            tag = options[:tag] || configuration[:tag]
            return if !editable? && tag == :none
            (tag unless tag == :none) || (%w(text html).include?(options[:as].to_s.downcase) ? :div : :span)
          end

        end

      end
    end
  end
end