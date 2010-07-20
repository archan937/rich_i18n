require File.expand_path(File.join(File.dirname(__FILE__), "..", "..", "test_helper.rb"))

module Rich
  module I18n
    module Test
      module Locales
        module NL

          class InternationalizationTest < ActiveSupport::TestCase
            setup do
              include Setup
              I18n.locale = ::Rich::I18n::Engine.init(self)
            end
      
            test "dutch_translations" do
              assert_equal "huis"  , "house".t
              assert_equal "straat", "street".t
              assert_equal "vraag" , "question".t
              assert_equal "vraag" , "word.question".t
            end
      
            test "dutch_cased_translations" do
              assert_equal "meer"   , "more".t
              assert_equal "Huis"   , "House".t
              # assert_equal "Straten", "Streets".t
              # assert_equal "VRAGEN" , "QUESTIONS".t
            end
      
            test "dutch_combined_translations" do
              assert_equal "vraag & antwoord"   , "question & answer".t
              assert_equal "Vraag & antwoord"   , "Question & answer".t
              assert_equal "Man / Vrouw"        , "Male / Female".t
              assert_equal "één huis"           , "one house".t
              # assert_equal "Één huis"           , "One house".t
              # assert_equal "Meer huizen"        , "More houses".t
              # assert_equal "MEER STRATEN"       , "MORE STREETS".t
              # assert_equal "meer vragen"        , "more questions".t
              # assert_equal "meer vragen"        , "more questions".t
              # assert_equal "Vragen & Antwoorden", "Questions & Answers".t
            end
          end
        
        end
      end
    end
  end
end