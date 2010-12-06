require File.expand_path("../../../test_helper.rb", __FILE__)

module App
  class RootTest < ActiveSupport::TestCase

    context "The root page" do
      setup do
        @controller = ApplicationController.new
        @request    = ActionController::TestRequest.new
        @response   = ActionController::TestResponse.new
      end

      should "asdf" do
        get "index"
      end
    end

  end
end