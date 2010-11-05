require File.expand_path(File.join(File.dirname(__FILE__), "..", "..", "test_helper.rb"))

module Core
  module Array

    class MergingTest < ActiveSupport::TestCase
      test "single string" do
        assert_equal ""                                , [""].join(" ")
        assert_equal "String"                          , [""].join(" ").class.name
        assert_equal "more"                            , [EnrichedString.new("more")].join(" ")
        assert_equal "Rich::I18n::Core::EnrichedString", [EnrichedString.new("more")].join(" ").class.name
      end

      test "multiple strings" do
        assert_equal "String"                                                                                        , [EnrichedString.new("more"), " ", EnrichedString.new("users")].join(" ").class.name
        assert_equal [EnrichedString.new("more"), " ", EnrichedString.new("users")], [EnrichedString.new("more"), " ", EnrichedString.new("users")].join(" ").merged_strings

        # assert_equal "Meer gebruikers"                                                                       , "More users".t
        # assert_equal ["Meer", " ", "gebruikers"]                                                             , "More users".t.merged_strings
        # assert_equal nil                                                                                     , "More users".t.meta_data
        # assert_equal({:locale => :nl, :value => "meer", :derivative_key => "More", :key => "word.more"}      , "More users".t.merged_strings.first.meta_data)
        # assert_equal({:locale => :nl, :value => "gebruiker", :derivative_key => "users", :key => "word.user"}, "More users".t.merged_strings.last.meta_data)
        # assert_equal "één vraag"                                                                             , "One".t + " " + "question".t
        # assert_equal ["één", " ", "vraag"]                                                                   , ("One".t + " " + "question".t).merged_strings
      end
    end

  end
end