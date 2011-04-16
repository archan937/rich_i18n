require "rubygems"
require "gem_suit"

class SuitApplication < GemSuit::Application

  def prepare
    generate_translation_model
  end

  def restore_files
    delete  "db/migrate/*.rb"
    delete  "test/fixtures/translations.yml"
    delete  "test/unit/translation_test.rb"
  end

  def stash_files
    delete "db/migrate/*.rb"
    stash  "app/models/*.rb"
    stash  "config/initializers/enrichments.rb"
  end

private

  def generate_translation_model
    generate generator_for(:translation), "Translation"
  end

  def generator_for(type)
    case rails_version
    when 2
      "rich_#{type}"
    when 3
      "rich:#{type}"
    end
  end

end