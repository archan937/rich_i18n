require File.expand_path("../../../../test_helper.rb", __FILE__)

module Core
  module String
    class MergingTest < ActiveSupport::TestCase

      context "A String" do
        should "preserve strings all the strings merged" do
          # assert_equal ["hallo", " ", "world"], ("hallo"           + " " + "world").merged_strings
          # assert_equal ["hallo", " ", "world"], ("hallo".html_safe + " " + "world").merged_strings
          assert_equal ["hallo", " ", "world"], ("hallo".t         + " " + "world").merged_strings
        end
      end

    end
  end
end