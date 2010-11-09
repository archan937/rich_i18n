require "generators/rich_i18n"

module Rich
  module Generators

    class TranslationGenerator < ::RichI18n::Generators::Base

      include Rails::Generators::Migration
      include RichI18n::Generators::Migration

      desc         "Creates Rich-i18n translation model and migration."
      argument     :model_name, :type => :string , :default => "translation"
      class_option :migrate   , :type => :boolean, :default => false, :aliases => "-m", :desc => "Run 'rake db:migrate' after generating model and migration"

      def enable_i18n_cms
        filename = "config/initializers/enrichments.rb"
        line     = "\nRich::I18n::Engine.enable_i18n_cms"

        create_file filename unless File.exists?(filename)
        return if File.open(filename).readlines.collect(&:strip).include? line.strip

        File.open(filename, "a+") do |file|
          file << line
        end
      end

      def generate_model
        template "model.rb", "app/models/#{model_file_name}.rb"
      end

      def generate_migration
        migration_template "migration.rb", "db/migrate/create_#{table_name}"
      end

      def migrate
        rake "db:migrate" if options[:migrate]
      end

    protected

      def model_file_name
        model_name.underscore
      end

      def model_class_name
        model_name.classify
      end

      def migration_class_name
        migration_file_name.pluralize.camelize
      end

      def table_name
        model_file_name.underscore.gsub("/", "_").pluralize
      end

    end

  end
end