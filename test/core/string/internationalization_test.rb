require File.expand_path(File.join(File.dirname(__FILE__), "..", "..", "test_helper.rb"))

module Rich
  module I18n
    module Test
      module Core
        module String

          class InternationalizationTest < ActiveSupport::TestCase
            setup do
              include Setup
            end

            # test "t" do
            #   assert true
            # end
          end

        end
      end
    end
  end
end