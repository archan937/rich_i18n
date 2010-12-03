require File.expand_path("../../../test_helper.rb", __FILE__)

module Core
  class EnrichedStringTest < ActiveSupport::TestCase

    context "An EnrichedString within the Dutch locale" do
      setup do
        I18n.locale = ::Rich::I18n::Engine.init :nl
      end

      should "have the correct locale set" do
        assert_equal I18n.locale, :nl
      end

      context "when having enriched output enabled" do
        setup do
          ::Rich::I18n::Engine.enable_enriched_output = true
        end

        should "render meta data attributes" do
          tag = Hpricot "More".t.to_s

          assert_equal 1, tag.children.size

          element = tag.children[0]
          assert_equal Hpricot::Elem, element.class
          assert_equal({:"data-locale" => "nl", :"data-editable_input_type" => "", :"data-i18n_translation" => "Meer", :"data-value" => "meer", :"data-derivative_key" => "More", :"data-key" => "word.more"}.stringify_keys,
                       element.raw_attributes)
        end
      end
    end

  end
end