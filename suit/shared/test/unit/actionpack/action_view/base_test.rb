require File.expand_path("../../../../test_helper.rb", __FILE__)

module Unit
  module Actionpack
    module ActionView
      class BaseTest < ActiveSupport::TestCase

        context "An ActionView instance" do
          should "respond to :rich_i18n" do
            assert ::ActionView::Base.new.respond_to? :rich_i18n
          end

          should "respond to :render_with_rich_i18n" do
            assert ::ActionView::Base.new.respond_to? :render_with_rich_i18n
          end

          should "sanitize the rendered content when containing '<i18n '" do
            # assert something
          end
        end

      end
    end
  end
end