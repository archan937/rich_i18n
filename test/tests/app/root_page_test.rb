require File.expand_path("../../../test_helper.rb", __FILE__)

module App
  class RootPageTest < ActionController::IntegrationTest

    context "The root page" do
      should "return a 200 status" do
        visit "/"
        save_and_open_page
        assert page.has_content?("Test Application")
      end
    end

  end
end