require File.expand_path(File.join(File.dirname(__FILE__), "..", "..", "..", "test_helper.rb"))

module Core
  module Array

    class MergingTest < ActiveSupport::TestCase
      test "merged strings" do
        # assert_equal ["hallo", " ", "world"], [                   "hallo"                    , " ", "world"].join.merged_strings
        # assert_equal ["hallo", " ", "world"], [EnrichedString.new("hallo", {:key => "hello"}), " ", "world"].join.merged_strings
      end
    end

  end
end