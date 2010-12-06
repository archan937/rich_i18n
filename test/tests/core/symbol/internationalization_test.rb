require File.expand_path("../../../../test_helper.rb", __FILE__)

module Core
  module Symbol
    class InternationalizationTest < ActiveSupport::TestCase

      context "A Symbol within the Dutch locale" do
        setup do
          I18n.locale = ::Rich::I18n::Engine.init :nl
        end

        should "have the correct locale set" do
          assert_equal I18n.locale, :nl
        end

        should "be able to translate itself" do
          assert_equal "vragen", :questions.t
        end
      end

    end
  end
end