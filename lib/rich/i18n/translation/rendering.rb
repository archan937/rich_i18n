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
                                       :store_value      => @store_value,
                                       :i18n_tag         => derive_tag(opts),
                                       :i18n_translation => value})
          end

          def to_rich_cms_response(params)
            # options = {:as => params[:editable_input_type]}
            {:translations => Hash[*params[:derivative_keys].split(";").uniq.collect{|x| [x, x.t.value]}.flatten]} unless params[:derivative_keys].blank?
          end

          def derive_tag(options)
            tag = options[:tag] || configuration[:tag]
            return if !editable? && tag == :none
            (tag unless tag == :none) || (%w(text html).include?(options[:as].to_s.downcase) ? :div : :span)
          end

          def derive_text
            ""
          end

        end

      end
    end
  end
end