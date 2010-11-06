
module Rich
  module I18n
    module Actionpack
      module ActionView
        module Sanitizor
          extend self

          require "hpricot"

          def sanitize_html(html)
            return html unless (html || "").include?("<i18n ")

            doc = Hpricot html

            (doc/"head i18n,select i18n").each do |i18n|
              i18n.swap CGI.unescapeHTML(i18n.raw_attributes["data-i18n_translation"])
            end

            (doc/"input,textarea").each do |input|
              sanitize_input(input)
            end

            (doc/"i18n").each do |i18n|
              elem = Hpricot::Elem.new i18n.raw_attributes["data-editable_input_type"] == "html" ? "div" : "span",
                                       i18n.raw_attributes.reject{|k, v| k == "data-i18n_translation"}.merge({:class => "i18n"})
              elem.inner_html = CGI.unescapeHTML(i18n.raw_attributes["data-i18n_translation"])
              i18n.swap elem.to_html
            end

            doc.to_html
          rescue
            html.gsub(/(\<i18n[^\>]+\>)|(\<\/i18n\>)/, "")
          end

        private

          def sanitize_input(input)
            %w(value seatholder).each do |input_attr|
              next unless input.attributes[input_attr].include?("<i18n ")

              i18n = Hpricot(input.attributes[input_attr]).children.first
              i18n.raw_attributes.each do |key, value|
                input.attributes[key] = value unless key == "data-i18n_translation"
              end

              input.attributes[input_attr] = CGI.unescapeHTML(i18n.raw_attributes["data-i18n_translation"])
              input.attributes["class"] = ["i18n", input.attributes["class"]].uniq.join(" ").strip
            end

            input
          end

        end
      end
    end
  end
end
