
module Rich
  module I18n
    module Core
      module String
        module Internationalization

          def self.included(base)
            base.extend ClassMethods
            base.send :include, InstanceMethods
            base.class_eval do
              cattr_accessor :i18n_translations
            end
          end
          
          module ClassMethods
            def clear_translations
              i18n_translations.clear
            end
          end
          
          module InstanceMethods
            def t(options = {})
              self.split(" ").inject([]) do |array, string|
                key              = string.include?(".") ? string.dup : "word.#{string}"
                default          = key.split(".").last
                translating_word = key.starts_with?("word.")
    
                key.downcase! unless string.match(/^(label|seatholder)\./)

                options[:pluralize]            = "".respond_to?(:pl) && (options[:pluralize].nil? || options[:pluralize])
                options[:translate_callback] ||= LOGGER_PROC if RAILS_ENV == "development"

                if options.include? :default
                  options[:default] = [options[:default]].flatten << default.humanize
                  s = i18n_t key, options
                  s = s[:_base] if s.is_a?(Hash)
                  value = s.dup
                else
                  s = i18n_t key, options.merge({:default => translating_word ? "" : default.humanize})
                  value = s.dup
    
                  if translating_word
                    unless (translated = !s.empty?) or !"".respond_to?(:pl)
                      key.singularize!
                      s = i18n_t key, options.merge({:default => ""})
                      value = s.dup
                    end
      
                    if s.empty?
                      s = default.humanize
                      value = s.dup
                    else
                      s = s.pl(options[:count]) unless !options[:pluralize] or (options[:count].nil? and default.dup.pluralize!)
                    end
                  end
                end
      
                unless s.gsub!(/^=\s+/, "")
                  s.cp_case! options[:capitalize] ? default.capitalize : default
                end
              
                array << " " unless array.empty?
                array << EnrichedString.new(s, {:key => key, :value => value, :locale => I18n.locale, :derivative_key => string})
      
              end.join
            end
          
          private

            RICH_I18N_OPTIONS = [:count, :pluralize, :capitalize, :translate_callback]
            LOGGER_PROC = Proc.new{|translation, key, options| puts "== RICH-I18N: I18n.t #{key.inspect}, #{options.inspect}"}
          
            @@i18n_translations = {}

            def i18n_t(key, opts = {})
              options = opts.inject({}) do |hash, (k, v)|
                          # FIXME: this code is to handle interpolated translations... however, this needs to be refactored
                          hash[k] = v.is_a?(String) && v.include?("<i18n") ? v.gsub(/(\<i18n[^\>]+\>)|(\<\/i18n\>)/, "") : v unless RICH_I18N_OPTIONS.include?(k)
                          hash
                        end
            
              k = "#{I18n.locale} #{key.inspect}, #{options.inspect}"
              translation = if Engine.cache_translations
                              ((@@i18n_translations[I18n.locale.to_s.downcase] ||= {})[k] ||= I18n.t(key, options)).try :dup
                            else
                              I18n.t key, options
                            end
              opts[:translate_callback].try :call, translation, key, options
    
              translation
            end
          end
                
        end
      end
    end
  end
end
