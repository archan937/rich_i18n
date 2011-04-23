require File.expand_path("../../test_helper.rb", __FILE__)

require "application_controller"

class ActionControllerTest < ActionController::TestCase

  context "An ActionController instance" do
    setup do
      @controller = ApplicationController.new
      @request    = ActionController::TestRequest.new
      @response   = ActionController::TestResponse.new
    end

    should "sanitize HTML when containing <i18n> tags" do
      # Rich::I18n::Actionpack::ActionView::Sanitizor.expects(:render_with_rich_i18n).returns "Hi!"
      get :index
      assert_response :success
    end
  end

end