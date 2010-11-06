require File.expand_path(File.join(File.dirname(__FILE__), "..", "test_helper.rb"))

module Core

  class EnrichedStringTest < ActiveSupport::TestCase
    setup do
      I18n.locale = Engine.init :nl
    end

    test "current locale" do
      assert_equal I18n.locale, :nl
    end

    test "to_output" do
      Rich::I18n::Engine.enable_enriched_output = true
      assert_equal "<i18n data-value=\"meer\" data-key=\"word.more\" data-derivative_key=\"More\" data-locale=\"nl\" data-i18n_translation=\"Meer\"></i18n>", "More".t.to_output
    end
  end

end