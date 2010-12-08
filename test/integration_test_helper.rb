# http://techiferous.com/2010/04/using-capybara-in-rails-3 FTW!

require "capybara/rails"
require "capybara/envjs"

module ActionController
  class IntegrationTest
    include Capybara
  end
end

Capybara.current_driver = :envjs