require File.expand_path("../../../../test_helper.rb", __FILE__)

module Locales
  module NL
    class InternationalizationTest < ActiveSupport::TestCase

      context "A String within the Dutch locale" do
        setup do
          I18n.locale = ::Rich::I18n::Engine.init :nl
        end

        should "have the correct locale set" do
          assert_equal I18n.locale, :nl
        end

        context "in English in singular form" do
          should "translate Dutch words" do
            assert_equal   "huis",         "house".t
            assert_equal  "vraag",      "question".t
            assert_equal  "vraag", "word.question".t
            assert_equal "straat",        "street".t
          end

          should "translate Dutch words preserving the letter casing" do
            assert_equal    "meer",      "more".t
            assert_equal    "Huis",     "House".t
            assert_equal   "VRAAG",  "QUESTION".t
            assert_equal  "VRAGEN", "QUESTIONS".t
            assert_equal "Straten",   "Streets".t
          end
        end

        should "combine translations" do
          pending do
          assert_equal "vraag & antwoord"   , "question & answer".t
          assert_equal "Vraag & antwoord"   , "Question & answer".t
          assert_equal "Man / Vrouw"        , "Male / Female".t
          assert_equal "één huis"           , "one house".t
          assert_equal "meer vragen"        , "more questions".t
          assert_equal "Één huis"           , "One house".t
          assert_equal "Meer huizen"        , "More houses".t
          assert_equal "MEER STRATEN"       , "MORE STREETS".t
          assert_equal "Vragen & Antwoorden", "Questions & Answers".t
          end
        end
      end

    end
  end
end