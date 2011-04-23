require File.expand_path("../translation/base.rb"              , __FILE__)
require File.expand_path("../translation/storage.rb"           , __FILE__)
require File.expand_path("../translation/identification.rb"    , __FILE__)
require File.expand_path("../translation/rendering.rb"         , __FILE__)
require File.expand_path("../translation/string_enrichments.rb", __FILE__)

module Rich
  module I18n
    module Translation

      def self.included(base)
        base.send :include, Base
        base.send :include, Storage
        base.send :include, Identification
        base.send :include, Rendering
        base.send :include, StringEnrichments
      end

    end
  end
end

class Translation
  include Rich::I18n::Translation
end