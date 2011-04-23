require File.expand_path("../../../../test_helper.rb", __FILE__)

module Core
  module String
    class InternationalizationTest < ActiveSupport::TestCase

      context "A String within the Dutch locale" do
        setup do
          I18n.locale = ::Rich::I18n::Engine.init :nl
        end

        should "have the correct locale set" do
          assert_equal I18n.locale, :nl
        end

        should "concatenate and translate as expected" do
          assert_equal "meer ", "more ".t
        end
      end

    end
  end
end