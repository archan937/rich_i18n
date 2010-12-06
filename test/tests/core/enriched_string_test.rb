require File.expand_path("../../../test_helper.rb", __FILE__)

module Core
  class EnrichedStringTest < ActiveSupport::TestCase

    context "An EnrichedString" do
      should "be enriched and html safe" do
        assert EnrichedString.new.enriched?
        assert EnrichedString.new.html_safe?
      end

      should "be able to merge with (enriched) strings preserving the separate strings" do
        pending
        # concat
        # <<
        # +
      end

      should "return a html safe string without any meta data" do
        pending
        # :tag
        # :as
        # plain text
      end

      should "delegate certain methods to its string instance" do
        pending
        # ==
        # inspect
        # as_json
        # to_json
        # to_str
      end

      should "have its case equality implemented correctly" do
        pending
        # with "more"
        # with EnrichedString.new "more"
        # with EnrichedString.new "More"
        I18n.locale = ::Rich::I18n::Engine.init :nl
        # with "meer"
        # with "more".t
        # with "More".t
      end

      context "within the Dutch locale" do
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
            assert_equal({"data-locale" => "nl", "data-editable_input_type" => "", "data-i18n_translation" => "Meer", "data-value" => "meer", "data-derivative_key" => "More", "data-key" => "word.more"},
                         element.raw_attributes)
          end
        end
      end
    end

  end
end