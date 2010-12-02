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
          # assert_equal "<i18n data-value=\"meer\" data-key=\"word.more\" data-derivative_key=\"More\" data-locale=\"nl\" data-i18n_translation=\"Meer\"></i18n>", "More".t.to_output
        end
      end
    end

  end
end