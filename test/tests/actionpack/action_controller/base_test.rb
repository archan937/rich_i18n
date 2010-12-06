require File.expand_path("../../../../test_helper.rb", __FILE__)

module Actionpack
  module ActionController
    class BaseTest < ActiveSupport::TestCase

      test "prepare_rich_i18n" do
        pending
      end

      context "An ActionController instance" do
        should "respond to :prepare_rich_i18n" do
          assert ::ActionController::Base.new.respond_to? :prepare_rich_i18n
        end

        should "have Rich-i18n views in its view paths" do
          if Rails::VERSION::MAJOR >= 3
            view_paths = ::ActionController::Base.view_paths.collect{|x| x.instance_variable_get(:@path)}
            assert view_paths.include?(File.expand_path "../../../../../../app/views", __FILE__)
          else
            assert ::ActionController::Base.view_paths.include?(File.expand_path "../../../../../../app/views", __FILE__)
          end
        end
      end

    end
  end
end