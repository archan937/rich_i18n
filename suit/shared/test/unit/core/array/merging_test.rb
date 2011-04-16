require File.expand_path("../../../../test_helper.rb", __FILE__)

module Core
  module Array
    class MergingTest < ActiveSupport::TestCase

      context "An array" do
        should "merge correctly" do
          assert_equal "hallo world", ["hallo"               , "world"].join(" ")
          assert_equal "hallo world", ["hallo".html_safe     , "world"].join(" ")
          assert_equal "hallo world", ["hallo".t             , "world"].join(" ")
          assert_equal "hallo world", ["hallo".t        , " ", "world"].join
        end

        context "within the Dutch locale" do
          setup do
            I18n.locale = ::Rich::I18n::Engine.init :nl
          end

          should "have the correct locale set" do
            assert_equal I18n.locale, :nl
          end

          context "when containing at least one enriched string" do
            should "return an enriched string when merging" do
              pending
            end

            should "preserve the merged strings" do
              pending
            end
          end
        end
      end

    end
  end
end