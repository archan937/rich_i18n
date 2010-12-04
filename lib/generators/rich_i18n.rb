require "rails/generators/named_base"

module RichI18n
  module Generators

    class Base < Rails::Generators::Base
      def self.source_root
        File.expand_path "../rich/#{generator_name}/templates", __FILE__
      end
    end

    module Migration
      def self.included(base)
        base.extend ClassMethods
      end

      module ClassMethods
        def next_migration_number(dirname)
          Time.now.strftime "%Y%m%d%H%M%S"
        end
      end
    end

  end
end