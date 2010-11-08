require File.expand_path(File.join(File.dirname(__FILE__), "..", "..", "test_helper.rb"))

module Core
  module String

    class MergingTest < ActiveSupport::TestCase
      test "merging" do
        # assert_equal ["hallo", " ", "world"], ("hallo"           + " " + "world").merged_strings
        # assert_equal ["hallo", " ", "world"], ("hallo".html_safe + " " + "world").merged_strings
        # assert_equal ["hallo", " ", "world"], ("hallo".t         + " " + "world").merged_strings
      end
    end

  end
end