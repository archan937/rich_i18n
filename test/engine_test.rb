require "test_helper"

module Rich
  module I18n
    module Test

      class EngineTest < ActiveSupport::TestCase
        setup do
          include Setup
          I18n.locale = Engine.init(Locales::NL)
        end
      
        # test "something" do
        #   assert true
        # end
      end
    
    end
  end
end