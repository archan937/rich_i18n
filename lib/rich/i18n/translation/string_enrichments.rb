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
            value.concat other
            self
          end
          alias_method :<<, :concat

          def +(other)
            dup.concat(other)
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