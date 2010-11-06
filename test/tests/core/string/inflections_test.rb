require File.expand_path(File.join(File.dirname(__FILE__), "..", "..", "test_helper.rb"))

module Core
  module String

    class InflectionsTest < ActiveSupport::TestCase
      test "upcase_first" do
        assert_equal      "",      "".upcase_first
        assert_equal "Value", "value".upcase_first
        assert_equal "VALUE", "vALUE".upcase_first
      end

      test "cp_case" do
        assert_equal                  "VALUE",                  "value".cp_case("KEY")
        assert_equal                  "value",                  "VALUE".cp_case("key")
        assert_equal "Welkom bij CodeHero.es", "welkom bij CodeHero.es".cp_case("Welcome at CodeHero.es")
      end

      test "upcase_first!" do
        assert_equal    nil,     "".upcase_first!
        assert_equal    nil, "Paul".upcase_first!
        assert_equal "Paul", "paul".upcase_first!
      end

      test "singularize!" do
        assert_equal   nil,  "Key".singularize!
        assert_equal "KEY", "KEYS".singularize!
      end
    end

  end
end