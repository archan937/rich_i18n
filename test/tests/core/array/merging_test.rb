require File.expand_path(File.join(File.dirname(__FILE__), "..", "..", "test_helper.rb"))

module Core
  module Array

    class MergingTest < ActiveSupport::TestCase
      test "translation class integrity" do
        assert_equal "Rich::I18n::Core::EnrichedString"                                                , "more".t.class.name
        assert_equal "String"                                                                          , "more users".t.class.name
        assert_equal ["Rich::I18n::Core::EnrichedString", "String", "Rich::I18n::Core::EnrichedString"], "more users".t.merged_strings.collect{|x| x.class.name}
      end

      test "single string" do
        assert_equal ""                                , [""].join(" ")
        assert_equal "String"                          , [""].join(" ").class.name
        assert_equal "more"                            , ["more".t].join(" ")
        assert_equal "Rich::I18n::Core::EnrichedString", ["more".t].join(" ").class.name
      end

      test "multiple strings" do
        assert_equal "String"                                                      , ["more".t, " ", "users".t].join(" ").class.name
        assert_equal [EnrichedString.new("more"), " ", EnrichedString.new("users")], ["more".t, " ", "users".t].join(" ").merged_strings

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