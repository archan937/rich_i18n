require File.expand_path("../../../test_helper.rb", __FILE__)

module App
  class RootPageTest < ActionController::IntegrationTest

    context "The root page" do
      should "render as expected" do
        visit "/"
        page.execute_script("$('#page .content .left').append('Hi, my name is Paul Engel!')")
        save_and_open_page
        assert page.has_content?("Test Application")
      end
    end

  end
end