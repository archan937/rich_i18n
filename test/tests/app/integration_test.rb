require File.expand_path("../../../test_helper.rb", __FILE__)

module App
  class IntegrationTest < ActionController::IntegrationTest
    fixtures :translations

    context "Rich-i18n" do
      should "render as expected" do
        visit "/"
        page.execute_script "$('#page .content .left').append('Hi, my name is Paul Engel!')"
        assert page.has_content? "Test Application"
      end
    end

  end
end