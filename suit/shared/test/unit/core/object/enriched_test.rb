require File.expand_path("../../../../test_helper.rb", __FILE__)

module Core
  module Object
    class EnrichedTest < ActiveSupport::TestCase

      context "An Object" do
        setup do
          class Foo; end
        end

        should "respond to enriched?" do
          assert Foo.new.respond_to?(:enriched?)
        end

        should "return false when calling :enriched?" do
          assert !Foo.new.enriched?
        end
      end

    end
  end
end