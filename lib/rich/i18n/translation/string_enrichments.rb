module Rich
  module I18n
    module Translation
      module StringEnrichments

        def self.included(base)
          base.class_eval do
            attr_accessor :options
            attr_reader   :merged_strings
            delegate      :==, :inspect, :to_str, :to => :value
          end
          base.send :include, InstanceMethods
          base.alias_method_chain :value, :string_enrichments
        end

        module InstanceMethods

          def initialize(arg, options = nil, merged_strings = nil)
            @options        = HashWithIndifferentAccess.new options.try(:dup) || (arg.options.dup if arg.enriched?) || {}
            @merged_strings = merged_strings
            super arg
          end

          def enriched?
            true
          end

          def html_safe?
            true
          end

          def concat(other)
           (@merged_strings ||= [::Translation.new(store_key, @options).tap{|t| t.value = value}]) << other
            @options = nil
            self
          end
          alias_method :<<, :concat

          def +(other)
            dup.concat(other)
          end

          def value_with_string_enrichments
            if @merged_strings.blank?
              value_without_string_enrichments
            else
              @merged_strings.collect{|x| x.enriched? ? x.value : x}.join ""
            end
          end

          def to_s
            (@merged_strings || [self]).collect{|x| x.enriched? ? x.to_tag(options) : x}.join("").html_safe
          end

          def ===(other)
            self.class == other.class && [:@store_key, :@value, :@default_value, :@options, :@merged_strings].all?{|x| instance_variable_get(x) === other.instance_variable_get(x)}
          end

          def method_missing(method, *args)
            if value.respond_to? method
              value.send method
            else
              super
            end
          end

        end

      end
    end
  end
end