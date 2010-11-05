require File.expand_path(File.join(File.dirname(__FILE__), "..", "..", "test_helper.rb"))

module Locales
  module NL

    class InternationalizationTest < ActiveSupport::TestCase
      setup do
        I18n.locale = Engine.init :nl
      end

      test "current locale" do
        assert_equal I18n.locale, :nl
      end

      test "the README examples" do
        assert_equal "Meer gebruikers"                                                                       , "More users".t
        assert_equal ["Meer", " ", "gebruikers"]                                                             , "More users".t.merged_strings
        assert_equal nil                                                                                     , "More users".t.meta_data
        assert_equal({:locale => :nl, :value => "meer", :derivative_key => "More", :key => "word.more"}      , "More users".t.merged_strings.first.meta_data)
        assert_equal({:locale => :nl, :value => "gebruiker", :derivative_key => "users", :key => "word.user"}, "More users".t.merged_strings.last.meta_data)
        assert_equal "één vraag"                                                                             , "One".t + " " + "question".t
        assert_equal ["één", " ", "vraag"]                                                                   , ("One".t + " " + "question".t).merged_strings
      end

      test "translations" do
        assert_equal "huis"  , "house".t
        assert_equal "straat", "street".t
        assert_equal "vraag" , "question".t
        assert_equal "vraag" , "word.question".t
      end

      test "cased translations" do
        assert_equal "meer"   , "more".t
        assert_equal "Huis"   , "House".t
        assert_equal "VRAAG"  , "QUESTION".t
        # assert_equal "VRAGEN" , "QUESTIONS".t
        # assert_equal "Straten", "Streets".t
      end

      test "combined translations" do
        assert_equal "vraag & antwoord"   , "question & answer".t
        assert_equal "Vraag & antwoord"   , "Question & answer".t
        assert_equal "Man / Vrouw"        , "Male / Female".t
        assert_equal "één huis"           , "one house".t
        # assert_equal "meer vragen"        , "more questions".t
        # assert_equal "Één huis"           , "One house".t
        # assert_equal "Meer huizen"        , "More houses".t
        # assert_equal "MEER STRATEN"       , "MORE STREETS".t
        # assert_equal "Vragen & Antwoorden", "Questions & Answers".t
      end
    end

  end
end